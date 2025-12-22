require("datautil")
if settings.startup["crushing-industry-glass"].value and settings.startup["restore-glass-recipes"].value then
    require("prototypes/recipes/glass")
    if settings.startup["crushing-industry-optical-fiber"].value and settings.startup["restore-optical-fiber-recipes"].value then
        require("prototypes.recipes.optical_fiber")
    end
end
if settings.startup["crushing-industry-ore"].value and settings.startup["restore-ore-recipes"].value then
    require("prototypes.recipes.ore")
end
if settings.startup["crushing-industry-coal"].value and settings.startup["restore-coal-recipes"].value then
    require("prototypes.recipes.coal")
end

if settings.startup["crushing-industry-space-crusher"].value and settings.startup["unlock-crusher-recipes"].value then
    require("prototypes.crushers")
end