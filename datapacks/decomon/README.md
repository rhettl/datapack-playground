# Decomon - Decorative Cobblemon Helper

A Minecraft 1.21.1 datapack for placing and managing decorative Cobblemon in villages and builds.

## Features

- Spawn any Cobblemon species as decorative NPCs
- Selection-based workflow - select once, modify many times
- Auto-runnable toggle commands (no parameters needed!)
- Rename and customize Cobblemon
- Works across loaded chunks
- Clickable in-game menu

## Installation

1. Place the `decomon` folder in your world's `datapacks` folder
2. Run `/reload` in-game
3. Run `/function decomon:help` to get started

## Usage

### Selection System

Decomon uses a **selection-based workflow**:
1. Spawn or select a Cobblemon
2. Run multiple commands on the selected Cobblemon
3. Select a different one when you need to work on another

### Main Menu
Run `/function decomon:help` to display an interactive menu with all commands.

### Commands

#### Spawning
```
/function decomon:spawn {species:"pikachu",level:50}
```
- Spawns a decorative Cobblemon at your location
- **Automatically selects** the spawned Cobblemon for you
- Species is required, level defaults to 50
- Examples: `species:"charizard"`, `species:"eevee"`

#### Selection
```
/function decomon:select
```
- Selects the nearest decorative Cobblemon within 10 blocks
- All subsequent commands will operate on this Cobblemon
- Works even if the Cobblemon is in a different loaded chunk

#### Highlighting
```
/function decomon:highlight
```
- Applies glowing effect to the **selected** Cobblemon
- Helps confirm which one you're working on
- Effect lasts 10 seconds

#### Toggles (Auto-Runnable!)
All toggle commands are **auto-runnable** - just click or run them, no parameters needed:

```
/function decomon:toggle/shiny
/function decomon:toggle/sitting
/function decomon:toggle/wandering
/function decomon:toggle/invulnerable
/function decomon:toggle/unbattleable
/function decomon:toggle/looks_at_player
```

Each toggle operates on your **selected** Cobblemon and provides feedback showing the result.

#### Customization
```
/function decomon:rename {name:"Guard Pokemon"}
/function decomon:set_level {level:100}
```
Both commands operate on the selected Cobblemon.

#### Movement
```
/function decomon:move
```
- Teleports the **selected** Cobblemon to your position
- Works across loaded chunks!

#### Removal
```
/function decomon:remove
```
- Removes/kills the **selected** Cobblemon
- Clears your selection afterward

## Default Properties

All spawned decorative Cobblemon have these defaults:
- **Invulnerable**: Yes (5000 HP as backup)
- **Unbattleable**: Yes
- **Uncatchable**: Yes
- **PersistenceRequired**: Yes (won't despawn)
- **CustomNameVisible**: Yes
- **Wandering**: Enabled (small range)
- **Looks at Player**: Enabled

## Building Workflow

### Example 1: Single Pokemon
1. Spawn: `/function decomon:spawn {species:"pikachu",level:50}` (auto-selected)
2. Make it shiny: `/function decomon:toggle/shiny`
3. Make it sit: `/function decomon:toggle/sitting`
4. Rename: `/function decomon:rename {name:"Town Guard"}`
5. Done!

### Example 2: Multiple Pokemon
1. Spawn first: `/function decomon:spawn {species:"pikachu",level:50}`
2. Make stationary: `/function decomon:toggle/wandering` (disable)
3. Move away and spawn second: `/function decomon:spawn {species:"charizard",level:70}`
4. Configure second one...
5. Need to modify first? `/function decomon:select` (when near it)
6. Continue modifying first one

### Example 3: Repositioning
1. Select the Cobblemon: `/function decomon:select`
2. Move to new location
3. Teleport it: `/function decomon:move`
4. Repeat steps 2-3 until positioned correctly

## Technical Details

- Uses scoreboard objectives to track unique IDs for each decorative Cobblemon
- Each player has their own selection that persists until changed
- Selection works across loaded chunks
- All decorative Cobblemon are tagged with `decomon` for filtering

## Version

Current version: 1.0.0 (stored in pack.mcmeta)
