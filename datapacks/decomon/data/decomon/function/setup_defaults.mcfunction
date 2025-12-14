# Apply default properties to newly spawned decorative Cobblemon
# Called automatically by make_decomon function
# This function orchestrates property setup by calling internal/apply functions

# Core persistence and health properties
data merge entity @s {
    PersistenceRequired:1b,
    Health:5000.0f,
    attributes:[
      {id:"minecraft:generic.max_health",base:5000.0d}
    ],
    CustomNameVisible:1b
  }

# Configure movement behavior defaults
data merge entity @s {
    Config:{
      walk_speed:0.35d,
      vertical_wander_range:5.0d,
      wanders:0.0d,
      horizontal_wander_range:10.0d,
      look_at_entity_types:"minecraft:player",
      see_distance:15.0d,
      wander_chance:0.008333334d
    }
  }

# Initialize walk_speed storage (store as int * 100 for later restoration)
execute store result score @s decomon_walk_speed
    run data get entity @s Config.walk_speed 100

# Apply default toggle states
function decomon:internal/apply/invulnerable {invulnerable:0}
function decomon:internal/apply/unbattleable {unbattleable:1}
function decomon:internal/apply/uncatchable {uncatchable:1}
function decomon:internal/apply/wandering {wandering:0}
function decomon:internal/apply/shiny {shiny:0}
function decomon:internal/apply/no_ai {no_ai:0}
function decomon:internal/apply/looks_at_player {looks:1}

# Apply default scale (100% = 1.0x)
function decomon:internal/apply/scale {scalePercent:100}


# Mark as initialized
tag @s add initialized

# Feedback (only if debug is enabled)
execute if score #debug decomon_test matches 1
    run tellraw @a[distance=..10] [
      {"text":"✓ ","color":"green"},
      {"text":"Decorative Cobblemon spawned! Run ","color":"gray"},
      {
        "text":"/function decomon:help",
        "color":"yellow",
        "clickEvent":{
          "action":"run_command","value":"/function decomon:help"
        },
        "hoverEvent":{
          "action":"show_text",
          "value":"Click for help menu"
        }
      },
      {"text":" for commands","color":"gray"}
    ]
