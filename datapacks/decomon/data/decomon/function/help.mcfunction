# Decomon - Decorative Cobblemon Helper
# Main help menu with clickable commands
#
# NOTE: The tellraw command must be on a single line for Minecraft to parse it correctly.
# The JSON is formatted with sections marked below for readability:
#
# Sections:
# - Header (gold/yellow)
# - Spawn & Select (green/yellow)
# - Toggles (aqua) - all auto-runnable, no params needed
# - Customization (light_purple)
# - Scale (gold)
# - Movement & Removal (yellow/red)

tellraw @s {
      "text":"",
      "extra":[
        {"text":"========== ","color":"gold"},
        {"text":"Decomon","color":"yellow","bold":true},
        {"text":" ==========\n","color":"gold"},
        {"text":"Decorative Cobblemon Helper for Village Building\n\n","color":"gray"},
        {
          "text":"[Spawn Pokemon]",
          "color":"green",
          "clickEvent":{
            "action":"suggest_command",
            "value":"/function decomon:spawn {species:\"\",level:50}"},
            "hoverEvent":{
              "action":"show_text",
              "value":"Spawn a decorative Cobblemon (auto-selected)"
            }
          },
          {"text":"  "},
          {
            "text":"[Make Decomon]",
            "color":"green",
            "clickEvent":{
              "action":"suggest_command",
              "value":"/execute as @e[type=cobblemon:pokemon,limit=1,sort=nearest] run function decomon:make_decomon"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Convert nearest Cobblemon to decorative (auto-selected)"
            }
          },
          {"text":"\n"},
          {
            "text":"[Select Nearest]",
            "color":"yellow",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:select"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Select nearest Cobblemon within 10 blocks"
            }
          },
          {"text":"  "},
          {
            "text":"[Highlight Selected]",
            "color":"yellow",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:highlight"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Highlight selected Cobblemon with glowing effect"
            }
          },
          {"text":"  "},
          {
            "text":"[Info]",
            "color":"yellow",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:info"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Display info about selected Cobblemon"
            }
          },
          {"text":"\n\n"},
          {"text":"Shiny:             ","color":"gray"},
          {
            "text":"[ON]",
            "color":"green",
            "clickEvent":{"action":"run_command","value":"/function decomon:set_shiny {shiny:1}"},
            "hoverEvent":{"action":"show_text","value":"Enable shiny"}
          },
          {"text":" "},
          {
            "text":"[OFF]",
            "color":"red",
            "clickEvent":{"action":"run_command","value":"/function decomon:set_shiny {shiny:0}"},
            "hoverEvent":{"action":"show_text","value":"Disable shiny"}
          },
          {"text":"\n"},
          {"text":"Wandering:         ","color":"gray"},
          {
            "text":"[ON]",
            "color":"green",
            "clickEvent":{"action":"run_command","value":"/function decomon:set_wandering {wandering:1}"},
            "hoverEvent":{"action":"show_text","value":"Enable wandering"}
          },
          {"text":" "},
          {
            "text":"[OFF]",
            "color":"red",
            "clickEvent":{"action":"run_command","value":"/function decomon:set_wandering {wandering:0}"},
            "hoverEvent":{"action":"show_text","value":"Disable wandering"}
          },
          {"text":"\n"},
          {"text":"Invulnerable:      ","color":"gray"},
          {
            "text":"[ON]",
            "color":"green",
            "clickEvent":{"action":"run_command","value":"/function decomon:set_invulnerable {invulnerable:1}"},
            "hoverEvent":{"action":"show_text","value":"Enable invulnerability"}
          },
          {"text":" "},
          {
            "text":"[OFF]",
            "color":"red",
            "clickEvent":{"action":"run_command","value":"/function decomon:set_invulnerable {invulnerable:0}"},
            "hoverEvent":{"action":"show_text","value":"Disable invulnerability"}
          },
          {"text":"\n"},
          {"text":"Unbattleable:      ","color":"gray"},
          {
            "text":"[ON]",
            "color":"green",
            "clickEvent":{"action":"run_command","value":"/function decomon:set_unbattleable {unbattleable:1}"},
            "hoverEvent":{"action":"show_text","value":"Make unbattleable"}
          },
          {"text":" "},
          {
            "text":"[OFF]",
            "color":"red",
            "clickEvent":{"action":"run_command","value":"/function decomon:set_unbattleable {unbattleable:0}"},
            "hoverEvent":{"action":"show_text","value":"Make battleable"}
          },
          {"text":"\n"},
          {"text":"Looks at Player:   ","color":"gray"},
          {
            "text":"[ON]",
            "color":"green",
            "clickEvent":{"action":"run_command","value":"/function decomon:set_looks_at_player {looks:1}"},
            "hoverEvent":{"action":"show_text","value":"Enable looking at players"}
          },
          {"text":" "},
          {
            "text":"[OFF]",
            "color":"red",
            "clickEvent":{"action":"run_command","value":"/function decomon:set_looks_at_player {looks:0}"},
            "hoverEvent":{"action":"show_text","value":"Disable looking at players"}
          },
          {"text":"\n"},
          {"text":"NoAI:              ","color":"gray"},
          {
            "text":"[ON]",
            "color":"green",
            "clickEvent":{"action":"run_command","value":"/function decomon:set_no_ai {no_ai:1}"},
            "hoverEvent":{"action":"show_text","value":"Enable statue mode"}
          },
          {"text":" "},
          {
            "text":"[OFF]",
            "color":"red",
            "clickEvent":{"action":"run_command","value":"/function decomon:set_no_ai {no_ai:0}"},
            "hoverEvent":{"action":"show_text","value":"Disable statue mode"}
          },
          {"text":"\n"},
          {"text":"Uncatchable:       ","color":"gray"},
          {
            "text":"[ON]",
            "color":"green",
            "clickEvent":{"action":"run_command","value":"/function decomon:set_uncatchable {uncatchable:1}"},
            "hoverEvent":{"action":"show_text","value":"Make uncatchable"}
          },
          {"text":" "},
          {
            "text":"[OFF]",
            "color":"red",
            "clickEvent":{"action":"run_command","value":"/function decomon:set_uncatchable {uncatchable:0}"},
            "hoverEvent":{"action":"show_text","value":"Make catchable"}
          },
          {"text":"\n\n"},
          {
            "text":"[Rename]",
            "color":"light_purple",
            "clickEvent":{
              "action":"suggest_command",
              "value":"/function decomon:rename {name:\"\"}"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Set nickname for selected Cobblemon"
            }
          },
          {"text":"  "},
          {
            "text":"[Set Level]",
            "color":"light_purple",
            "clickEvent":{
              "action":"suggest_command",
              "value":"/function decomon:set_level {level:50}"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Set level of selected Cobblemon"
            }
          },
          {"text":"\n"},
          {
            "text":"[Float]",
            "color":"light_purple",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:pose/float"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Set pose to float"
            }
          },
          {"text":" "},
          {
            "text":"[Fly]",
            "color":"light_purple",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:pose/fly"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Set pose to fly"
            }
          },
          {"text":" "},
          {
            "text":"[Glide]",
            "color":"light_purple",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:pose/glide"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Set pose to glide"
            }
          },
          {"text":" "},
          {
            "text":"[Hover]",
            "color":"light_purple",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:pose/hover"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Set pose to hover"
            }
          },
          {"text":"\n"},
          {
            "text":"[Stand]",
            "color":"light_purple",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:pose/stand"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Set pose to stand"
            }
          },
          {"text":" "},
          {
            "text":"[Swim]",
            "color":"light_purple",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:pose/swim"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Set pose to swim"
            }
          },
          {"text":" "},
          {
            "text":"[Walk]",
            "color":"light_purple",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:pose/walk"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Set pose to walk"
            }
          },
          {"text":" "},
          {
            "text":"[Sleep]",
            "color":"light_purple",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:pose/sleep"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Set pose to sleep"
            }
          },
          {"text":"\n"},
          {
            "text":"[Scale +10%]",
            "color":"gold",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:scale_up"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Increase size by 10%"
            }
          },
          {"text":"  "},
          {
            "text":"[Scale +5%]",
            "color":"gold",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:scale_up_small"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Increase size by 5%"
            }
          },
          {"text":"  "},
          {
            "text":"[Set Scale]",
            "color":"gold",
            "clickEvent":{
              "action":"suggest_command",
              "value":"/function decomon:set_scale {scalePercent:100}"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Set scale to exact percentage (5-1000%)"
            }
          },
          {"text":"\n"},
          {
            "text":"[Scale -10%]",
            "color":"gold",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:scale_down"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Decrease size by 10%"
            }
          },
          {"text":"  "},
          {
            "text":"[Scale -5%]",
            "color":"gold",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:scale_down_small"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Decrease size by 5%"
            }
          },
          {"text":"  "},
          {
            "text":"[Reset Scale]",
            "color":"gold",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:scale_reset"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Reset size to default (100%)"
            }
          },
          {"text":"\n"},
          {
            "text":"[Move to Me]",
            "color":"yellow",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:move"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Teleport selected Cobblemon to your position"
            }
          },
          {"text":"  "},
          {
            "text":"[Remove]",
            "color":"red",
            "clickEvent":{
              "action":"run_command",
              "value":"/function decomon:remove"
            },
            "hoverEvent":{
              "action":"show_text",
              "value":"Remove/kill selected Cobblemon"
            }
          },
          {"text":"\n\n"},
          {"text":"============================","color":"gold"}
        ]
      }
