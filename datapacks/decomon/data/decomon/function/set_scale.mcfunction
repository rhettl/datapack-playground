# Set absolute scale value on selected decorative Cobblemon
# Usage: /function decomon:set_scale {scalePercent:100}
# scalePercent: percentage value (100 = 100% = 1.0x, 50 = 50% = 0.5x, 200 = 200% = 2.0x)

execute unless score @s decomon_selected matches 1..
    run tellraw @s [
      {"text":"✗ ","color":"red"},
      {"text":"No Cobblemon selected. Use ","color":"gray"},
      {"text":"/function decomon:select","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function decomon:select"}},
      {"text":" first.","color":"gray"}
    ]
execute unless score @s decomon_selected matches 1..
    run return fail

# Store the executing player's selected ID in a temp variable
execute store result score #temp decomon_selected
    run scoreboard players get @s decomon_selected

# Apply scale using internal function
$execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run function decomon:internal/apply/scale {scalePercent:$(scalePercent)}

# Feedback (only if debug is enabled)
$execute if score #debug decomon_test matches 1
    run tellraw @a [
      {"text":"✓ ","color":"green"},
      {"text":"Scale set to $(scalePercent)%","color":"gray"}
    ]