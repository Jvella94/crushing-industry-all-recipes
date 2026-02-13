if mods["space-age"] then
    if mods["enriching-industry"] and settings.startup["crushing-industry-glass"].value then
        duplicate_recipe_and_replace_ingredient("holmium-solution", "__space-age__/graphics/icons/fluid/holmium-solution.png", "stone", 1, "ei-quartz", 3, "__enriching-industry__/graphics/icons/quartz.png")
        restore_another_vanilla_ingredient("holmium-solution", "holmium-ore", 2, "holmium-powder")
        duplicate_recipe_and_replace_ingredient("electrolyte", "__space-age__/graphics/icons/fluid/electrolyte.png", "stone", 1, "ei-quartz", 4, "__enriching-industry__/graphics/icons/quartz.png")
    else
        duplicate_recipe_and_replace_ingredient("holmium-solution", "__space-age__/graphics/icons/fluid/holmium-solution.png", "stone", 1, "sand", 2, "__crushing-industry__/graphics/icons/sand.png")
        restore_another_vanilla_ingredient("holmium-solution", "holmium-ore", 2, "holmium-powder")
        duplicate_recipe_and_replace_ingredient("electrolyte", "__space-age__/graphics/icons/fluid/electrolyte.png", "stone", 1, "sand", 3, "__crushing-industry__/graphics/icons/sand.png")
    end
end