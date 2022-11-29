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
# 20.1 blocks
function demo:foo/raycast_0/run_ray

# 10 blocks
function demo:foo/raycast_1/run_ray

# Check if new block pos, starting from player's eyes
execute as @a at @s anchored eyes positioned ^ ^ ^ run function demo:foo/raycast_2/run_ray

# Stop on first new block pos
function demo:foo/raycast_3/run_ray

# Stop on first new block pos, with more commands in the else case
function demo:foo/raycast_4/run_ray

# Check for all stone along the ray
function demo:foo/raycast_5/run_ray

# Stop on first stone block
function demo:foo/raycast_6/run_ray

# Check for all stone along the ray, with an else case
function demo:foo/raycast_7/run_ray

# Stop on first stone block, with an else case
function demo:foo/raycast_8/run_ray

# Stop on first stone block, with an else case with more commands
function demo:foo/raycast_9/run_ray

# Check for stone only for new block positions, and stop on the first
# stone
function demo:foo/raycast_10/run_ray

# Inverted checking for stone along the ray, stopping on the first
# stone
function demo:foo/raycast_11/run_ray
```

`@function demo:foo/raycast_0/step`

```mcfunction
say next step
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..201 positioned ^ ^ ^0.1 run function demo:foo/raycast_0/step
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

`@function demo:foo/raycast_2/move_pos`

```mcfunction
execute align xyz run tp @s ~0.5 ~0.5 ~0.5
execute positioned ^ ^ ^0.1 run function demo:foo/raycast_2/step
```

`@function demo:foo/raycast_2/first_step`

```mcfunction
say next step
say new block pos!
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_2/step
```

`@function demo:foo/raycast_2/init_ray`

```mcfunction
execute align xyz run tp @s ~0.5 ~0.5 ~0.5
function demo:foo/raycast_2/first_step
kill @s
```

`@function demo:foo/raycast_2/step`

```mcfunction
say next step
execute align xyz store result score #same_block bolt_raycast.temp if entity @s[dx=0]
execute if score #same_block bolt_raycast.temp matches 0 run say new block pos!
execute unless score #same_block bolt_raycast.temp matches 0 run say oh, same block pos
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 run function demo:foo/raycast_2/move_pos
```

`@function demo:foo/raycast_2/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
summon minecraft:marker ~ ~ ~ {Tags: ["bolt_raycast.block_pos"]}
execute positioned ~-0.001 ~-0.001 ~-0.001 as @e[type=minecraft:marker, tag=bolt_raycast.block_pos, dx=0, limit=1] positioned ~0.001 ~0.001 ~0.001 run function demo:foo/raycast_2/init_ray
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_3/new_block_pos`

```mcfunction
say new block pos!
scoreboard players set #hit bolt_raycast.temp 1
```

`@function demo:foo/raycast_3/move_pos`

```mcfunction
execute align xyz run tp @s ~0.5 ~0.5 ~0.5
execute positioned ^ ^ ^0.1 run function demo:foo/raycast_3/step
```

`@function demo:foo/raycast_3/first_step`

```mcfunction
say next step
say new block pos!
scoreboard players set #hit bolt_raycast.temp 1
scoreboard players add #distance bolt_raycast.temp 1
execute if score #hit bolt_raycast.temp matches 0 if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_3/step
```

`@function demo:foo/raycast_3/init_ray`

```mcfunction
execute align xyz run tp @s ~0.5 ~0.5 ~0.5
function demo:foo/raycast_3/first_step
kill @s
```

`@function demo:foo/raycast_3/step`

```mcfunction
say next step
execute align xyz store result score #same_block bolt_raycast.temp if entity @s[dx=0]
execute if score #same_block bolt_raycast.temp matches 0 run function demo:foo/raycast_3/new_block_pos
execute unless score #same_block bolt_raycast.temp matches 0 run say oh, same block pos
scoreboard players add #distance bolt_raycast.temp 1
execute if score #hit bolt_raycast.temp matches 0 if score #distance bolt_raycast.temp matches ..100 run function demo:foo/raycast_3/move_pos
```

