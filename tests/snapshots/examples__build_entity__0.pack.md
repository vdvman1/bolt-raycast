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
# Detect if there are any entities at each step
function demo:foo/raycast_0/run_ray

# Detect if there are any entities at each step, with an else case
function demo:foo/raycast_1/run_ray

# Do something for each entity at each step along the ray
function demo:foo/raycast_2/run_ray

# Do something for each entity, and check if there were any entities,
# at each step along the ray
function demo:foo/raycast_3/run_ray

# Do something for each entity, and check if there were any entities
# with an else case, at each step along the ray
function demo:foo/raycast_4/run_ray

# Do something for each entity, and do an inverted check if there were
# any entities with an else case, at each step along the ray
function demo:foo/raycast_5/run_ray

# Only include non-`smithed.block` entities
function demo:foo/raycast_6/run_ray

# Include only the first entity at each step along the ray
function demo:foo/raycast_7/run_ray

# Include only the first entity at each step along the ray, and check
# if was one
function demo:foo/raycast_8/run_ray

# Explicitly include all detected entities
function demo:foo/raycast_9/run_ray

# Explicitly include all detected entities, and check if there were
# any
function demo:foo/raycast_10/run_ray

# Stop the detection of entities at each step on the first entity
# found
function demo:foo/raycast_11/run_ray

# Stop the detection of entities once a `smithed.block` entity was
# found at each step
function demo:foo/raycast_12/run_ray

# Stop the detection of entities once a `smithed.block` entity was
# found at each step, and check if there were any entities before then
function demo:foo/raycast_13/run_ray
```

`@function demo:foo/raycast_0/check_hit_entity`

```mcfunction
# This function is needed to ensure the score is checked after the
# previous entity is processed.
# Without this function, the game checks the score for all entities at
# once, before moving on to the rest of the command
execute if score #has_entity bolt_raycast.temp matches 0 positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] positioned ~0.95 ~0.95 ~0.95 run scoreboard players set #has_entity bolt_raycast.temp 1
```

`@function demo:foo/raycast_0/step`

```mcfunction
say next step
scoreboard players set #has_entity bolt_raycast.temp 0
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!bolt_raycast.source, dx=0, dy=0, dz=0, sort=nearest] run function demo:foo/raycast_0/check_hit_entity
execute unless score #has_entity bolt_raycast.temp matches 0 run say hit an entity!
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

`@function demo:foo/raycast_1/check_hit_entity`

```mcfunction
# This function is needed to ensure the score is checked after the
# previous entity is processed.
# Without this function, the game checks the score for all entities at
# once, before moving on to the rest of the command
execute if score #has_entity bolt_raycast.temp matches 0 positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] positioned ~0.95 ~0.95 ~0.95 run scoreboard players set #has_entity bolt_raycast.temp 1
```

`@function demo:foo/raycast_1/step`

```mcfunction
say next step
scoreboard players set #has_entity bolt_raycast.temp 0
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!bolt_raycast.source, dx=0, dy=0, dz=0, sort=nearest] run function demo:foo/raycast_1/check_hit_entity
execute unless score #has_entity bolt_raycast.temp matches 0 run say hit an entity!
execute if score #has_entity bolt_raycast.temp matches 0 run say no entity here
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
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!bolt_raycast.source, dx=0, dy=0, dz=0, sort=nearest] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] positioned ~0.95 ~0.95 ~0.95 run say I just got hit by the ray!
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

`@function demo:foo/raycast_3/hit_entity`

```mcfunction
say I just got hit by the ray!
scoreboard players set #has_entity bolt_raycast.temp 1
```

`@function demo:foo/raycast_3/step`

```mcfunction
say next step
scoreboard players set #has_entity bolt_raycast.temp 0
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!bolt_raycast.source, dx=0, dy=0, dz=0, sort=nearest] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] positioned ~0.95 ~0.95 ~0.95 run function demo:foo/raycast_3/hit_entity
execute unless score #has_entity bolt_raycast.temp matches 0 run say hit an entity!
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

`@function demo:foo/raycast_4/hit_entity`

```mcfunction
say I just got hit by the ray!
scoreboard players set #has_entity bolt_raycast.temp 1
```

