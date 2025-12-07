local ftech = require("__fdsl__.lib.technology")
local frep = require("__fdsl__.lib.recipe")
local subgroup = mods["planet-muluna"] and "smelting-machine" or "space-platform"
local order = mods["planet-muluna"] and "ca[crusher]" or "e[crusher]"
local muluna_restriction = {
    
    {
        property = "gravity",
        max = 0.1,
    }
}
local surface_restriction =  mods["planet-muluna"] and muluna_restriction or nil

local function create_vanilla_crusher ()
    log("Creating vanilla crusher")
    local newvanillaCrusher = table.deepcopy(data.raw["assembling-machine"]["crusher"])
    newvanillaCrusher.name = "crusher-vanilla"
    newvanillaCrusher.effect_receiver = {base_effect={}}
    newvanillaCrusher.energy_usage = "540kW"
    newvanillaCrusher.crafting_speed = 1.0
    newvanillaCrusher.module_slots = 2
    newvanillaCrusher.order = "z-e[crusher][vanilla]"
    newvanillaCrusher.localised_name = {"entity-name.crusher-vanilla"}
    newvanillaCrusher.surface_conditions = surface_restriction
    newvanillaCrusher.minable.result = "crusher-vanilla"
    newvanillaCrusher.subgroup = subgroup
    data:extend({newvanillaCrusher})
    data.extend({
        {
            type = "item",
            name = newvanillaCrusher.name,
            icon = "__space-age__/graphics/icons/crusher.png",
            icon_size = 64,
            subgroup = subgroup,
            order = order .. "[vanilla]",
            place_result = newvanillaCrusher.name,
            stack_size = 10,
            weight = 100000
        }
    })
    local recipe = table.deepcopy(data.raw.recipe["crusher"])
    recipe.name = newvanillaCrusher.name
    recipe.results ={{ type = "item", name = newvanillaCrusher.name, amount = 1}}
    recipe.subgroup = subgroup
    if settings.startup["crushing-industry-space-crusher-quality"].value then
        table.remove(recipe.ingredients, #recipe.ingredients)
    end
    data:extend({recipe})
    if mods["planet-muluna"] then
        ftech.add_unlock("crusher", recipe.name)
    else
        ftech.add_unlock("space-crushing", recipe.name)
    end
end

local function create_vanilla_crusher2 ()
    log("Creating vanilla crusher 2")
    local newvanillaCrusher = table.deepcopy(data.raw["assembling-machine"]["crusher-vanilla"])
    newvanillaCrusher.name = "crusher-2-vanilla"
    data.raw["assembling-machine"]["crusher-vanilla"].next_upgrade = newvanillaCrusher.name
    newvanillaCrusher.effect_receiver = {base_effect={}}
    newvanillaCrusher.energy_usage = "1080kW"
    newvanillaCrusher.crafting_speed = 1.5
    newvanillaCrusher.module_slots = 4
    newvanillaCrusher.order = "z-cb[crusher-2][vanilla]"
    newvanillaCrusher.localised_name = {"entity-name.crusher-2-vanilla"}
    newvanillaCrusher.minable.result = "crusher-2-vanilla"
    data:extend({newvanillaCrusher})
    data.extend({
        {
            type = "item",
            name = newvanillaCrusher.name,
            icon = "__muluna-graphics__/graphics/icons/crusher-2.png",
            icon_size = 64,
            subgroup = "smelting-machine",
            order = "cb[crusher-2][vanilla]",
            place_result = newvanillaCrusher.name,
            stack_size = 10,
            weight = 200000
        }
    })
    local recipe = table.deepcopy(data.raw.recipe["crusher-2"])
    recipe.name = newvanillaCrusher.name
    recipe.results ={{ type = "item", name = newvanillaCrusher.name, amount = 1}}
    data:extend({recipe})
    frep.replace_ingredient("crusher-2-vanilla", "quality-module-3", {type="item", name="uranium-238", amount=2})
end

local function create_alternate_crusher()
    local altSpaceCrusher = table.deepcopy(data.raw["assembling-machine"]["crusher"])
    local recipe = table.deepcopy(data.raw.recipe["crusher"])
    if settings.startup["crushing-industry-space-crusher-quality"].value then
        log("Creating space crusher without quality")
        altSpaceCrusher.name = "crusher-no-quality"
        altSpaceCrusher.effect_receiver = {base_effect={productivity=0.25}}
        altSpaceCrusher.energy_usage = "810kW"
        table.remove(recipe.ingredients, #recipe.ingredients)
        altSpaceCrusher.order = "z-e[crusher][no-quality]"
        altSpaceCrusher.localised_name = {"entity-name.crusher-no-quality"}
    else
        log("Creating space crusher with quality")
        altSpaceCrusher.name = "crusher-quality"
        alternate_crusher_name = altSpaceCrusher.name
        altSpaceCrusher.effect_receiver = {base_effect={quality=1.25, productivity=0.25}}
        table.insert(recipe.ingredients, {type="item", name="quality-module-2", amount=4})
        altSpaceCrusher.energy_usage = "1080kW"
        altSpaceCrusher.order = "z-e[crusher][space-quality]"
        altSpaceCrusher.localised_name = {"entity-name.crusher-quality"}
    end
    altSpaceCrusher.surface_conditions = surface_restriction
    altSpaceCrusher.subgroup = subgroup
    data:extend({altSpaceCrusher})
    data.extend({
        {
            type = "item",
            name = altSpaceCrusher.name,
            icon = "__space-age__/graphics/icons/crusher.png",
            icon_size = 64,
            subgroup = subgroup,
            order = order .. "[alt-space]",
            place_result = altSpaceCrusher.name,
            stack_size = 10,
            weight = 100000
        }
    })
    recipe.name = altSpaceCrusher.name
    recipe.results ={{ type = "item", name = altSpaceCrusher.name, amount = 1}}
    recipe.subgroup = subgroup
    data:extend({recipe})
    if mods["planet-muluna"] then
        ftech.add_unlock("crusher", recipe.name)
    else
        ftech.add_unlock("space-crushing", recipe.name)
    end
end

local function create_alternate_crusher2()
    local altSpaceCrusher = table.deepcopy(data.raw["assembling-machine"]["crusher-2"])
    altSpaceCrusher.name = "crusher-2-no-quality"
    altSpaceCrusher.effect_receiver = {base_effect={productivity=0.25}}
    altSpaceCrusher.energy_usage = "1630kW"
    altSpaceCrusher.order = "z-cb[crusher-2][vanilla]"
    altSpaceCrusher.localised_name = {"entity-name.crusher-2-no-quality"}
    if settings.startup["crushing-industry-space-crusher-quality"].value then
        data.raw["assembling-machine"]["crusher-no-quality"].next_upgrade = altSpaceCrusher.name
    end
    altSpaceCrusher.surface_conditions = surface_restriction
    altSpaceCrusher.subgroup = subgroup
    data:extend({altSpaceCrusher})
    data.extend({
        {
            type = "item",
            name = altSpaceCrusher.name,
            icon = "__muluna-graphics__/graphics/icons/crusher-2.png",
            icon_size = 64,
            subgroup = "smelting-machine",
            order = "cb[crusher-2][alt]",
            place_result = altSpaceCrusher.name,
            stack_size = 10,
            weight = 200000
        }
    })
    local recipe = table.deepcopy(data.raw.recipe["crusher-2"])
    recipe.name = altSpaceCrusher.name
    recipe.results ={{ type = "item", name = altSpaceCrusher.name, amount = 1}}
    data:extend({recipe})
    frep.replace_ingredient("crusher-2-no-quality", "quality-module-3", {type="item", name="uranium-238", amount=2})
end


if settings.startup["crushing-industry-space-crusher"].value then
    create_vanilla_crusher()
    create_alternate_crusher()
    if mods["planet-muluna"] then
        create_vanilla_crusher2()
        create_alternate_crusher2()
    end
end
