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