log("Creating ore recipes")
duplicate_recipe_and_replace_ingredient("concrete","__base__/graphics/icons/concrete.png", "iron-ore", 1, "crushed-iron-ore", 1, "__crushing-industry__/graphics/icons/crushed-iron-ore.png")
if settings.startup["crushing-industry-concrete-mix"].value then
    duplicate_recipe_and_replace_ingredient("concrete-mix","__crushing-industry__/graphics/icons/fluid/concrete-mix.png", "iron-ore", 1, "crushed-iron-ore", 1, "__crushing-industry__/graphics/icons/crushed-iron-ore.png")
end
if mods["space-age"] then
    duplicate_recipe_and_replace_ingredient("holmium-solution", "__space-age__/graphics/icons/fluid/holmium-solution.png", "stone", 1, "sand", 2, "__crushing-industry__/graphics/icons/sand.png")
    duplicate_recipe_and_replace_ingredient("electrolyte","__space-age__/graphics/icons/fluid/electrolyte.png", "stone", 1, "sand", 3, "__crushing-industry__/graphics/icons/sand.png")
    restore_another_vanilla_ingredient("holmium-solution", "holmium-ore", 2,"holmium-powder")
    duplicate_recipe_and_replace_ingredient("molten-iron","__space-age__/graphics/icons/fluid/molten-iron.png", "iron-ore", 50, "crushed-iron-ore", 75, "__crushing-industry__/graphics/icons/crushed-iron-ore.png")
    duplicate_recipe_and_replace_ingredient("molten-copper","__space-age__/graphics/icons/fluid/molten-copper.png", "copper-ore", 50, "crushed-copper-ore", 75, "__crushing-industry__/graphics/icons/crushed-copper-ore.png")
    duplicate_recipe_and_replace_ingredient("advanced-thruster-oxidizer","__space-age__/graphics/icons/fluid/thruster-oxidizer.png", "iron-ore", 2, "crushed-iron-ore", 4, "__crushing-industry__/graphics/icons/crushed-iron-ore.png")
    duplicate_recipe_and_replace_ingredient("tungsten-plate","__space-age__/graphics/icons/tungsten-plate.png", "tungsten-ore", 4, "crushed-tungsten-ore", 8, "__crushing-industry__/graphics/icons/crushed-tungsten-ore.png")
end

if mods["scrap-industry"] and mods["scrap-industry"] >= "0.8.0" then
    duplicate_recipe_and_replace_ingredient("fluoroketone","__space-age__/graphics/icons/fluid/fluoroketone-hot.png", "lithium",1, "lithium-dust", 2, "__scrap-industry__/graphics/icons/lithium-powder.png")
end

if mods["molten-tungsten"] then
    duplicate_recipe_and_replace_ingredient("molten-tungsten", "__molten-tungsten__/graphics/molten-tungsten.png", "tungsten-ore", 50, "crushed-tungsten-ore", 75)
end