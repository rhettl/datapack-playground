# Apply uncatchable status to entity in context (@s)
# Usage: execute as <pokemon> run function decomon:internal/apply/uncatchable {uncatchable:1}

$scoreboard players set #uncatchable decomon_test $(uncatchable)

execute if score #uncatchable decomon_test matches 1
    run data modify entity @s Pokemon.PokemonData set value ["uncatchable","uncatchable","uncatchable"]

execute if score #uncatchable decomon_test matches 0
    run data modify entity @s Pokemon.PokemonData set value []