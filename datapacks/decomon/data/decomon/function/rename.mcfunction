# Rename selected decorative Cobblemon (sets nickname)
# Usage: /function decomon:rename {name:"My Pokemon"}

execute unless score @s decomon_selected matches 1.. run tellraw @s [{"text":"✗ ","color":"red"},{"text":"No Cobblemon selected. Use ","color":"gray"},{"text":"/function decomon:select","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function decomon:select"}},{"text":" first.","color":"gray"}]
execute unless score @s decomon_selected matches 1.. run return fail

# Store the executing player's selected ID in a temp variable
execute store result score #temp decomon_selected run scoreboard players get @s decomon_selected

# Set Cobblemon internal nickname
$execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected run data modify entity @s Pokemon.Nickname.translate set value "$(name)"

# Set display name (shown above entity)
$execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected run data modify entity @s CustomName set value '{"translate":"$(name)"}'

# Feedback
$execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected run tellraw @a [{"text":"✓ ","color":"green"},{"selector":"@s","color":"aqua"},{"text":" renamed to $(name)","color":"gray"}]
