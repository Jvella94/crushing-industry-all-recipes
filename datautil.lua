local frep = require("__fdsl__.lib.recipe")
-- read startup setting (data stage)
local restore_vanilla = settings.startup["restore-recipes-to-vanilla"].value
function makeLayeredIcon(icontable, secondary_icon, manyicons)
    if manyicons then
        local newicontable = {}
        for _, icon in ipairs(icontable) do
            table.insert(newicontable, icon)
        end
        table.insert(newicontable, {
            icon = secondary_icon,
            scale = 0.25,
            shift = { -8, 8 }
        })
        return newicontable
    else
        return { {
            icon = icontable
        }, {
            icon = secondary_icon,
            scale = 0.3,
            shift = { -8, -8 }
        } }
    end
end

function copy_recipe_unlock(old_recipe, new_recipe)
    for _, tech in pairs(data.raw.technology) do
        if tech.effects then
            for _, effect in pairs(tech.effects) do
                if effect.type == "unlock-recipe" and effect.recipe == old_recipe then
                    -- add unlock for the new recipe
                    table.insert(tech.effects, {
                        type = "unlock-recipe",
                        recipe = new_recipe
                    })
                    break
                end
            end
        end
    end
end

function restore_another_vanilla_ingredient(original_recipe_name, vanilla_ingredient_name, vanilla_ingredient_amount, crushed_ingredient_name, suffix)
    if restore_vanilla then
        -- original remains vanilla; replace any crushed ingredient references back to the vanilla one
        frep.replace_ingredient(original_recipe_name, crushed_ingredient_name, { type = "item", name = vanilla_ingredient_name, amount = vanilla_ingredient_amount })
    else
        -- reversed mode: the vanilla recipe was created as "-vanilla"
        suffix = suffix or 0                                                 -- Default to 0 (no effect); use nil explicitly to skip
        local suffix_str = (suffix ~= 0) and ("-" .. tostring(suffix)) or "" -- Convert to "-N" or empty
        local target = original_recipe_name .. "-vanilla" .. suffix_str
        frep.replace_ingredient(target, crushed_ingredient_name, { type = "item", name = vanilla_ingredient_name, amount = vanilla_ingredient_amount })
    end
end

-- Duplicates the recipe and replaces ingredient added by Crushing Industry
function duplicate_recipe_and_replace_ingredient(original_recipe_name, original_recipe_icon, original_ingredient_name, original_ingredient_amount,
                                                 crushed_ingredient_name, crushed_ingredient_icon, suffix)
    suffix = suffix or 0                                                 -- Default to 0 (no effect); use nil explicitly to skip
    local suffix_str = (suffix ~= 0) and ("-" .. tostring(suffix)) or "" -- Convert to "-N" or empty
    local original_recipe = data.raw.recipe[original_recipe_name]
    local new_recipe = table.deepcopy(original_recipe)
    if restore_vanilla then
        new_recipe.name = original_recipe_name .. "-modded" .. suffix_str -- Append suffix here
        new_recipe.icons = makeLayeredIcon(original_recipe_icon, crushed_ingredient_icon, false)
        data:extend { new_recipe }
        copy_recipe_unlock(original_recipe_name, new_recipe.name)
        frep.replace_ingredient(original_recipe_name, crushed_ingredient_name, { type = "item", name = original_ingredient_name, amount = original_ingredient_amount })
    else
        new_recipe.name = original_recipe_name .. "-vanilla" .. suffix_str -- And here
        if suffix ~= 0 then
            new_recipe.icons = makeLayeredIcon(original_recipe_icon, crushed_ingredient_icon, false)
        else
            new_recipe.icons = { { icon = original_recipe_icon } }
        end
        data:extend { new_recipe }
        copy_recipe_unlock(original_recipe_name, new_recipe.name)
        log("Replacing ingredient in recipe " .. new_recipe.name)
        frep.replace_ingredient(new_recipe.name, crushed_ingredient_name, { type = "item", name = original_ingredient_name, amount = original_ingredient_amount })
        log("Setting icon to original recipe " .. original_recipe_name .. " of crushed_ingredient_icon " .. crushed_ingredient_icon)
        if suffix == 0 then
            original_recipe.icons = makeLayeredIcon(original_recipe_icon, crushed_ingredient_icon, false)
        end
    end
end

-- Duplicates the recipe and removes ingredient added by Crushing Industry
function duplicate_recipe_and_remove_ingredient(original_recipe_name, original_recipe_icon, crushed_ingredient_name, crushed_ingredient_icon)
    local original_recipe = data.raw.recipe[original_recipe_name]
    local new_recipe = table.deepcopy(original_recipe)
    if restore_vanilla then
        -- default behavior: leave original recipe as vanilla,
        -- create a new "-modded" variant that uses crushed ingredients and gets an overlay icon
        new_recipe.name = original_recipe_name .. "-modded"
        new_recipe.icons = makeLayeredIcon(original_recipe_icon, crushed_ingredient_icon, false)
        data:extend { new_recipe }
        copy_recipe_unlock(original_recipe_name, new_recipe.name)
        frep.remove_ingredient(original_recipe.name, crushed_ingredient_name)
    else
        -- reversed behavior: keep the original recipe using crushed ingredients (crushed becomes the default),
        -- and create a "-vanilla" copy that contains the original (vanilla) ingredients and icon
        new_recipe.name = original_recipe_name .. "-vanilla"
        -- give the vanilla copy the plain original icon
        new_recipe.icons = (original_recipe.icons ~= nil) and (original_recipe.icons) or ({ { icon = original_recipe_icon } })
        data:extend { new_recipe }
        copy_recipe_unlock(original_recipe_name, new_recipe.name)
        -- restore the vanilla ingredient on the "-vanilla" copy
        frep.remove_ingredient(new_recipe.name, crushed_ingredient_name)
        -- set the original recipe's icon to show the crushed ingredient overlay
        original_recipe.icons = makeLayeredIcon(original_recipe_icon, crushed_ingredient_icon, false)
    end
end