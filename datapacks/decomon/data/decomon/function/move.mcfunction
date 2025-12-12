# Teleport selected decorative Cobblemon to your position
# Usage: /function decomon:move

execute unless score @s decomon_selected matches 1.. run tellraw @s [{"text":"✗ ","color":"red"},{"text":"No Cobblemon selected. Use ","color":"gray"},{"text":"/function decomon:select","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function decomon:select"}},{"text":" first.","color":"gray"}]
execute unless score @s decomon_selected matches 1.. run return fail

# Store the executing player's selected ID in a temp variable
execute store result score #temp decomon_selected run scoreboard players get @s decomon_selected

# Teleport selected pokemon to player position (works across loaded chunks)
execute at @s as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected run tp @s ~ ~ ~

# Feedback
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected run tellraw @a [{"text":"✓ ","color":"green"},{"selector":"@s","color":"aqua"},{"text":" moved to your position","color":"gray"}]
