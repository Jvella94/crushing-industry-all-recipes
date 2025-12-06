log("Creating coal recipes")
duplicate_recipe_and_replace_ingredient("coal-liquefaction", "__base__/graphics/icons/fluid/coal-liquefaction.png", "coal", 10, "crushed-coal", mods["space-age"] and 25 or 15, "__crushing-industry__/graphics/icons/crushed-coal.png")
duplicate_recipe_and_replace_ingredient("explosives", "__base__/graphics/icons/explosives.png", "coal", 1, "crushed-coal", 2, "__crushing-industry__/graphics/icons/crushed-coal.png")
duplicate_recipe_and_replace_ingredient("plastic-bar", "__base__/graphics/icons/plastic-bar.png", "coal", 1, "crushed-coal", 2, "__crushing-industry__/graphics/icons/crushed-coal.png")
duplicate_recipe_and_replace_ingredient("poison-capsule", "__base__/graphics/icons/poison-capsule.png", "coal", 10, "crushed-coal", 10, "__crushing-industry__/graphics/icons/crushed-coal.png")
duplicate_recipe_and_replace_ingredient("slowdown-capsule", "__base__/graphics/icons/slowdown-capsule.png", "coal", 10, "crushed-coal", 10, "__crushing-industry__/graphics/icons/crushed-coal.png")
if mods["space-age"] then
    duplicate_recipe_and_replace_ingredient("carbon", "__space-age__/graphics/icons/carbon.png", "coal", 2, "crushed-coal", 2, "__crushing-industry__/graphics/icons/crushed-coal.png")
end
