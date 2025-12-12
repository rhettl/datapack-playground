# Remove/kill selected decorative Cobblemon
# Usage: /function decomon:remove

execute unless score @s decomon_selected matches 1.. run tellraw @s [{"text":"✗ ","color":"red"},{"text":"No Cobblemon selected. Use ","color":"gray"},{"text":"/function decomon:select","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function decomon:select"}},{"text":" first.","color":"gray"}]
execute unless score @s decomon_selected matches 1.. run return fail

# Store the executing player's selected ID in a temp variable
execute store result score #temp decomon_selected run scoreboard players get @s decomon_selected

# Show feedback before removing
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected run tellraw @a [{"text":"✗ ","color":"red"},{"text":"Removed ","color":"gray"},{"selector":"@s","color":"aqua"}]

# Remove the pokemon
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected run kill @s

# Clear player's selection
scoreboard players set @s decomon_selected 0
