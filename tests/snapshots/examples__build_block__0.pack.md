# Lectern snapshot

## Data pack

`@data_pack pack.mcmeta`

```json
{
  "pack": {
    "pack_format": 10,
    "description": ""
  }
}
```

### demo

`@function demo:foo`

```mcfunction
# Check for a single block
function demo:foo/raycast_0/run_ray

# Check for a single block with block states
function demo:foo/raycast_1/run_ray

# Check for a single block with NBT
function demo:foo/raycast_2/run_ray

# Check for a single block with block states and NBT
function demo:foo/raycast_3/run_ray

# Check for a collection of blocks
function demo:foo/raycast_4/run_ray

# Check for a collection of blocks, with only one having block states
function demo:foo/raycast_5/run_ray

# Check for a collection of blocks, with only one having NBT
function demo:foo/raycast_6/run_ray

# Check for a collection of blocks, with only one having block states
# and NBT
function demo:foo/raycast_7/run_ray

# Check for waterlogged chest or chest with slot 0
function demo:foo/raycast_8/run_ray

# Check for waterlogged chest, chest with slot 0, or a single block
function demo:foo/raycast_9/run_ray

# Check for waterlogged chest, chest with slot 0, or a collection of
# blocks
function demo:foo/raycast_10/run_ray
```

`@function demo:foo/raycast_0/step`

```mcfunction
say next step
execute store result score #has_block bolt_raycast.temp if block ~ ~ ~ minecraft:chest
execute unless score #has_block bolt_raycast.temp matches 0 run say hit
execute if score #has_block bolt_raycast.temp matches 0 run say no hit here
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_0/step
```

`@function demo:foo/raycast_0/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
function demo:foo/raycast_0/step
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_1/step`

```mcfunction
say next step
execute store result score #has_block bolt_raycast.temp if block ~ ~ ~ minecraft:chest[waterlogged=true]
execute unless score #has_block bolt_raycast.temp matches 0 run say hit
execute if score #has_block bolt_raycast.temp matches 0 run say no hit here
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_1/step
```

`@function demo:foo/raycast_1/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
function demo:foo/raycast_1/step
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_2/step`

```mcfunction
say next step
execute store result score #has_block bolt_raycast.temp if block ~ ~ ~ minecraft:chest{Items:[{Slot:0b}]}
execute unless score #has_block bolt_raycast.temp matches 0 run say hit
execute if score #has_block bolt_raycast.temp matches 0 run say no hit here
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_2/step
```

`@function demo:foo/raycast_2/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
function demo:foo/raycast_2/step
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_3/step`

```mcfunction
say next step
execute store result score #has_block bolt_raycast.temp if block ~ ~ ~ minecraft:chest[waterlogged=true]{Items:[{Slot:0b}]}
execute unless score #has_block bolt_raycast.temp matches 0 run say hit
execute if score #has_block bolt_raycast.temp matches 0 run say no hit here
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_3/step
```

`@function demo:foo/raycast_3/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
function demo:foo/raycast_3/step
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_4/step`

```mcfunction
say next step
execute store result score #has_block bolt_raycast.temp if block ~ ~ ~ #demo:foo/raycast_4/blocks
execute unless score #has_block bolt_raycast.temp matches 0 run say hit
execute if score #has_block bolt_raycast.temp matches 0 run say no hit here
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_4/step
```

`@function demo:foo/raycast_4/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
function demo:foo/raycast_4/step
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_5/step`

```mcfunction
say next step
execute store result score #has_block bolt_raycast.temp if predicate demo:foo/raycast_5/blocks
execute unless score #has_block bolt_raycast.temp matches 0 run say hit
execute if score #has_block bolt_raycast.temp matches 0 run say no hit here
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_5/step
```

`@function demo:foo/raycast_5/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
function demo:foo/raycast_5/step
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_6/step`

```mcfunction
say next step
execute store result score #has_block bolt_raycast.temp if predicate demo:foo/raycast_6/blocks
execute unless score #has_block bolt_raycast.temp matches 0 run say hit
execute if score #has_block bolt_raycast.temp matches 0 run say no hit here
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_6/step
```

`@function demo:foo/raycast_6/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
function demo:foo/raycast_6/step
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_7/step`

```mcfunction
say next step
execute store result score #has_block bolt_raycast.temp if predicate demo:foo/raycast_7/blocks
execute unless score #has_block bolt_raycast.temp matches 0 run say hit
execute if score #has_block bolt_raycast.temp matches 0 run say no hit here
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_7/step
```

`@function demo:foo/raycast_7/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
function demo:foo/raycast_7/step
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_8/step`

```mcfunction
say next step
execute store result score #has_block bolt_raycast.temp if predicate demo:foo/raycast_8/blocks
execute unless score #has_block bolt_raycast.temp matches 0 run say hit
execute if score #has_block bolt_raycast.temp matches 0 run say no hit here
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_8/step
```

`@function demo:foo/raycast_8/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
function demo:foo/raycast_8/step
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_9/step`

```mcfunction
say next step
execute store result score #has_block bolt_raycast.temp if predicate demo:foo/raycast_9/blocks
execute unless score #has_block bolt_raycast.temp matches 0 run say hit
execute if score #has_block bolt_raycast.temp matches 0 run say no hit here
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_9/step
```

`@function demo:foo/raycast_9/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
function demo:foo/raycast_9/step
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_10/step`

```mcfunction
say next step
execute store result score #has_block bolt_raycast.temp if predicate demo:foo/raycast_10/blocks
execute unless score #has_block bolt_raycast.temp matches 0 run say hit
execute if score #has_block bolt_raycast.temp matches 0 run say no hit here
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_10/step
```

