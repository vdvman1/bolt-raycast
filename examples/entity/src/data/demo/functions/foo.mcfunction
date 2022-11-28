from bolt_raycast:raycast import raycast

with raycast(parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_entities():
            say hit an entity!
    say ray finished

with raycast(parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_entities():
            say hit an entity!
        else:
            say no entity here
    say ray finished

with raycast(parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
        for entity in step.detect_entities():
            say I just got hit by the ray!
    say ray finished

with raycast(parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
        entities = step.detect_entities()
        for entity in entities:
            say I just got hit by the ray!
        
        if entities:
            say hit an entity!
    say ray finished

with raycast(parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
        entities = step.detect_entities()
        for entity in entities:
            say I just got hit by the ray!
        
        if entities:
            say hit an entity!
        else:
            say no entity here
    say ray finished

with raycast(parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
        entities = step.detect_entities()
        for entity in entities:
            say I just got hit by the ray!
        
        if not entities:
            say no entity here
        else:
            say hit an entity!
    say ray finished

with raycast(parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
        entities = step.detect_entities()
        for entity in entities:
            say I just got hit by the ray!
            if entity @s[tag=!smithed.block]:
                entity.include()
        
        if entities:
            say hit any non-block entities!
    say ray finished

with raycast(parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
        entities = step.detect_entities()
        for entity in entities:
            say I just got hit by the ray!
            entity.include_only_and_stop()
    say ray finished

with raycast(parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
        entities = step.detect_entities()
        for entity in entities:
            say I just got hit by the ray!
            entity.include_only_and_stop()
        
        if entities:
            say hit an entity!
    say ray finished

with raycast(parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
        entities = step.detect_entities()
        for entity in entities:
            say I just got hit by the ray!
            entity.include()

    say ray finished

with raycast(parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
        entities = step.detect_entities()
        for entity in entities:
            say I just got hit by the ray!
            entity.include()
        
        if entities:
            say hit an entity!
    say ray finished

with raycast(parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
        entities = step.detect_entities()
        for entity in entities:
            say I just got hit by the ray!
            entity.stop()
    say ray finished

with raycast(parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
        entities = step.detect_entities()
        for entity in entities:
            say I just got hit by the ray!
            if entity @s[tag=smithed.block]:
                entity.stop()

    say ray finished

with raycast(parent = __name__) as ray:
    say start ray
    for step in ray:
        say next step
        entities = step.detect_entities()
        for entity in entities:
            say I just got hit by the ray!
            if entity @s[tag=smithed.block]:
                entity.stop()
        
        if entities:
            say hit any non-block entities!
    say ray finished