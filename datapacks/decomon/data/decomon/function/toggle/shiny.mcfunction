# Toggle shiny status on selected decorative Cobblemon
# Usage: /function decomon:toggle/shiny

execute unless score @s decomon_selected matches 1.. run tellraw @s [{"text":"✗ ","color":"red"},{"text":"No Cobblemon selected. Use ","color":"gray"},{"text":"/function decomon:select","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function decomon:select"}},{"text":" first.","color":"gray"}]
execute unless score @s decomon_selected matches 1.. run return fail

# Store the executing player's selected ID in a temp variable
execute store result score #temp decomon_selected run scoreboard players get @s decomon_selected

# Get current shiny status
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected store result score @s decomon_shiny run data get entity @s Pokemon.Shiny

# Toggle ON
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected if score @s decomon_shiny matches 0 run data modify entity @s Pokemon.Shiny set value 1b
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected if score @s decomon_shiny matches 0 run tellraw @a [{"text":"✓ ","color":"green"},{"text":"Target is now shiny","color":"aqua"}]

# Toggle OFF
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected if score @s decomon_shiny matches 1.. run data modify entity @s Pokemon.Shiny set value 0b
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected if score @s decomon_shiny matches 1.. run tellraw @a [{"text":"✓ ","color":"green"},{"text":"Target is no longer shiny","color":"gray"}]