`@function demo:foo/raycast_10/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
function demo:foo/raycast_10/step
tag @s remove bolt_raycast.source
say ray finished
```

`@block_tag demo:foo/raycast_4/blocks`

```json
{
  "values": [
    "minecraft:chest",
    "minecraft:stone"
  ]
}
```

`@predicate demo:foo/raycast_5/blocks`

```json
{
  "condition": "minecraft:alternative",
  "terms": [
    {
      "condition": "minecraft:location_check",
      "predicate": {
        "block": {
          "blocks": [
            "minecraft:stone"
          ]
        }
      }
    },
    {
      "condition": "minecraft:location_check",
      "predicate": {
        "block": {
          "blocks": [
            "minecraft:chest"
          ],
          "state": {
            "waterlogged": "true"
          }
        }
      }
    }
  ]
}
```

`@predicate demo:foo/raycast_6/blocks`

```json
{
  "condition": "minecraft:alternative",
  "terms": [
    {
      "condition": "minecraft:location_check",
      "predicate": {
        "block": {
          "blocks": [
            "minecraft:stone"
          ]
        }
      }
    },
    {
      "condition": "minecraft:location_check",
      "predicate": {
        "block": {
          "blocks": [
            "minecraft:chest"
          ],
          "nbt": "{Items:[{Slot:0b}]}"
        }
      }
    }
  ]
}
```

`@predicate demo:foo/raycast_7/blocks`

```json
{
  "condition": "minecraft:alternative",
  "terms": [
    {
      "condition": "minecraft:location_check",
      "predicate": {
        "block": {
          "blocks": [
            "minecraft:stone"
          ]
        }
      }
    },
    {
      "condition": "minecraft:location_check",
      "predicate": {
        "block": {
          "blocks": [
            "minecraft:chest"
          ],
          "state": {
            "waterlogged": "true"
          },
          "nbt": "{Items:[{Slot:0b}]}"
        }
      }
    }
  ]
}
```

`@predicate demo:foo/raycast_8/blocks`

```json
{
  "condition": "minecraft:alternative",
  "terms": [
    {
      "condition": "minecraft:inverted",
      "term": {
        "condition": "minecraft:alternative",
        "terms": [
          {
            "condition": "minecraft:inverted",
            "term": {
              "condition": "minecraft:location_check",
              "predicate": {
                "block": {
                  "blocks": [
                    "minecraft:chest"
                  ]
                }
              }
            }
          },
          {
            "condition": "minecraft:inverted",
            "term": {
              "condition": "minecraft:alternative",
              "terms": [
                {
                  "condition": "minecraft:location_check",
                  "predicate": {
                    "block": {
                      "state": {
                        "waterlogged": "true"
                      }
                    }
                  }
                },
                {
                  "condition": "minecraft:location_check",
                  "predicate": {
                    "block": {
                      "nbt": "{Items:[{Slot:0b}]}"
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }
  ]
}
```

`@predicate demo:foo/raycast_9/blocks`

```json
{
  "condition": "minecraft:alternative",
  "terms": [
    {
      "condition": "minecraft:location_check",
      "predicate": {
        "block": {
          "blocks": [
            "minecraft:stone"
          ]
        }
      }
    },
    {
      "condition": "minecraft:inverted",
      "term": {
        "condition": "minecraft:alternative",
        "terms": [
          {
            "condition": "minecraft:inverted",
            "term": {
              "condition": "minecraft:location_check",
              "predicate": {
                "block": {
                  "blocks": [
                    "minecraft:chest"
                  ]
                }
              }
            }
          },
          {
            "condition": "minecraft:inverted",
            "term": {
              "condition": "minecraft:alternative",
              "terms": [
                {
                  "condition": "minecraft:location_check",
                  "predicate": {
                    "block": {
                      "state": {
                        "waterlogged": "true"
                      }
                    }
                  }
                },
                {
                  "condition": "minecraft:location_check",
                  "predicate": {
                    "block": {
                      "nbt": "{Items:[{Slot:0b}]}"
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }
  ]
}
```

`@predicate demo:foo/raycast_10/blocks`

```json
{
  "condition": "minecraft:alternative",
  "terms": [
    {
      "condition": "minecraft:location_check",
      "predicate": {
        "block": {
          "blocks": [
            "minecraft:dirt",
            "minecraft:stone"
          ]
        }
      }
    },
    {
      "condition": "minecraft:inverted",
      "term": {
        "condition": "minecraft:alternative",
        "terms": [
          {
            "condition": "minecraft:inverted",
            "term": {
              "condition": "minecraft:location_check",
              "predicate": {
                "block": {
                  "blocks": [
                    "minecraft:chest"
                  ]
                }
              }
            }
          },
          {
            "condition": "minecraft:inverted",
            "term": {
              "condition": "minecraft:alternative",
              "terms": [
                {
                  "condition": "minecraft:location_check",
                  "predicate": {
                    "block": {
                      "state": {
                        "waterlogged": "true"
                      }
                    }
                  }
                },
                {
                  "condition": "minecraft:location_check",
                  "predicate": {
                    "block": {
                      "nbt": "{Items:[{Slot:0b}]}"
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }
  ]
}
```

### minecraft

`@function_tag minecraft:load`

```json
{
  "values": [
    "block:generated_0"
  ]
}
```

### block

`@function block:generated_0`

```mcfunction
scoreboard objectives add bolt_raycast.temp dummy
```
