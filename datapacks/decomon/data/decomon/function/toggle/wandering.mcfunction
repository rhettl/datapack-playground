# Toggle wandering behavior on selected decorative Cobblemon
# Usage: /function decomon:toggle/wandering

execute unless score @s decomon_selected matches 1.. run tellraw @s [{"text":"✗ ","color":"red"},{"text":"No Cobblemon selected. Use ","color":"gray"},{"text":"/function decomon:select","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function decomon:select"}},{"text":" first.","color":"gray"}]
execute unless score @s decomon_selected matches 1.. run return fail

# Store the executing player's selected ID in a temp variable
execute store result score #temp decomon_selected run scoreboard players get @s decomon_selected

# Get current wandering status
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    store result score @s decomon_wander
    run data get entity @s Config.wanders

# Toggle ON (restore walk_speed from stored value)
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    if score @s decomon_wander matches 0
    store result entity @s Config.walk_speed double 0.01
    run scoreboard players get @s decomon_walk_speed

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    if score @s decomon_wander matches 0
    run data modify entity @s Config.wanders set value 1.0d

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    if score @s decomon_wander matches 0
    run tellraw @a [
      {"text":"✓ ","color":"green"},
      {"text":"Target wandering enabled","color":"aqua"}
    ]

# Toggle OFF (store walk_speed and set to 0)
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    if score @s decomon_wander matches 1..
    store result score @s decomon_walk_speed
    run data get entity @s Config.walk_speed 100

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    if score @s decomon_wander matches 1..
    run data modify entity @s Config.walk_speed set value 0.0d

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    if score @s decomon_wander matches 1..
    run data modify entity @s Config.wanders set value 0.0d

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    if score @s decomon_wander matches 1..
    run tellraw @a [
      {"text":"✓ ","color":"green"},
      {"text":"Target wandering disabled","color":"gray"}
    ]
