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

### combo

`@function combo:cast`

```mcfunction
function combo:cast/raycast_0/run_ray
```

`@function combo:cast/raycast_0/hit_block`

```mcfunction
say Detected a stone block
fill ~ ~ ~ ~ ~ ~ minecraft:air destroy
scoreboard players set #hit bolt_raycast.temp 1
```

`@function combo:cast/raycast_0/new_block_pos`

```mcfunction
say Moved to a new block position
execute store result score #has_block bolt_raycast.temp if block ~ ~ ~ minecraft:stone
execute unless score #has_block bolt_raycast.temp matches 0 run function combo:cast/raycast_0/hit_block
execute if score #has_block bolt_raycast.temp matches 0 run say Not a stone block
```

`@function combo:cast/raycast_0/hit_entity`

```mcfunction
say Running as @s, which is in the #skeletons tag
execute unless data entity @s CustomName run scoreboard players set #has_entity bolt_raycast.temp 1
execute if data entity @s CustomName run scoreboard players set #break_entity_loop bolt_raycast.temp 1
```

`@function combo:cast/raycast_0/check_hit_entity`

```mcfunction
# This function is needed to ensure the score is checked after the
# previous entity is processed.
# Without this function, the game checks the score for all entities at
# once, before moving on to the rest of the command
execute if score #break_entity_loop bolt_raycast.temp matches 0 positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] positioned ~0.95 ~0.95 ~0.95 run function combo:cast/raycast_0/hit_entity
```

`@function combo:cast/raycast_0/move_pos`

```mcfunction
execute align xyz run tp @s ~0.5 ~0.5 ~0.5
execute positioned ^ ^ ^0.1 run function combo:cast/raycast_0/step
```

`@function combo:cast/raycast_0/first_step`

```mcfunction
say Next step
say Moved to a new block position
execute store result score #has_block bolt_raycast.temp if block ~ ~ ~ minecraft:stone
execute unless score #has_block bolt_raycast.temp matches 0 run function combo:cast/raycast_0/hit_block
execute if score #has_block bolt_raycast.temp matches 0 run say Not a stone block
scoreboard players set #has_entity bolt_raycast.temp 0
scoreboard players set #break_entity_loop bolt_raycast.temp 0
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[type=#skeletons, tag=!bolt_raycast.source, tag=!bolt_raycast.block_pos, dx=0, dy=0, dz=0, sort=nearest] run function combo:cast/raycast_0/check_hit_entity
execute unless score #has_entity bolt_raycast.temp matches 0 run say At least one unnamed skeleton was found
execute if score #has_entity bolt_raycast.temp matches 0 run say No unnamed skeletons found
scoreboard players add #distance bolt_raycast.temp 1
execute if score #hit bolt_raycast.temp matches 0 if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function combo:cast/raycast_0/step
```

`@function combo:cast/raycast_0/init_ray`

```mcfunction
execute align xyz run tp @s ~0.5 ~0.5 ~0.5
function combo:cast/raycast_0/first_step
kill @s
```

`@function combo:cast/raycast_0/step`

```mcfunction
say Next step
execute align xyz store result score #same_block bolt_raycast.temp if entity @s[dx=0]
execute if score #same_block bolt_raycast.temp matches 0 run function combo:cast/raycast_0/new_block_pos
execute unless score #same_block bolt_raycast.temp matches 0 run say Same block position as the previous step
scoreboard players set #has_entity bolt_raycast.temp 0
scoreboard players set #break_entity_loop bolt_raycast.temp 0
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[type=#skeletons, tag=!bolt_raycast.source, tag=!bolt_raycast.block_pos, dx=0, dy=0, dz=0, sort=nearest] run function combo:cast/raycast_0/check_hit_entity
execute unless score #has_entity bolt_raycast.temp matches 0 run say At least one unnamed skeleton was found
execute if score #has_entity bolt_raycast.temp matches 0 run say No unnamed skeletons found
scoreboard players add #distance bolt_raycast.temp 1
execute if score #hit bolt_raycast.temp matches 0 if score #distance bolt_raycast.temp matches ..100 run function combo:cast/raycast_0/move_pos
```

`@function combo:cast/raycast_0/run_ray`

```mcfunction
say Starting the ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
scoreboard players set #hit bolt_raycast.temp 0
summon minecraft:marker ~ ~ ~ {Tags: ["bolt_raycast.block_pos"]}
execute positioned ~-0.001 ~-0.001 ~-0.001 as @e[type=minecraft:marker, tag=bolt_raycast.block_pos, dx=0, limit=1] positioned ~0.001 ~0.001 ~0.001 run function combo:cast/raycast_0/init_ray
tag @s remove bolt_raycast.source
say Finished the ray
```

`@function combo:generated_0`

```mcfunction
scoreboard objectives add bolt_raycast.temp dummy
```

### minecraft

`@function_tag minecraft:load`

```json
{
  "values": [
    "combo:generated_0"
  ]
}
```
