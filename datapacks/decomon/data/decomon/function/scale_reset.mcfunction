# Reset scale of selected decorative Cobblemon to 100% (default)
# Usage: /function decomon:scale_reset

execute unless score @s decomon_selected matches 1.. run tellraw @s [{"text":"✗ ","color":"red"},{"text":"No Cobblemon selected. Use ","color":"gray"},{"text":"/function decomon:select","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function decomon:select"}},{"text":" first.","color":"gray"}]
execute unless score @s decomon_selected matches 1.. run return fail

# Store the executing player's selected ID in a temp variable
execute store result score #temp decomon_selected run scoreboard players get @s decomon_selected

# Set scale to 100 (100%)
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected run scoreboard players set @s decomon_scale 100

# Convert scale to double for NBT storage
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected store result storage decomon:temp new_scale double 0.01 run scoreboard players get @s decomon_scale

# Apply to entity NBT (both display and backup integer)
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected run data modify entity @s ScaleModifier set from storage decomon:temp new_scale
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected run data modify entity @s Pokemon.ScaleModifier set from storage decomon:temp new_scale
execute as @e[type=cobblemon:pokemon,tag=decomon] if score @s decomon_id = #temp decomon_selected store result entity @s decomon_scale_int int 1 run scoreboard players get @s decomon_scale

# Feedback (only if debug is enabled)
execute if score #debug decomon_test matches 1
    run tellraw @a [
      {"text":"✓ ","color":"green"},
      {"text":"Scale reset to default (100%)","color":"gray"}
    ]