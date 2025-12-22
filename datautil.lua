local frep = require("__fdsl__.lib.recipe")
-- read startup setting (data stage)
local restore_vanilla = settings.startup["restore-recipes-to-vanilla"].value
local function makeLayeredIcon(icontable, secondary_icon, manyicons)
    if manyicons then
        local newicontable = {}
        for _, icon in ipairs(icontable) do
            table.insert(newicontable, icon)
        end
        table.insert(newicontable, {
            icon = secondary_icon,
            scale = 0.25,
            shift = {-8, 8}
        })
        return newicontable
    else
        return {{
            icon = icontable
        }, {
            icon = secondary_icon,
            scale = 0.3,
            shift = {-8, -8}
        }}
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

function restore_another_vanilla_ingredient(original_recipe_name, vanilla_ingredient_name, vanilla_ingredient_amount, crushed_ingredient_name)
    if restore_vanilla then
        -- original remains vanilla; replace any crushed ingredient references back to the vanilla one
        frep.replace_ingredient(original_recipe_name, crushed_ingredient_name, {type="item", name=vanilla_ingredient_name, amount=vanilla_ingredient_amount})
    else
        -- reversed mode: the vanilla recipe was created as "-vanilla"
        local target = original_recipe_name .. "-vanilla"
        frep.replace_ingredient(target, crushed_ingredient_name, {type="item", name=vanilla_ingredient_name, amount=vanilla_ingredient_amount})
    end
end

-- Duplicates the recipe and replaces ingredient added by Crushing Industry 
function duplicate_recipe_and_replace_ingredient(original_recipe_name, original_recipe_icon, original_ingredient_name, original_ingredient_amount, crushed_ingredient_name, crushed_ingredient_amount, crushed_ingredient_icon)
    if restore_vanilla then
        -- default behavior: leave original recipe as vanilla (restore if it used crushed),
        -- create a new "-modded" variant that uses crushed ingredients and gets an overlay icon
        frep.replace_ingredient(original_recipe_name, crushed_ingredient_name, {type="item", name=original_ingredient_name, amount=original_ingredient_amount})
        local original_recipe = data.raw.recipe[original_recipe_name]
        local new_recipe = table.deepcopy(original_recipe)
        new_recipe.name = original_recipe_name .. "-modded"
        new_recipe.icons = makeLayeredIcon(original_recipe_icon, crushed_ingredient_icon, false)
        data:extend{new_recipe}
        copy_recipe_unlock(original_recipe_name, new_recipe.name)
        frep.replace_ingredient(new_recipe.name, original_ingredient_name, {type="item", name=crushed_ingredient_name, amount=crushed_ingredient_amount})
    else
        -- reversed behavior: make the original recipe use crushed ingredients (crushed becomes the default),
        -- and create a "-vanilla" copy that contains the original (vanilla) ingredients and icon
        -- frep.replace_ingredient(original_recipe_name, original_ingredient_name, {type="item", name=crushed_ingredient_name, amount=crushed_ingredient_amount})
        local original_recipe = data.raw.recipe[original_recipe_name]
        -- set the original recipe's icon to show the crushed overlay (so default name corresponds to crushed)
        local new_recipe = table.deepcopy(original_recipe)
        new_recipe.name = original_recipe_name .. "-vanilla"
        -- give the vanilla copy the plain original icon
        new_recipe.icons = {{ icon = original_recipe_icon }}
        data:extend{new_recipe}
        copy_recipe_unlock(original_recipe_name, new_recipe.name)
        -- restore the vanilla ingredient on the "-vanilla" copy
        frep.replace_ingredient(new_recipe.name, crushed_ingredient_name, {type="item", name=original_ingredient_name, amount=original_ingredient_amount})
        original_recipe.icons = makeLayeredIcon(original_recipe_icon, crushed_ingredient_icon, false)
    end
end

-- Duplicates the recipe and removes ingredient added by Crushing Industry
function duplicate_recipe_and_remove_ingredient(original_recipe_name, original_recipe_icon, crushed_ingredient_name, crushed_ingredient_icon)
    if restore_vanilla then
        -- default behavior: leave original recipe as vanilla,
        -- create a new "-modded" variant that uses crushed ingredients and gets an overlay icon
        local original_recipe = data.raw.recipe[original_recipe_name]
        local new_recipe = table.deepcopy(original_recipe)
        new_recipe.name = original_recipe_name .. "-modded"
        new_recipe.icons = makeLayeredIcon(original_recipe_icon, crushed_ingredient_icon, false)
        data:extend{new_recipe}
        copy_recipe_unlock(original_recipe_name, new_recipe.name)
        frep.remove_ingredient(original_recipe.name, crushed_ingredient_name)
    else
        -- reversed behavior: keep the original recipe using crushed ingredients (crushed becomes the default),
        -- and create a "-vanilla" copy that contains the original (vanilla) ingredients and icon
        local original_recipe = data.raw.recipe[original_recipe_name]
        local new_recipe = table.deepcopy(original_recipe)
        new_recipe.name = original_recipe_name .. "-vanilla"
        -- give the vanilla copy the plain original icon
        new_recipe.icons = {{ icon = original_recipe_icon}}
        data:extend{new_recipe}
        copy_recipe_unlock(original_recipe_name, new_recipe.name)
        -- restore the vanilla ingredient on the "-vanilla" copy
        frep.remove_ingredient(new_recipe.name, crushed_ingredient_name)
        -- set the original recipe's icon to show the crushed ingredient overlay
        original_recipe.icons = makeLayeredIcon(original_recipe_icon, crushed_ingredient_icon, false)
    end
end