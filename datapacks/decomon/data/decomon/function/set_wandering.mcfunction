# Set wandering behavior on selected decorative Cobblemon
# Usage: /function decomon:set_wandering {wandering:1}
# Values: 0 = disabled, 1 = enabled
# Note: This stores/restores walk_speed to preserve species-specific speeds

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

# Set wandering behavior using macro
$execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run function decomon:internal/apply/wandering {wandering:$(wandering)}

# Feedback (only if debug is enabled)
$execute if score #debug decomon_test matches 1
    run tellraw @a [
      {"text":"✓ ","color":"green"},
      {"text":"Wandering set to $(wandering)","color":"gray"}
    ]