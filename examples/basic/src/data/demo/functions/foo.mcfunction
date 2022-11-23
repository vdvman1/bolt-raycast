from bolt_raycast:raycast import raycast

with raycast(blocks=20.1, parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
    say ray finished

with raycast(blocks = 10, parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
    say ray finished

as @a at @s anchored eyes positioned ^ ^ ^:
    with raycast(parent = __name__) as ray:
        say start ray
        for step in ray:
            say next step
            if step.is_new_block_pos():
                say new block pos!
            else:
                say oh, same block pos
        say ray finished

with raycast(parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
        if step.is_new_block_pos():
            say new block pos!
            ray.stop()
        else:
            say oh, same block pos
    say ray finished

with raycast(parent = __name__) as ray:
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
