# Apply absolute scale value to entity in context (@s)
# Usage: execute as <pokemon> run function decomon:internal/apply/scale {scalePercent:100}
# scalePercent: percentage value (100 = 100% = 1.0x, 200 = 200% = 2.0x)

# Set the scale value in scoreboard
$scoreboard players set @s decomon_scale $(scalePercent)

# Clamp to min/max (5% to 1000%)
scoreboard players operation @s decomon_scale > min_scale decomon_test
scoreboard players operation @s decomon_scale < max_scale decomon_test

# Convert scale to double for NBT storage
execute store result storage decomon:temp new_scale double 0.01
    run scoreboard players get @s decomon_scale

# Apply to entity NBT (both display and backup integer)
data modify entity @s ScaleModifier set from storage decomon:temp new_scale
data modify entity @s Pokemon.ScaleModifier set from storage decomon:temp new_scale
execute store result entity @s decomon_scale_int int 1
    run scoreboard players get @s decomon_scale