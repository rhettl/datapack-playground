# Apply looks at player behavior to entity in context (@s)
# Usage: execute as <pokemon> run function decomon:internal/apply/looks_at_player {looks:1}

$scoreboard players set #looks decomon_test $(looks)

execute if score #looks decomon_test matches 1
    run data modify entity @s Config.look_at_entity_types set value "minecraft:player"

execute if score #looks decomon_test matches 0
    run data modify entity @s Config.look_at_entity_types set value ""