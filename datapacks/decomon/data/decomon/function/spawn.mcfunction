# Spawn a decorative Cobblemon at your location
# Usage: /function decomon:spawn {species:"pikachu",level:50}
# Species is required, level defaults to 50

$pokespawn $(species) level=$(level) x=~ y=~ z=~

# Tag the spawned pokemon
tag @e[type=cobblemon:pokemon,distance=..2,sort=nearest,limit=1,tag=!decomon] add decomon

# Assign unique ID to the spawned pokemon
scoreboard players add #next_id decomon_id 1
execute as @e[type=cobblemon:pokemon,distance=..2,sort=nearest,limit=1,tag=decomon,tag=!initialized] run scoreboard players operation @s decomon_id = #next_id decomon_id

# Auto-select this pokemon for the spawning player
execute as @e[type=cobblemon:pokemon,distance=..2,sort=nearest,limit=1,tag=decomon,tag=!initialized] run scoreboard players operation @p decomon_selected = @s decomon_id

# Apply default decorative properties
execute as @e[type=cobblemon:pokemon,distance=..2,sort=nearest,limit=1,tag=decomon,tag=!initialized] run function decomon:setup_defaults