# Apply default properties to newly spawned decorative Cobblemon
# Called automatically by spawn function

# Make invulnerable and persistent
data merge entity @s {Invulnerable:1b,PersistenceRequired:1b}

# Make unbattleable and uncatchable
data merge entity @s {Unbattleable:1b,Pokemon:{PokemonData:["uncatchable","uncatchable","uncatchable"]}}

# Set high health
data merge entity @s {Health:5000.0f,attributes:[{id:"minecraft:generic.max_health",base:5000.0d}]}

# Enable name visibility by default
data merge entity @s {CustomNameVisible:1b}

# Configure wandering behavior (disabled by default, can be toggled later)
data merge entity @s {Config:{walk_speed:0.35d,vertical_wander_range:5.0d,wanders:0.0d,horizontal_wander_range:10.0d,look_at_entity_types:"minecraft:player",see_distance:15.0d,wander_chance:0.008333334d}}

# Initialize scale integer from ScaleModifier (prevents floating-point error accumulation)
execute store result score @s decomon_scale run data get entity @s ScaleModifier 100
# Default to 100 (1.0 scale) if ScaleModifier doesn't exist yet
execute if score @s decomon_scale matches 0 run scoreboard players set @s decomon_scale 100
# Initialize the NBT field to 0 first, then store the value
data merge entity @s {decomon_scale_int:0}
execute store result entity @s decomon_scale_int int 1 run scoreboard players get @s decomon_scale

# Mark as initialized
tag @s add initialized

tellraw @a[distance=..10] [{"text":"✓ ","color":"green"},{"text":"Decorative Cobblemon spawned! Run ","color":"gray"},{"text":"/function decomon:help","color":"yellow","clickEvent":{"action":"run_command","value":"/function decomon:help"},"hoverEvent":{"action":"show_text","value":"Click for help menu"}},{"text":" for commands","color":"gray"}]