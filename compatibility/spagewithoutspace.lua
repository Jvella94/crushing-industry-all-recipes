local restore_vanilla = settings.startup["restore-recipes-to-vanilla"].value
if restore_vanilla then
    log("Crushing Industry All Recipes: Adding molten metal modded recipes to foundry for SpaceAgeWithoutSpace compatibility.")
    table.insert(data.raw.technology.foundry.effects, {
        type = "unlock-recipe",
        recipe = "molten-iron-modded"
    })
    table.insert(data.raw.technology.foundry.effects, {
        type = "unlock-recipe",
        recipe = "molten-copper-modded"
    })
else
    log("Crushing Industry All Recipes: Adding molten metal vanilla recipes to foundry for SpaceAgeWithoutSpace compatibility.")
    table.insert(data.raw.technology.foundry.effects, {
        type = "unlock-recipe",
        recipe = "molten-iron-vanilla"
    })
    table.insert(data.raw.technology.foundry.effects, {
        type = "unlock-recipe",
        recipe = "molten-copper-vanilla"
    })
end