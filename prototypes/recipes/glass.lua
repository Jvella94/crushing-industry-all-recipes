log("Creating glass recipes")
duplicate_recipe_and_remove_ingredient("lab", "__base__/graphics/icons/lab.png", "glass", "__crushing-industry__/graphics/icons/glass.png")
duplicate_recipe_and_replace_ingredient("chemical-plant", "__base__/graphics/icons/chemical-plant.png","iron-gear-wheel",5, "glass", 10, "__crushing-industry__/graphics/icons/glass.png")
duplicate_recipe_and_remove_ingredient("solar-panel", "__base__/graphics/icons/solar-panel.png", "glass", "__crushing-industry__/graphics/icons/glass.png")
duplicate_recipe_and_remove_ingredient("night-vision-equipment", "__base__/graphics/icons/night-vision-equipment.png", "glass", "__crushing-industry__/graphics/icons/glass.png")
duplicate_recipe_and_remove_ingredient("display-panel", "__base__/graphics/icons/display-panel.png", "glass", "__crushing-industry__/graphics/icons/glass.png")
duplicate_recipe_and_remove_ingredient("small-lamp", "__base__/graphics/icons/small-lamp.png", "glass", "__crushing-industry__/graphics/icons/glass.png")
duplicate_recipe_and_remove_ingredient("laser-turret", "__base__/graphics/icons/laser-turret.png", "glass", "__crushing-industry__/graphics/icons/glass.png")
duplicate_recipe_and_remove_ingredient("rail-signal", "__base__/graphics/icons/rail-signal.png", "glass", "__crushing-industry__/graphics/icons/glass.png")
duplicate_recipe_and_remove_ingredient("rail-chain-signal", "__base__/graphics/icons/rail-chain-signal.png", "glass", "__crushing-industry__/graphics/icons/glass.png")
if mods["space-age"] then
    duplicate_recipe_and_remove_ingredient("biochamber", "__space-age__/graphics/icons/biochamber.png", "glass", "__crushing-industry__/graphics/icons/glass.png")
    duplicate_recipe_and_remove_ingredient("agricultural-tower", "__space-age__/graphics/icons/agricultural-tower.png", "glass", "__crushing-industry__/graphics/icons/glass.png")
    duplicate_recipe_and_remove_ingredient("cryogenic-plant", "__space-age__/graphics/icons/cryogenic-plant.png", "glass", "__crushing-industry__/graphics/icons/glass.png")
    if settings.startup["crushing-industry-byproducts"].value and not mods["science-bottles"] then
        duplicate_recipe_and_remove_ingredient("space-science-pack", "__base__/graphics/icons/space-science-pack.png", "glass", "__crushing-industry__/graphics/icons/glass.png")
    end
end