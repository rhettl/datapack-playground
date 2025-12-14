# Toggle uncatchable status on selected decorative Cobblemon
# Usage: /function decomon:toggle/uncatchable

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

# Check if Pokemon.PokemonData contains "uncatchable"
# Store 1 if uncatchable, 0 if catchable
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    store success score @s decomon_catch
    run data get entity @s Pokemon.PokemonData[0]

# Toggle ON (make uncatchable)
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    if score @s decomon_catch matches 0
    run data modify entity @s Pokemon.PokemonData set value ["uncatchable", "uncatchable", "uncatchable"]

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    if score @s decomon_catch matches 0
    run tellraw @a [
      {"text":"✓ ","color":"green"},
      {"text":"Target is now uncatchable","color":"aqua"}
    ]

# Toggle OFF (make catchable)
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    if score @s decomon_catch matches 1..
    run data modify entity @s Pokemon.PokemonData set value []

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    if score @s decomon_catch matches 1..
    run tellraw @a [
      {"text":"✓ ","color":"green"},
      {"text":"Target can now be caught","color":"gray"}
    ]
