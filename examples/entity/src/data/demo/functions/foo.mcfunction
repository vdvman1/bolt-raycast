from bolt_raycast:raycast import raycast
from bolt_raycast.comment import Comment

comment = ctx.inject(Comment)

comment("Detect if there are any entities at each step")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_entities():
            say hit an entity!
    say ray finished

comment()
comment("Detect if there are any entities at each step, with an else case")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        if step.detect_entities():
            say hit an entity!
        else:
            say no entity here
    say ray finished

comment()
comment("Do something for each entity at each step along the ray")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        for entity in step.detect_entities():
            say I just got hit by the ray!
    say ray finished

comment()
comment("Do something for each entity, and check if there were any entities, at each step along the ray")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        entities = step.detect_entities()
        for entity in entities:
            say I just got hit by the ray!
        
        if entities:
            say hit an entity!
    say ray finished

comment()
comment("Do something for each entity, and check if there were any entities with an else case, at each step along the ray")
with raycast() as ray:
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

comment()
comment("Do something for each entity, and do an inverted check if there were any entities with an else case, at each step along the ray")
with raycast() as ray:
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

comment()
comment("Only include non-`smithed.block` entities")
with raycast() as ray:
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

comment()
comment("Include only the first entity at each step along the ray")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        entities = step.detect_entities()
        for entity in entities:
            say I just got hit by the ray!
            entity.include_only_and_stop()
    say ray finished

comment()
comment("Include only the first entity at each step along the ray, and check if was one")
with raycast() as ray:
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

comment()
comment("Explicitly include all detected entities")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        entities = step.detect_entities()
        for entity in entities:
            say I just got hit by the ray!
            entity.include()

    say ray finished

comment()
comment("Explicitly include all detected entities, and check if there were any")
with raycast() as ray:
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

comment()
comment("Stop the detection of entities at each step on the first entity found")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        entities = step.detect_entities()
        for entity in entities:
            say I just got hit by the ray!
            entity.stop()
    say ray finished

comment()
comment("Stop the detection of entities once a `smithed.block` entity was found at each step")
with raycast() as ray:
    say start ray
    for step in ray:
        say next step
        entities = step.detect_entities()
        for entity in entities:
            say I just got hit by the ray!
            if entity @s[tag=smithed.block]:
                entity.stop()

    say ray finished

comment()
comment("Stop the detection of entities once a `smithed.block` entity was found at each step, and check if there were any entities before then")
with raycast() as ray:
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