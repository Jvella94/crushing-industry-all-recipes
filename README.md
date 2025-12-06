# Crushing Industry — All Recipes

This mod configurably restores the vanilla recipes removed by Crushing Industry, allowing the player the choice of both. You can choose which variant is the default via the settings. There is also the optional choice of adding all 3 crusher variants (Vanilla, Crushing w/wo Quality) if you've enabled the Space Crusher setting on Crushing Industry. If Muluna is installed, all 3 variants are available for the Crusher 2 as well.

## Features

- Generates "-crushed" or "-vanilla" recipe variants for supported recipes.
- Startup setting to choose default behavior:
  - If default is "crushed", the original recipe becomes the crushed variant and a "-vanilla" copy is created.
  - If default is "vanilla" (default-to-crushed = false), the original recipe stays vanilla and a "-crushed" copy is created.
- Integrations / optional behavior for the Space Age mod.
- Localization-ready: add entries under the [recipe-name] section for each generated recipe ID.

## Generated recipes (examples present in this workspace)

- Concrete
- Holmium solution (space-age)
- Electrolyte (space-age)
- Molten iron / molten copper (space-age)
- Advanced thruster oxidizer (space-age)
- Tungsten plate (space-age)
- Glass-using recipes: lab, chemical-plant, solar-panel, night-vision-equipment, display-panel, small-lamp, laser-turret, rail-signal, rail-chain-signal (plus space-age glass consumers)
- Coal consumers: coal-liquefaction, explosives, plastic-bar, poison-capsule, slowdown-capsule (plus space-age carbon)

## Installation

1. Copy the folder `crushing-industry-all-recipes` into Factorio's `mods/` directory.
2. Start Factorio and enable the mod.

## Configuration / Settings

Place a startup settings.lua in the mod root (this workspace already contains/uses a startup setting name shown below). Key settings used by the mod:

- `crushing-industry-all-recipes.default-to-crushed` (bool, startup) — choose whether the default recipe name is the crushed variant (true) or vanilla (false).
- Feature toggles referenced in code: `crushing-industry-glass`, `restore-glass-recipes`, `crushing-industry-ore`, `restore-ore-recipes`, `crushing-industry-coal`, `restore-coal-recipes`, `crushing-industry-space-crusher`, `unlock-crusher-recipes`.

## Localization

Create a file such as:
locale/en/crushing-industry-all-recipes.cfg

Use a [recipe-name] section and put recipe internal names as keys (do not prefix the keys). Example:
[recipe-name]
concrete-crushed=Concrete (crushed)
concrete-vanilla=Concrete (vanilla)

Note: recipe IDs must match the internal names created by the mod (e.g. `concrete-crushed`, `lab-vanilla`, `coal-liquefaction-crushed`, etc.)

## Development / Source layout

- data.lua — main loader and startup-branching logic
- prototypes/recipes/glass.lua — glass-related recipe adjustments
- prototypes/recipes/coal.lua — coal-related recipe adjustments
- prototypes/recipes/ore.lua — ore-related recipe adjustments
- locale/en/\* — put localization files here
- settings.lua — add startup settings (e.g. `default-to-crushed`) if not present

## Testing

1. Install mod in Factorio `mods/` folder.
2. Toggle desired startup settings in `mod-settings` before starting a new save (startup settings apply on game start).
3. Inspect recipes in-game or use the data stage log messages.

## License

See LICENSE in this folder.
