# Display information about the selected decorative Cobblemon
# Usage: /function decomon:info

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

# Store all toggle states
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    store result score #info_shiny decomon_shiny
    run data get entity @s Pokemon.Shiny

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    store result score #info_invuln decomon_invuln
    run data get entity @s Invulnerable

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    store result score #info_battle decomon_battle
    run data get entity @s Unbattleable

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    store result score #info_noai decomon_noai
    run data get entity @s NoAI

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    store result score #info_wander decomon_wander
    run data get entity @s Config.wanders

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    store result score #info_catch decomon_catch
    run data get entity @s Pokemon.PokemonData[0]

# Store entity data into storage for display
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run data modify storage decomon:temp info set value {
      name:"",
      level:0,
      species:"",
      health:0.0f,
      scale:0,
      pose:""
    }

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run data modify storage decomon:temp info.nickname set from entity @s Pokemon.Nickname

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run data modify storage decomon:temp info.name set from entity @s CustomName

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run data modify storage decomon:temp info.level set from entity @s Pokemon.Level

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run data modify storage decomon:temp info.species set from entity @s Pokemon.Species

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run data modify storage decomon:temp info.health set from entity @s Health

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run data modify storage decomon:temp info.scale set from entity @s decomon_scale_int

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    run data modify storage decomon:temp info.pose set from entity @s Pokemon.PoseType

execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    store result score #display_id decomon_id
    run scoreboard players get @s decomon_id

# Display header
tellraw @s [
    {"text":"\n============================\n","color":"gold"},
    {"text":"Decomon Info","color":"yellow","bold":true},
    {"text":"\n============================","color":"gold"}
  ]

# Store scale from scoreboard (more reliable than NBT)
execute as @e[type=cobblemon:pokemon,tag=decomon]
    if score @s decomon_id = #temp decomon_selected
    store result score #display_scale decomon_scale
    run scoreboard players get @s decomon_scale

# Display: <Nickname> -- lvl <level> <species>
# Check if nickname exists (prefer this over CustomName)
execute store result score #has_nickname decomon_id
    run data get storage decomon:temp info.nickname

execute store result score #has_customname decomon_id
    run data get storage decomon:temp info.name

# Show nickname if it exists
execute if score #has_nickname decomon_id matches 1..
    run tellraw @s [
      {"nbt":"info.nickname","storage":"decomon:temp","color":"aqua"},
      {"text":" -- lvl ","color":"gray"},
      {"nbt":"info.level","storage":"decomon:temp","color":"white"},
      {"text":" ","color":"gray"},
      {"nbt":"info.species","storage":"decomon:temp","color":"aqua"}
    ]

# Otherwise show CustomName if it exists
execute unless score #has_nickname decomon_id matches 1..
    if score #has_customname decomon_id matches 1..
    run tellraw @s [
      {"nbt":"info.name","storage":"decomon:temp","interpret":true,"color":"aqua"},
      {"text":" -- lvl ","color":"gray"},
      {"nbt":"info.level","storage":"decomon:temp","color":"white"},
      {"text":" ","color":"gray"},
      {"nbt":"info.species","storage":"decomon:temp","color":"aqua"}
    ]

# Otherwise just show species
execute unless score #has_nickname decomon_id matches 1..
    unless score #has_customname decomon_id matches 1..
    run tellraw @s [
      {"nbt":"info.species","storage":"decomon:temp","color":"aqua"},
      {"text":" -- lvl ","color":"gray"},
      {"nbt":"info.level","storage":"decomon:temp","color":"white"}
    ]

# Display: HP: <hp> | Scale: <scale>% | ID: <id>
tellraw @s [
    {"text":"HP: ","color":"gray"},
    {"nbt":"info.health","storage":"decomon:temp","color":"white"},
    {"text":" | Scale: ","color":"gray"},
    {"score":{"name":"#display_scale","objective":"decomon_scale"},"color":"white"},
    {"text":"% | ID: ","color":"gray"},
    {"score":{"name":"#display_id","objective":"decomon_id"},"color":"white"}
  ]

# Display: Pose: <pose>
# Check if pose exists
execute store result score #has_pose decomon_id
    run data get storage decomon:temp info.pose

execute if score #has_pose decomon_id matches 1..
    run tellraw @s [
      {"text":"Pose: ","color":"gray"},
      {"nbt":"info.pose","storage":"decomon:temp","color":"white"},
      {"text":"\n"}
    ]

execute unless score #has_pose decomon_id matches 1..
    run tellraw @s [
      {"text":"Pose: ","color":"gray"},
      {"text":"STAND","color":"white"},
      {"text":"\n"}
    ]

# Can Wander
execute if score #info_wander decomon_wander matches 1..
    run tellraw @s [
      {"text":"Can Wander: ","color":"gray"},
      {"text":"✓","color":"green"}
    ]

execute if score #info_wander decomon_wander matches 0
    run tellraw @s [
      {"text":"Can Wander: ","color":"gray"},
      {"text":"✗","color":"red"}
    ]

# Is Shiny
execute if score #info_shiny decomon_shiny matches 1
    run tellraw @s [
      {"text":"Is Shiny: ","color":"gray"},
      {"text":"✓","color":"green"}
    ]

execute if score #info_shiny decomon_shiny matches 0
    run tellraw @s [
      {"text":"Is Shiny: ","color":"gray"},
      {"text":"✗","color":"red"}
    ]

# Is Invulnerable
execute if score #info_invuln decomon_invuln matches 1
    run tellraw @s [
      {"text":"Is Invulnerable: ","color":"gray"},
      {"text":"✓","color":"green"}
    ]

execute if score #info_invuln decomon_invuln matches 0
    run tellraw @s [
      {"text":"Is Invulnerable: ","color":"gray"},
      {"text":"✗","color":"red"}
    ]

# Is Unbattleable
execute if score #info_battle decomon_battle matches 1
    run tellraw @s [
      {"text":"Is Unbattleable: ","color":"gray"},
      {"text":"✓","color":"green"}
    ]

execute if score #info_battle decomon_battle matches 0
    run tellraw @s [
      {"text":"Is Unbattleable: ","color":"gray"},
      {"text":"✗","color":"red"}
    ]

# Is Uncatchable
execute if score #info_catch decomon_catch matches 1..
    run tellraw @s [
      {"text":"Is Uncatchable: ","color":"gray"},
      {"text":"✓","color":"green"}
    ]

execute if score #info_catch decomon_catch matches 0
    run tellraw @s [
      {"text":"Is Uncatchable: ","color":"gray"},
      {"text":"✗","color":"red"}
    ]

# Has NoAI
execute if score #info_noai decomon_noai matches 1
    run tellraw @s [
      {"text":"Has NoAI: ","color":"gray"},
      {"text":"✓","color":"green"}
    ]

execute if score #info_noai decomon_noai matches 0
    run tellraw @s [
      {"text":"Has NoAI: ","color":"gray"},
      {"text":"✗","color":"red"}
    ]

# Footer
tellraw @s {"text":"============================","color":"gold"}