`@function demo:foo/raycast_4/step`

```mcfunction
say next step
scoreboard players set #has_entity bolt_raycast.temp 0
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!bolt_raycast.source, dx=0, dy=0, dz=0, sort=nearest] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] positioned ~0.95 ~0.95 ~0.95 run function demo:foo/raycast_4/hit_entity
execute unless score #has_entity bolt_raycast.temp matches 0 run say hit an entity!
execute if score #has_entity bolt_raycast.temp matches 0 run say no entity here
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

`@function demo:foo/raycast_5/hit_entity`

```mcfunction
say I just got hit by the ray!
scoreboard players set #has_entity bolt_raycast.temp 1
```

`@function demo:foo/raycast_5/step`

```mcfunction
say next step
scoreboard players set #has_entity bolt_raycast.temp 0
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!bolt_raycast.source, dx=0, dy=0, dz=0, sort=nearest] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] positioned ~0.95 ~0.95 ~0.95 run function demo:foo/raycast_5/hit_entity
execute if score #has_entity bolt_raycast.temp matches 0 run say no entity here
execute unless score #has_entity bolt_raycast.temp matches 0 run say hit an entity!
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

`@function demo:foo/raycast_6/hit_entity`

```mcfunction
say I just got hit by the ray!
execute if entity @s[tag=!smithed.block] run scoreboard players set #has_entity bolt_raycast.temp 1
```

`@function demo:foo/raycast_6/step`

```mcfunction
say next step
scoreboard players set #has_entity bolt_raycast.temp 0
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!bolt_raycast.source, dx=0, dy=0, dz=0, sort=nearest] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] positioned ~0.95 ~0.95 ~0.95 run function demo:foo/raycast_6/hit_entity
execute unless score #has_entity bolt_raycast.temp matches 0 run say hit any non-block entities!
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

`@function demo:foo/raycast_7/hit_entity`

```mcfunction
say I just got hit by the ray!
scoreboard players set #has_entity bolt_raycast.temp 1
```

`@function demo:foo/raycast_7/check_hit_entity`

```mcfunction
# This function is needed to ensure the score is checked after the
# previous entity is processed.
# Without this function, the game checks the score for all entities at
# once, before moving on to the rest of the command
execute if score #hit_entity bolt_raycast.temp matches 0 positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] positioned ~0.95 ~0.95 ~0.95 run function demo:foo/raycast_7/hit_entity
```

`@function demo:foo/raycast_7/step`

```mcfunction
say next step
scoreboard players set #hit_entity bolt_raycast.temp 0
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!bolt_raycast.source, dx=0, dy=0, dz=0, sort=nearest] run function demo:foo/raycast_7/check_hit_entity
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

`@function demo:foo/raycast_8/hit_entity`

```mcfunction
say I just got hit by the ray!
scoreboard players set #has_entity bolt_raycast.temp 1
```

`@function demo:foo/raycast_8/check_hit_entity`

```mcfunction
# This function is needed to ensure the score is checked after the
# previous entity is processed.
# Without this function, the game checks the score for all entities at
# once, before moving on to the rest of the command
execute if score #hit_entity bolt_raycast.temp matches 0 positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] positioned ~0.95 ~0.95 ~0.95 run function demo:foo/raycast_8/hit_entity
```

`@function demo:foo/raycast_8/step`

```mcfunction
say next step
scoreboard players set #hit_entity bolt_raycast.temp 0
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!bolt_raycast.source, dx=0, dy=0, dz=0, sort=nearest] run function demo:foo/raycast_8/check_hit_entity
execute unless score #has_entity bolt_raycast.temp matches 0 run say hit an entity!
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

`@function demo:foo/raycast_9/hit_entity`

```mcfunction
say I just got hit by the ray!
scoreboard players set #has_entity bolt_raycast.temp 1
```

`@function demo:foo/raycast_9/step`

```mcfunction
say next step
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!bolt_raycast.source, dx=0, dy=0, dz=0, sort=nearest] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] positioned ~0.95 ~0.95 ~0.95 run function demo:foo/raycast_9/hit_entity
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

`@function demo:foo/raycast_10/hit_entity`

```mcfunction
say I just got hit by the ray!
scoreboard players set #has_entity bolt_raycast.temp 1
```

