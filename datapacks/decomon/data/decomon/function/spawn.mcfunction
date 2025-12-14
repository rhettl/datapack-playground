# Spawn a decorative Cobblemon at your location
# Usage: /function decomon:spawn {species:"pikachu",level:50}
# Species is required, level defaults to 50

$pokespawn $(species) level=$(level) x=~ y=~ z=~

# Convert the spawned pokemon to a decomon
execute as @e[type=cobblemon:pokemon,distance=..2,sort=nearest,limit=1,tag=!decomon]
    run function decomon:make_decomon