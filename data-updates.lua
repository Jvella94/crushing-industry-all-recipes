if settings.startup["crushing-industry-ore"].value
    and settings.startup["restore-ore-recipes"].value
    and mods["SpaceAgeWithoutSpace"] then
    log("Crushing Industry All Recipes: Detected SpaceAgeWithoutSpace mod, loading compatibility file.")
    require("compatibility.spagewithoutspace")
end