`@function demo:foo/raycast_3/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
scoreboard players set #hit bolt_raycast.temp 0
summon minecraft:marker ~ ~ ~ {Tags: ["bolt_raycast.block_pos"]}
execute positioned ~-0.001 ~-0.001 ~-0.001 as @e[type=minecraft:marker, tag=bolt_raycast.block_pos, dx=0, limit=1] positioned ~0.001 ~0.001 ~0.001 run function demo:foo/raycast_3/init_ray
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_4/new_block_pos`

```mcfunction
say new block pos!
scoreboard players set #hit bolt_raycast.temp 1
```

`@function demo:foo/raycast_4/same_block_pos`

```mcfunction
say oh
say guess this is the same block pos
```

`@function demo:foo/raycast_4/move_pos`

```mcfunction
execute align xyz run tp @s ~0.5 ~0.5 ~0.5
execute positioned ^ ^ ^0.1 run function demo:foo/raycast_4/step
```

`@function demo:foo/raycast_4/first_step`

```mcfunction
say next step
say new block pos!
scoreboard players set #hit bolt_raycast.temp 1
scoreboard players add #distance bolt_raycast.temp 1
execute if score #hit bolt_raycast.temp matches 0 if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_4/step
```

`@function demo:foo/raycast_4/init_ray`

```mcfunction
execute align xyz run tp @s ~0.5 ~0.5 ~0.5
function demo:foo/raycast_4/first_step
kill @s
```

`@function demo:foo/raycast_4/step`

```mcfunction
say next step
execute align xyz store result score #same_block bolt_raycast.temp if entity @s[dx=0]
execute if score #same_block bolt_raycast.temp matches 0 run function demo:foo/raycast_4/new_block_pos
execute unless score #same_block bolt_raycast.temp matches 0 run function demo:foo/raycast_4/same_block_pos
scoreboard players add #distance bolt_raycast.temp 1
execute if score #hit bolt_raycast.temp matches 0 if score #distance bolt_raycast.temp matches ..100 run function demo:foo/raycast_4/move_pos
```

`@function demo:foo/raycast_4/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
scoreboard players set #hit bolt_raycast.temp 0
summon minecraft:marker ~ ~ ~ {Tags: ["bolt_raycast.block_pos"]}
execute positioned ~-0.001 ~-0.001 ~-0.001 as @e[type=minecraft:marker, tag=bolt_raycast.block_pos, dx=0, limit=1] positioned ~0.001 ~0.001 ~0.001 run function demo:foo/raycast_4/init_ray
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_5/step`

```mcfunction
say next step
execute if block ~ ~ ~ minecraft:stone run say hit stone!
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

`@function demo:foo/raycast_6/hit_block`

```mcfunction
say hit stone!
scoreboard players set #hit bolt_raycast.temp 1
```

`@function demo:foo/raycast_6/step`

```mcfunction
say next step
execute if block ~ ~ ~ minecraft:stone run function demo:foo/raycast_6/hit_block
scoreboard players add #distance bolt_raycast.temp 1
execute if score #hit bolt_raycast.temp matches 0 if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_6/step
```

`@function demo:foo/raycast_6/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
scoreboard players set #hit bolt_raycast.temp 0
function demo:foo/raycast_6/step
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_7/step`

```mcfunction
say next step
execute store result score #has_block bolt_raycast.temp if block ~ ~ ~ minecraft:stone
execute unless score #has_block bolt_raycast.temp matches 0 run say hit stone!
execute if score #has_block bolt_raycast.temp matches 0 run say no stone yet
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

`@function demo:foo/raycast_8/hit_block`

```mcfunction
say hit stone!
scoreboard players set #hit bolt_raycast.temp 1
```

`@function demo:foo/raycast_8/step`

```mcfunction
say next step
execute store result score #has_block bolt_raycast.temp if block ~ ~ ~ minecraft:stone
execute unless score #has_block bolt_raycast.temp matches 0 run function demo:foo/raycast_8/hit_block
execute if score #has_block bolt_raycast.temp matches 0 run say no stone yet
scoreboard players add #distance bolt_raycast.temp 1
execute if score #hit bolt_raycast.temp matches 0 if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_8/step
```

`@function demo:foo/raycast_8/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
scoreboard players set #hit bolt_raycast.temp 0
function demo:foo/raycast_8/step
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_9/hit_block`

```mcfunction
say hit stone!
scoreboard players set #hit bolt_raycast.temp 1
```

