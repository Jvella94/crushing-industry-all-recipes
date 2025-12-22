log("Adding back non optical fiber recipes")

duplicate_recipe_and_replace_ingredient("advanced-circuit", "__base__/graphics/icons/advanced-circuit.png", "copper-cable", 4, "optical-fiber", 4, "__crushing-industry__/graphics/icons/optical-fiber.png")
duplicate_recipe_and_replace_ingredient("beacon", "__base__/graphics/icons/beacon.png", "copper-cable", 10, "optical-fiber", 10, "__crushing-industry__/graphics/icons/optical-fiber.png")

duplicate_recipe_and_remove_ingredient("processing-unit", "__base__/graphics/icons/processing-unit.png", "optical-fiber", "__crushing-industry__/graphics/icons/optical-fiber.png")
duplicate_recipe_and_replace_ingredient("selector-combinator", "__base__/graphics/icons/selector-combinator.png","iron-gear-wheel",5, "optical-fiber", 10, "__crushing-industry__/graphics/icons/optical-fiber.png")
duplicate_recipe_and_remove_ingredient("roboport", "__base__/graphics/icons/roboport.png", "optical-fiber", "__crushing-industry__/graphics/icons/optical-fiber.png")
duplicate_recipe_and_remove_ingredient("personal-roboport-equipment", "__base__/graphics/icons/personal-roboport-equipment.png", "optical-fiber", "__crushing-industry__/graphics/icons/optical-fiber.png")

local frep = require("__fdsl__.lib.recipe")
local restore_vanilla = settings.startup["restore-recipes-to-vanilla"].value
if restore_vanilla then
    frep.modify_ingredient("processing-unit", "electronic-circuit", {amount=20})
    frep.modify_ingredient("processing-unit-modded", "electronic-circuit", {amount=15})
    frep.scale_ingredient("advanced-circuit", "plastic-bar", {amount=2})
else
    frep.modify_ingredient("processing-unit", "electronic-circuit", {amount=15})
    frep.modify_ingredient("processing-unit-vanilla", "electronic-circuit", {amount=20})
    frep.scale_ingredient("advanced-circuit-vanilla", "plastic-bar", {amount=2})
end
