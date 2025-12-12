# Toggle looks at player behavior on selected decorative Cobblemon
# Usage: /function decomon:toggle/looks_at_player

execute unless score @s decomon_selected matches 1.. run tellraw @s [{"text":"✗ ","color":"red"},{"text":"No Cobblemon selected. Use ","color":"gray"},{"text":"/function decomon:select","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function decomon:select"}},{"text":" first.","color":"gray"}]
execute unless score @s decomon_selected matches 1.. run return fail

# Store the executing player's selected ID in a temp variable
execute store result score #temp decomon_selected run scoreboard players get @s decomon_selected

# Get current looks at player status
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected store result score @s decomon_look run data get entity @s Config.look_at_entity_types 1

# Toggle ON
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected if score @s decomon_look matches 0 run data modify entity @s Config.look_at_entity_types set value "minecraft:player"
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected if score @s decomon_look matches 0 run tellraw @a [{"text":"✓ ","color":"green"},{"text":"Target now looks at players","color":"aqua"}]

# Toggle OFF
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected if score @s decomon_look matches 1.. run data modify entity @s Config.look_at_entity_types set value ""
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected if score @s decomon_look matches 1.. run tellraw @a [{"text":"✓ ","color":"green"},{"text":"Target no longer looks at players","color":"gray"}]
