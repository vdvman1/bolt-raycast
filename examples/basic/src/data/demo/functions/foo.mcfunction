from bolt_raycast:raycast import raycast
from bolt_raycast.comment import Comment

comment = ctx.inject(Comment)

comment("20.1 blocks")
with raycast(blocks=20.1) as ray:
    say start ray
    for step in ray:
        say next step
    say ray finished

comment()
comment("10 blocks")
with raycast(blocks = 10) as ray:
    say start ray
    for step in ray:
        say next step
    say ray finished

comment()
comment("Check if new block pos, starting from player's eyes")
as @a at @s anchored eyes positioned ^ ^ ^:
    with raycast() as ray:
        say start ray
        for step in ray:
            say next step
            if step.is_new_block_pos():
                say new block pos!
            else:
                say oh, same block pos
        say ray finished

comment()
comment("Stop on first new block pos")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.is_new_block_pos():
            say new block pos!
            ray.stop()
        else:
            say oh, same block pos
    say ray finished

comment()
comment("Stop on first new block pos, with more commands in the else case")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.is_new_block_pos():
            say new block pos!
            ray.stop()
        else:
            say oh
            say guess this is the same block pos
    say ray finished

comment()
comment("Check for all stone along the ray")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_block("minecraft:stone"):
            say hit stone!
    say ray finished

comment()
comment("Stop on first stone block")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_block("minecraft:stone"):
            say hit stone!
            ray.stop()
    say ray finished

comment()
comment("Check for all stone along the ray, with an else case")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_block("minecraft:stone"):
            say hit stone!
        else:
            say no stone yet
    say ray finished

comment()
comment("Stop on first stone block, with an else case")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_block("minecraft:stone"):
            say hit stone!
            ray.stop()
        else:
            say no stone yet
    say ray finished

comment()
comment("Stop on first stone block, with an else case with more commands")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_block("minecraft:stone"):
            say hit stone!
            ray.stop()
        else:
            say oh
            say no stone yet
    say ray finished

comment()
comment("Check for stone only for new block positions, and stop on the first stone")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.is_new_block_pos():
            if step.detect_block("minecraft:stone"):
                say hit stone!
                ray.stop()
            else:
                say no stone yet
    say ray finished

comment()
comment("Inverted checking for stone along the ray, stopping on the first stone")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if not step.detect_block("minecraft:stone"):
            say no stone yet
        else:
            say hit stone!
            ray.stop()
    say ray finished

comment()
comment("Inline raycast in the current function instead of creating a new function")
with raycast(emit_root_func=False) as ray:
    say start ray
    for step in ray:
        say next step
    say ray finished

comment()
comment("Explicitly specify the name of the ray function. Don't generate raycast_{incr} folders")
with raycast(function=./named_ray) as ray:
    say start ray
    for step in ray:
        say next step
    say ray finished

comment()
comment("Explicitly specify the name of the ray function, but inline it in the current function")
with raycast(function=./inline_named_ray,emit_root_func=False) as ray:
    say start ray
    for step in ray:
        say next step
    say ray finished

comment()
comment("Explicitly specify the parent for all functions generated")
with raycast(parent=./explicit_parent) as ray:
    say start ray
    for step in ray:
        say next step
    say ray finished

comment()
comment("Explicitly specify the parent for all functions generated, and inline the ray function")
with raycast(parent=./inline_explicit_parent,emit_root_func=False) as ray:
    say start ray
    for step in ray:
        say next step
    say ray finished