# Macro function to adjust scale by a delta amount
# Usage: function decomon:internal/adjust_scale {delta:5} (adds 5%)
# Usage: function decomon:internal/adjust_scale {delta:-10} (subtracts 10%)
# Requires: Player must have a selected decomon

execute unless score @s decomon_selected matches 1..
    run tellraw @s [
      {"text":"✗ ","color":"red"},
      {"text":"No Cobblemon selected. Use ","color":"gray"}, #: this is a test
      {
        "text":"/function decomon:select",
        "color":"aqua",
        "clickEvent":{
          "action":"suggest_command",
          "value":"/function decomon:select"
        }
      },
      {"text":" first.","color":"gray"}
    ]
execute unless score @s decomon_selected matches 1..
    run return fail

# Store the executing player's selected ID in a temp variable
execute store result score #temp decomon_selected
    run scoreboard players get @s decomon_selected

# Initialize scoreboard from ScaleModifier if not set yet (uses 100 = 100%)
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    unless score @s decomon_scale matches -2147483648..2147483647
    store result score @s decomon_scale
    run data get entity @s ScaleModifier 100
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    unless score @s decomon_scale matches 1..
    run scoreboard players set @s decomon_scale 100

# Apply the delta adjustment using operation (handles negative values properly)
$scoreboard players set #delta decomon_scale $(delta)
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run
      scoreboard players
      operation @s decomon_scale += #delta decomon_scale

# Clamp to min/max (0% to 500%)
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run
      scoreboard players
      operation @s decomon_scale > decomon_test max_scale
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run
      scoreboard players
      operation @s decomon_scale < decomon_test min_scale

# Convert scale to double for NBT storage
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    store result storage decomon:temp new_scale double 0.01
    run scoreboard players get @s decomon_scale

# Apply to entity NBT (both display and backup integer)
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run data modify entity @s ScaleModifier
    set from storage decomon:temp new_scale
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run data modify entity @s Pokemon.ScaleModifier
    set from storage decomon:temp new_scale
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    store result entity @s decomon_scale_int int 1
    run scoreboard players get @s decomon_scale

# Copy score to display variable for tellraw
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    store result score #display decomon_scale
    run scoreboard players get @s decomon_scale

# Feedback
tellraw @a [
    {"text":"✓ ","color":"green"},
    {"text":"Scale set to ","color":"gray"},
    {"score":{"name":"#display","objective":"decomon_scale"},"color":"aqua"},
    {"text":"%","color":"aqua"}
  ]