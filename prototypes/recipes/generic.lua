local restore_vanilla = settings.startup["restore-recipes-to-vanilla"].value
if mods["space-age"] then
    if mods["enriching-industry"] and settings.startup["crushing-industry-glass"].value then
        if restore_vanilla then
            duplicate_recipe_and_replace_ingredient("holmium-solution", "__space-age__/graphics/icons/fluid/holmium-solution.png", "sand", 2, "ei-quartz", "__enriching-industry__/graphics/icons/quartz.png")
            duplicate_recipe_and_replace_ingredient("holmium-solution", "__space-age__/graphics/icons/fluid/holmium-solution.png", "stone", 1, "sand", "__crushing-industry__/graphics/icons/sand.png", 2)
            restore_another_vanilla_ingredient("holmium-solution", "holmium-ore", 2, "holmium-powder", 2)
            duplicate_recipe_and_replace_ingredient("electrolyte", "__space-age__/graphics/icons/fluid/electrolyte.png", "sand", 3, "ei-quartz", "__enriching-industry__/graphics/icons/quartz.png")
            duplicate_recipe_and_replace_ingredient("electrolyte", "__space-age__/graphics/icons/fluid/electrolyte.png", "stone", 1, "sand", "__crushing-industry__/graphics/icons/sand.png", 2)
        else
            duplicate_recipe_and_replace_ingredient("holmium-solution", "__space-age__/graphics/icons/fluid/holmium-solution.png", "sand", 2, "ei-quartz", "__enriching-industry__/graphics/icons/quartz.png")
            duplicate_recipe_and_replace_ingredient("holmium-solution", "__space-age__/graphics/icons/fluid/holmium-solution.png", "stone", 1, "ei-quartz", "__base__/graphics/icons/stone.png", 2)
            restore_another_vanilla_ingredient("holmium-solution", "holmium-ore", 2, "holmium-powder", 2)
            duplicate_recipe_and_replace_ingredient("electrolyte", "__space-age__/graphics/icons/fluid/electrolyte.png", "sand", 3, "ei-quartz", "__enriching-industry__/graphics/icons/quartz.png")
            duplicate_recipe_and_replace_ingredient("electrolyte", "__space-age__/graphics/icons/fluid/electrolyte.png", "stone", 1, "ei-quartz", "__base__/graphics/icons/stone.png", 2)
        end
    else
        duplicate_recipe_and_replace_ingredient("holmium-solution", "__space-age__/graphics/icons/fluid/holmium-solution.png", "stone", 1, "sand", "__crushing-industry__/graphics/icons/sand.png")
        restore_another_vanilla_ingredient("holmium-solution", "holmium-ore", 2, "holmium-powder")
        duplicate_recipe_and_replace_ingredient("electrolyte", "__space-age__/graphics/icons/fluid/electrolyte.png", "stone", 1, "sand", "__crushing-industry__/graphics/icons/sand.png")
    end
end