`@function demo:foo/raycast_10/step`

```mcfunction
say next step
scoreboard players set #has_entity bolt_raycast.temp 0
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!bolt_raycast.source, dx=0, dy=0, dz=0, sort=nearest] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] positioned ~0.95 ~0.95 ~0.95 run function demo:foo/raycast_10/hit_entity
execute unless score #has_entity bolt_raycast.temp matches 0 run say hit an entity!
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

`@function demo:foo/raycast_11/hit_entity`

```mcfunction
say I just got hit by the ray!
scoreboard players set #has_entity bolt_raycast.temp 1
```

`@function demo:foo/raycast_11/check_hit_entity`

```mcfunction
# This function is needed to ensure the score is checked after the
# previous entity is processed.
# Without this function, the game checks the score for all entities at
# once, before moving on to the rest of the command
execute if score #hit_entity bolt_raycast.temp matches 0 positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] positioned ~0.95 ~0.95 ~0.95 run function demo:foo/raycast_11/hit_entity
```

`@function demo:foo/raycast_11/step`

```mcfunction
say next step
scoreboard players set #hit_entity bolt_raycast.temp 0
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!bolt_raycast.source, dx=0, dy=0, dz=0, sort=nearest] run function demo:foo/raycast_11/check_hit_entity
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_11/step
```

`@function demo:foo/raycast_11/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
function demo:foo/raycast_11/step
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_12/hit_entity`

```mcfunction
say I just got hit by the ray!
execute if entity @s[tag=smithed.block] run scoreboard players set #break_entity_loop bolt_raycast.temp 1
```

`@function demo:foo/raycast_12/check_hit_entity`

```mcfunction
# This function is needed to ensure the score is checked after the
# previous entity is processed.
# Without this function, the game checks the score for all entities at
# once, before moving on to the rest of the command
execute if score #break_entity_loop bolt_raycast.temp matches 0 positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] positioned ~0.95 ~0.95 ~0.95 run function demo:foo/raycast_12/hit_entity
```

`@function demo:foo/raycast_12/step`

```mcfunction
say next step
scoreboard players set #break_entity_loop bolt_raycast.temp 0
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!bolt_raycast.source, dx=0, dy=0, dz=0, sort=nearest] run function demo:foo/raycast_12/check_hit_entity
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_12/step
```

`@function demo:foo/raycast_12/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
function demo:foo/raycast_12/step
tag @s remove bolt_raycast.source
say ray finished
```

`@function demo:foo/raycast_13/hit_entity`

```mcfunction
say I just got hit by the ray!
execute if entity @s[tag=smithed.block] run scoreboard players set #break_entity_loop bolt_raycast.temp 1
scoreboard players set #has_entity bolt_raycast.temp 1
```

`@function demo:foo/raycast_13/check_hit_entity`

```mcfunction
# This function is needed to ensure the score is checked after the
# previous entity is processed.
# Without this function, the game checks the score for all entities at
# once, before moving on to the rest of the command
execute if score #break_entity_loop bolt_raycast.temp matches 0 positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0] positioned ~0.95 ~0.95 ~0.95 run function demo:foo/raycast_13/hit_entity
```

`@function demo:foo/raycast_13/step`

```mcfunction
say next step
scoreboard players set #has_entity bolt_raycast.temp 0
scoreboard players set #break_entity_loop bolt_raycast.temp 0
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=!bolt_raycast.source, dx=0, dy=0, dz=0, sort=nearest] run function demo:foo/raycast_13/check_hit_entity
execute unless score #has_entity bolt_raycast.temp matches 0 run say hit any non-block entities!
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_13/step
```

`@function demo:foo/raycast_13/run_ray`

```mcfunction
say start ray
tag @s add bolt_raycast.source
scoreboard players set #distance bolt_raycast.temp 0
function demo:foo/raycast_13/step
tag @s remove bolt_raycast.source
say ray finished
```

### minecraft

`@function_tag minecraft:load`

```json
{
  "values": [
    "entity:generated_0"
  ]
}
```

### entity

`@function entity:generated_0`

```mcfunction
scoreboard objectives add bolt_raycast.temp dummy
```
