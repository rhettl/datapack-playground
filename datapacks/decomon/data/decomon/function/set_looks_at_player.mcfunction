# Set looks at player behavior on selected decorative Cobblemon
# Usage: /function decomon:set_looks_at_player {looks:1}
# Values: 0 = doesn't look, 1 = looks at players

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

# Set looks at player using macro
$execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run function decomon:internal/apply/looks_at_player {looks:$(looks)}

# Feedback (only if debug is enabled)
$execute if score #debug decomon_test matches 1
    run tellraw @a [
      {"text":"✓ ","color":"green"},
      {"text":"Looks at player set to $(looks)","color":"gray"}
    ]