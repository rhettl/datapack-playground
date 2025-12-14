# Set selected Cobblemon to hovering pose
# Usage: /function decomon:pose/hover

execute unless score @s decomon_selected matches 1..
    run tellraw @s [
      {"text":"✗ ","color":"red"},
      {"text":"No Cobblemon selected. Use ","color":"gray"},
      {"text":"/function decomon:select","color":"aqua","clickEvent":{"action":"suggest_command","value":"/function decomon:select"}},
      {"text":" first.","color":"gray"}
    ]
execute unless score @s decomon_selected matches 1..
    run return fail

# Store the executing player's selected ID in a temp variable
execute store result score #temp decomon_selected
    run scoreboard players get @s decomon_selected

# Set pose to HOVER and enable look at player
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run data merge entity @s {
      Pokemon:{PoseType:"HOVER"},
      Config:{
        look_at_entity_types:"minecraft:player"
      }
    }

# Clear sleep brain memories if any
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run data remove entity @s Brain.memories."cobblemon:pokemon_sleeping"

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run data remove entity @s Brain.memories."cobblemon:pokemon_drowsy"

# Feedback (only if debug is enabled)
execute if score #debug decomon_test matches 1
    run tellraw @a [
      {"text":"✓ ","color":"green"},
      {"text":"Set pose to ","color":"gray"},
      {"text":"HOVER","color":"aqua"}
    ]