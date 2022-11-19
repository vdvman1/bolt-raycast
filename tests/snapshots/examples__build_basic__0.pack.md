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
tag @s add bolt_raycast.source
scoreboard players set #hit bolt_raycast.temp 0
scoreboard players set #distance bolt_raycast.temp 0
say start ray
function demo:foo/raycast_0/step
say ray finished
tag @s remove bolt_raycast.source
tag @s add bolt_raycast.source
scoreboard players set #hit bolt_raycast.temp 0
scoreboard players set #distance bolt_raycast.temp 0
say start ray
function demo:foo/raycast_1/step
say ray finished
tag @s remove bolt_raycast.source
```

`@function demo:foo/raycast_0/step`

```mcfunction
say next step
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..201 positioned ^ ^ ^0.1 run function demo:foo/raycast_0/step
```

`@function demo:foo/raycast_1/step`

```mcfunction
say next step
scoreboard players add #distance bolt_raycast.temp 1
execute if score #distance bolt_raycast.temp matches ..100 positioned ^ ^ ^0.1 run function demo:foo/raycast_1/step
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
