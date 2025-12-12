# Set level of selected decorative Cobblemon
# Usage: /function decomon:set_level {level:50}

execute unless score @s decomon_selected matches 1.. run tellraw @s [{"text":"✗ ","color":"red"},{"text":"No Cobblemon selected. Use ","color":"gray"},{"text":"/function decomon:select","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function decomon:select"}},{"text":" first.","color":"gray"}]
execute unless score @s decomon_selected matches 1.. run return fail

# Store the executing player's selected ID in a temp variable
execute store result score #temp decomon_selected run scoreboard players get @s decomon_selected

# Set level
$execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected run data modify entity @s Pokemon.Level set value $(level)

# Feedback
$execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected run tellraw @a [{"text":"✓ ","color":"green"},{"selector":"@s","color":"aqua"},{"text":" level set to $(level)","color":"gray"}]