`@function demo:foo/raycast_9/not_hit_block`

```mcfunction
say oh
say no stone yet
```

`@function demo:foo/raycast_9/step`

```mcfunction
say next step
execute store result score #has_block bolt_raycast.temp if block ~ ~ ~ minecraft:stone
execute unless score #has_block bolt_raycast.temp matches 0 run function demo:foo/raycast_9/hit_block
execute if score #has_block bolt_raycast.temp matches 0 run function demo:foo/raycast_9/not_hit_block
scoreboard players add #distance bolt_raycast.temp 1
execute if score #hit bolt_raycast.temp matches 0 if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_9/step
```

`@function demo:foo/raycast_9/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
scoreboard players set #hit bolt_raycast.temp 0
function demo:foo/raycast_9/step
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_10/hit_block`

```mcfunction
say hit stone!
scoreboard players set #hit bolt_raycast.temp 1
```

`@function demo:foo/raycast_10/new_block_pos`

```mcfunction
execute store result score #has_block bolt_raycast.temp if block ~ ~ ~ minecraft:stone
execute unless score #has_block bolt_raycast.temp matches 0 run function demo:foo/raycast_10/hit_block
execute if score #has_block bolt_raycast.temp matches 0 run say no stone yet
```

`@function demo:foo/raycast_10/move_pos`

```mcfunction
execute align xyz run tp @s ~0.5 ~0.5 ~0.5
execute positioned ^ ^ ^0.1 run function demo:foo/raycast_10/step
```

`@function demo:foo/raycast_10/first_step`

```mcfunction
say next step
execute store result score #has_block bolt_raycast.temp if block ~ ~ ~ minecraft:stone
execute unless score #has_block bolt_raycast.temp matches 0 run function demo:foo/raycast_10/hit_block
execute if score #has_block bolt_raycast.temp matches 0 run say no stone yet
scoreboard players add #distance bolt_raycast.temp 1
execute if score #hit bolt_raycast.temp matches 0 if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_10/step
```

`@function demo:foo/raycast_10/init_ray`

```mcfunction
execute align xyz run tp @s ~0.5 ~0.5 ~0.5
function demo:foo/raycast_10/first_step
kill @s
```

`@function demo:foo/raycast_10/step`

```mcfunction
say next step
execute align xyz store result score #same_block bolt_raycast.temp if entity @s[dx=0]
execute if score #same_block bolt_raycast.temp matches 0 run function demo:foo/raycast_10/new_block_pos
scoreboard players add #distance bolt_raycast.temp 1
execute if score #hit bolt_raycast.temp matches 0 if score #distance bolt_raycast.temp matches ..100 run function demo:foo/raycast_10/move_pos
```

`@function demo:foo/raycast_10/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
scoreboard players set #hit bolt_raycast.temp 0
summon minecraft:marker ~ ~ ~ {Tags: ["bolt_raycast.block_pos"]}
execute positioned ~-0.001 ~-0.001 ~-0.001 as @e[type=minecraft:marker, tag=bolt_raycast.block_pos, dx=0, limit=1] positioned ~0.001 ~0.001 ~0.001 run function demo:foo/raycast_10/init_ray
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_11/hit_block`

```mcfunction
say hit stone!
scoreboard players set #hit bolt_raycast.temp 1
```

`@function demo:foo/raycast_11/step`

```mcfunction
say next step
execute store result score #has_block bolt_raycast.temp if block ~ ~ ~ minecraft:stone
execute if score #has_block bolt_raycast.temp matches 0 run say no stone yet
execute unless score #has_block bolt_raycast.temp matches 0 run function demo:foo/raycast_11/hit_block
scoreboard players add #distance bolt_raycast.temp 1
execute if score #hit bolt_raycast.temp matches 0 if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_11/step
```

`@function demo:foo/raycast_11/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
scoreboard players set #hit bolt_raycast.temp 0
function demo:foo/raycast_11/step
tag @s remove bolt_raycast.source
say ray finished
```

### minecraft

`@function_tag minecraft:load`

```json
{
  "values": [
    "basic:generated_0"
  ]
}
```

### basic

`@function basic:generated_0`

```mcfunction
scoreboard objectives add bolt_raycast.temp dummy
```
