# Load function - runs when datapack is loaded or /reload is run
# Sets up scoreboards for the selection system

# Create objective for unique decomon IDs
scoreboard objectives add decomon_id dummy

# Create objective to track player's selected decomon
scoreboard objectives add decomon_selected dummy

# Create objectives for toggle temporary values
scoreboard objectives add decomon_shiny dummy
scoreboard objectives add decomon_wander dummy
scoreboard objectives add decomon_invuln dummy
scoreboard objectives add decomon_battle dummy
scoreboard objectives add decomon_look dummy
scoreboard objectives add decomon_noai dummy

# Create objective for scale adjustments
scoreboard objectives add decomon_scale dummy

# Create global counter for assigning IDs
scoreboard players add #next_id decomon_id 0

# Create constant for scale calculations
scoreboard players set #10 decomon_scale 10

tellraw @a [{"text":"[Decomon] ","color":"yellow"},{"text":"Datapack loaded! Use ","color":"gray"},{"text":"/function decomon:help","color":"aqua","clickEvent":{"action":"run_command","value":"/function decomon:help"}},{"text":" to get started.","color":"gray"}]


scoreboard objectives add decomon_test dummy
scoreboard players set min_scale decomon_test 0
scoreboard players set max_scale decomon_test 500
