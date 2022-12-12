from bolt_raycast:raycast import raycast
from bolt_raycast.comment import Comment

comment = ctx.inject(Comment)

comment("Check for a single block")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_block("minecraft:chest"):
            say hit
        else:
            say no hit here
    say ray finished

comment()
comment("Check for a single block with block states")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_block("minecraft:chest[waterlogged=true]"):
            say hit
        else:
            say no hit here
    say ray finished

comment()
comment("Check for a single block with NBT")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_block("minecraft:chest{Items:[{Slot:0b}]}"):
            say hit
        else:
            say no hit here
    say ray finished

comment()
comment("Check for a single block with block states and NBT")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_block("minecraft:chest[waterlogged=true]{Items:[{Slot:0b}]}"):
            say hit
        else:
            say no hit here
    say ray finished

comment()
comment("Check for a collection of blocks")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_block("minecraft:chest", "minecraft:stone"):
            say hit
        else:
            say no hit here
    say ray finished

comment()
comment("Check for a collection of blocks, with only one having block states")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_block("minecraft:chest[waterlogged=true]", "minecraft:stone"):
            say hit
        else:
            say no hit here
    say ray finished

comment()
comment("Check for a collection of blocks, with only one having NBT")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_block("minecraft:chest{Items:[{Slot:0b}]}", "minecraft:stone"):
            say hit
        else:
            say no hit here
    say ray finished

comment()
comment("Check for a collection of blocks, with only one having block states and NBT")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_block("minecraft:chest[waterlogged=true]{Items:[{Slot:0b}]}", "minecraft:stone"):
            say hit
        else:
            say no hit here
    say ray finished

comment()
comment("Check for waterlogged chest or chest with slot 0")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_block("minecraft:chest[waterlogged=true]", "minecraft:chest{Items:[{Slot:0b}]}"):
            say hit
        else:
            say no hit here
    say ray finished

comment()
comment("Check for waterlogged chest, chest with slot 0, or a single block")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_block("minecraft:chest[waterlogged=true]", "minecraft:chest{Items:[{Slot:0b}]}", "minecraft:stone"):
            say hit
        else:
            say no hit here
    say ray finished

comment()
comment("Check for waterlogged chest, chest with slot 0, or a collection of blocks")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_block("minecraft:chest[waterlogged=true]", "minecraft:chest{Items:[{Slot:0b}]}", "minecraft:stone", "minecraft:dirt"):
            say hit
        else:
            say no hit here
    say ray finished