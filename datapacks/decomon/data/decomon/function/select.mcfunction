# Select the nearest decorative Cobblemon within 10 blocks
# Stores its ID so other commands operate on it

# Check if there's a decomon nearby
execute as @e[type=cobblemon:pokemon,tag=decomon,distance=..10,sort=nearest,limit=1] run scoreboard players operation @p decomon_selected = @s decomon_id

# Give feedback
execute if entity @e[type=cobblemon:pokemon,tag=decomon,distance=..10,sort=nearest,limit=1] as @e[type=cobblemon:pokemon,tag=decomon,distance=..10,sort=nearest,limit=1] run tellraw @a[distance=..10] [{"text":"✓ ","color":"green"},{"text":"Selected ","color":"gray"},{"selector":"@s","color":"aqua"}]

# No decomon found
execute unless entity @e[type=cobblemon:pokemon,tag=decomon,distance=..10] run tellraw @s [{"text":"✗ ","color":"red"},{"text":"No decorative Cobblemon found within 10 blocks","color":"gray"}]
