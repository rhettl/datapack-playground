# Convert a Cobblemon in context (@s) to a decorative Cobblemon
# Usage: execute as <pokemon> run function decomon:make_decomon
# This function runs as the pokemon entity

# Tag as decomon
tag @s add decomon

# Assign unique ID
scoreboard players add #next_id decomon_id 1
scoreboard players operation @s decomon_id = #next_id decomon_id

# Auto-select this pokemon for the nearest player
execute at @s
    run scoreboard players operation @p decomon_selected = @s decomon_id

# Apply default decorative properties
function decomon:setup_defaults