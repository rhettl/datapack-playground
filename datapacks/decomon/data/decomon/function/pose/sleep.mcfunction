# Set selected Cobblemon to sleeping pose
# Usage: /function decomon:pose/sleep

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

# Set pose to SLEEP and add required brain memories
# Disable look at player for sleeping
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run data merge entity @s {
      Pokemon:{PoseType:"SLEEP"},
      Brain:{
        memories:{
          "cobblemon:pokemon_sleeping":{value:1b},
          "cobblemon:pokemon_drowsy":{value:1b}
        }
      },
      Config:{
        look_at_entity_types:""
      }
    }

# Feedback (only if debug is enabled)
execute if score #debug decomon_test matches 1
    run tellraw @a [
      {"text":"✓ ","color":"green"},
      {"text":"Set pose to ","color":"gray"},
      {"text":"SLEEP","color":"aqua"}
    ]