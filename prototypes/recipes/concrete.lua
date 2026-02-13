local frep = require("__fdsl__.lib.recipe")
local restore_vanilla = settings.startup["restore-recipes-to-vanilla"].value
local original_recipe_name = "concrete"
local original_recipe_icon = "__base__/graphics/icons/concrete.png"
local modded_recipe_icon = "__crushing-industry__/graphics/icons/fluid/concrete-mix.png"
if mods["space-age"] then
    data.raw.recipe["concrete-from-molten-iron"].hidden = false
end

if restore_vanilla then
    -- default behavior: leave original recipe as vanilla (restore if it used crushed),
    -- create a new "-modded" variant that uses crushed ingredients and gets an overlay icon
    local original_recipe = data.raw.recipe[original_recipe_name]
    local new_recipe = table.deepcopy(original_recipe)
    new_recipe.name = "concrete-modded"
    new_recipe.icons = makeLayeredIcon(original_recipe_icon, modded_recipe_icon, false)
    data:extend { new_recipe }
    copy_recipe_unlock(original_recipe_name, new_recipe.name)
    data.raw.recipe[original_recipe_name].ingredients = { { type = "fluid", name = "water", amount = 100 }, { type = "item", name = "iron-ore", amount = 1 }, { type = "item", name = "stone-brick", amount = 5 } }
    data.raw.recipe[original_recipe_name].auto_recycle = true
    if settings.startup["crushing-industry-ore"].value and settings.startup["restore-ore-recipes"].value then
        local alternate_recipe = table.deepcopy(original_recipe)
        alternate_recipe.name = "concrete-modded-crushed-iron"
        alternate_recipe.icons = makeLayeredIcon(original_recipe_icon, "__crushing-industry__/graphics/icons/crushed-iron-ore.png", false)
        data:extend { alternate_recipe }
        copy_recipe_unlock(original_recipe_name, alternate_recipe.name)
        frep.replace_ingredient(alternate_recipe.name, "iron-ore", { type = "item", name = "crushed-iron-ore", amount = 2 })
    end
else
    -- reversed behavior: make the original recipe use crushed ingredients (crushed becomes the default),
    -- and create a "-vanilla" copy that contains the original (vanilla) ingredients and icon
    -- frep.replace_ingredient(original_recipe_name, original_ingredient_name, {type="item", name=crushed_ingredient_name, amount=crushed_ingredient_amount})
    local original_recipe = data.raw.recipe[original_recipe_name]
    original_recipe.icons = makeLayeredIcon(original_recipe_icon, modded_recipe_icon, false)
    -- set the original recipe's icon to show the crushed overlay (so default name corresponds to crushed)
    local new_recipe = table.deepcopy(original_recipe)
    new_recipe.name = "concrete-vanilla"
    -- give the vanilla copy the plain original icon
    new_recipe.icons = { { icon = original_recipe_icon } }
    -- restore ingredients on the "-vanilla" copy
    new_recipe.ingredients = { { type = "fluid", name = "water", amount = 100 }, { type = "item", name = "iron-ore", amount = 1 }, { type = "item", name = "stone-brick", amount = 5 } }
    new_recipe.auto_recycle = true
    data:extend { new_recipe }
    copy_recipe_unlock(original_recipe_name, new_recipe.name)
    if settings.startup["crushing-industry-ore"].value and settings.startup["restore-ore-recipes"].value then
        local alternate_recipe = table.deepcopy(new_recipe)
        alternate_recipe.name = "concrete-modded-crushed-iron"
        alternate_recipe.icons = makeLayeredIcon(original_recipe_icon, "__crushing-industry__/graphics/icons/crushed-iron-ore.png", false)
        data:extend { alternate_recipe }
        copy_recipe_unlock(original_recipe_name, alternate_recipe.name)
        frep.replace_ingredient(alternate_recipe.name, "iron-ore", { type = "item", name = "crushed-iron-ore", amount = 2 })
    end
end