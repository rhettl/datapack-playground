# Set unbattleable status on selected decorative Cobblemon
# Usage: /function decomon:set_unbattleable {unbattleable:1}
# Values: 0 = can battle, 1 = unbattleable

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

# Set unbattleable status using macro
$execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run function decomon:internal/apply/unbattleable {unbattleable:$(unbattleable)}

# Feedback (only if debug is enabled)
$execute if score #debug decomon_test matches 1
    run tellraw @a [
      {"text":"✓ ","color":"green"},
      {"text":"Unbattleable set to $(unbattleable)","color":"gray"}
    ]