# Apply wandering behavior to entity in context (@s)
# Usage: execute as <pokemon> run function decomon:internal/apply/wandering {wandering:0}

$scoreboard players set #wandering decomon_test $(wandering)

# Enable wandering (restore walk_speed from stored value)
execute if score #wandering decomon_test matches 1
    store result entity @s Config.walk_speed double 0.01
    run scoreboard players get @s decomon_walk_speed

execute if score #wandering decomon_test matches 1
    run data modify entity @s Config.wanders set value 1.0d

# Disable wandering (store walk_speed and set to 0)
execute if score #wandering decomon_test matches 0
    store result score @s decomon_walk_speed
    run data get entity @s Config.walk_speed 100

execute if score #wandering decomon_test matches 0
    run data modify entity @s Config.walk_speed set value 0.0d

execute if score #wandering decomon_test matches 0
    run data modify entity @s Config.wanders set value 0.0d