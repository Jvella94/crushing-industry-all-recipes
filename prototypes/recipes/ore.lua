log("Creating ore recipes")

-- Icons
local ironOreIcon = "__base__/graphics/icons/iron-ore.png"
local copperOreIcon = "__base__/graphics/icons/copper-ore.png"
local tungstenOreIcon = "__space-age__/graphics/icons/tungsten-ore.png"
local crushedIronOreIcon = "__crushing-industry__/graphics/icons/crushed-iron-ore.png"
local crushedCopperOreIcon = "__crushing-industry__/graphics/icons/crushed-copper-ore.png"
local crushedTungstenOreIcon = "__crushing-industry__/graphics/icons/crushed-tungsten-ore.png"
local enrichedIronOreIcon = "__enriching-industry__/graphics/icons/enriched-iron-ore.png"
local enrichedCopperOreIcon = "__enriching-industry__/graphics/icons/enriched-copper-ore.png"
local enrichedTungstenOreIcon = "__enriching-industry__/graphics/icons/enriched-tungsten-ore.png"
local moltenIronIcon = "__space-age__/graphics/icons/fluid/molten-iron.png"
local moltenCopperIcon = "__space-age__/graphics/icons/fluid/molten-copper.png"
local tungstenPlateIcon = "__space-age__/graphics/icons/tungsten-plate.png"

local restore_vanilla = settings.startup["restore-recipes-to-vanilla"].value
if mods["space-age"] then
    if mods["enriching-industry"] then
        if restore_vanilla then
            duplicate_recipe_and_replace_ingredient("iron-ore-melting", moltenIronIcon, "crushed-iron-ore", 75, "ei-enriched-iron-ore", enrichedIronOreIcon)
            duplicate_recipe_and_replace_ingredient("iron-ore-melting", moltenIronIcon, "iron-ore", 50, "crushed-iron-ore", crushedIronOreIcon, 2)
            duplicate_recipe_and_replace_ingredient("copper-ore-melting", moltenCopperIcon, "crushed-copper-ore", 75, "ei-enriched-copper-ore", enrichedCopperOreIcon)
            duplicate_recipe_and_replace_ingredient("copper-ore-melting", moltenCopperIcon, "copper-ore", 50, "crushed-copper-ore", crushedCopperOreIcon, 2)
            duplicate_recipe_and_replace_ingredient("tungsten-plate", tungstenPlateIcon, "crushed-tungsten-ore", 8, "ei-enriched-tungsten-ore", enrichedTungstenOreIcon)
            duplicate_recipe_and_replace_ingredient("tungsten-plate", tungstenPlateIcon, "tungsten-ore", 4, "crushed-tungsten-ore", crushedTungstenOreIcon, 2)
        else
            duplicate_recipe_and_replace_ingredient("iron-ore-melting", moltenIronIcon, "crushed-iron-ore", 75, "ei-enriched-iron-ore", enrichedIronOreIcon)
            duplicate_recipe_and_replace_ingredient("iron-ore-melting", moltenIronIcon, "iron-ore", 50, "ei-enriched-iron-ore", ironOreIcon, 2)
            duplicate_recipe_and_replace_ingredient("copper-ore-melting", moltenCopperIcon, "crushed-copper-ore", 75, "ei-enriched-copper-ore", enrichedCopperOreIcon)
            duplicate_recipe_and_replace_ingredient("copper-ore-melting", moltenCopperIcon, "copper-ore", 50, "ei-enriched-copper-ore", copperOreIcon, 2)
            duplicate_recipe_and_replace_ingredient("tungsten-plate", tungstenPlateIcon, "crushed-tungsten-ore", 8, "ei-enriched-tungsten-ore", enrichedTungstenOreIcon)
            duplicate_recipe_and_replace_ingredient("tungsten-plate", tungstenPlateIcon, "tungsten-ore", 4, "ei-enriched-tungsten-ore", tungstenOreIcon, 2)
        end
    else
        duplicate_recipe_and_replace_ingredient("iron-ore-melting", moltenIronIcon, "iron-ore", 50, "crushed-iron-ore", crushedIronOreIcon)
        duplicate_recipe_and_replace_ingredient("copper-ore-melting", moltenCopperIcon, "copper-ore", 50, "crushed-copper-ore", crushedCopperOreIcon)
        duplicate_recipe_and_replace_ingredient("tungsten-plate", tungstenPlateIcon, "tungsten-ore", 4, "crushed-tungsten-ore", crushedTungstenOreIcon)
    end
    duplicate_recipe_and_replace_ingredient("advanced-thruster-oxidizer", "__space-age__/graphics/icons/fluid/thruster-oxidizer.png", "iron-ore", 2, "crushed-iron-ore", crushedIronOreIcon)
end
if mods["scrap-industry"] and mods["scrap-industry"] >= "0.8.0" then
    duplicate_recipe_and_replace_ingredient("fluoroketone", "__space-age__/graphics/icons/fluid/fluoroketone-hot.png", "lithium", 1, "lithium-dust", 2, "__scrap-industry__/graphics/icons/lithium-powder.png")
end

if mods["molten-tungsten"] then
    duplicate_recipe_and_replace_ingredient("molten-tungsten", "__molten-tungsten__/graphics/molten-tungsten.png", "tungsten-ore", 50, "crushed-tungsten-ore", crushedTungstenOreIcon)
end
if settings.startup["crushing-industry-concrete-mix"].value then
    local ftech = require("__fdsl__.lib.technology")
    ftech.add_unlock("concrete", "concrete-mix")
    duplicate_recipe_and_replace_ingredient("concrete-mix", "__crushing-industry__/graphics/icons/fluid/concrete-mix.png", "stone-brick", 5, "sand", "__crushing-industry__/graphics/icons/sand.png")
else
    duplicate_recipe_and_replace_ingredient("concrete", "__base__/graphics/icons/concrete.png", "iron-ore", 1, "crushed-iron-ore", crushedIronOreIcon)
end