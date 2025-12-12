# Highlight selected decorative Cobblemon with glowing effect
# Usage: /function decomon:highlight
# The glow lasts for 10 seconds

execute unless score @s decomon_selected matches 1.. run tellraw @s [{"text":"✗ ","color":"red"},{"text":"No Cobblemon selected. Use ","color":"gray"},{"text":"/function decomon:select","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function decomon:select"}},{"text":" first.","color":"gray"}]
execute unless score @s decomon_selected matches 1.. run return fail

# Store the executing player's selected ID in a temp variable
execute store result score #temp decomon_selected run scoreboard players get @s decomon_selected

# Apply glowing effect
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected run effect give @s minecraft:glowing 10 0 true

# Feedback
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected run tellraw @a [{"text":"✦ ","color":"yellow"},{"text":"Highlighted ","color":"gray"},{"selector":"@s","color":"aqua"}]
