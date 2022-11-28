from bolt_raycast:raycast import raycast

with raycast(blocks=10) as ray:
  say Starting the ray
  for step in ray:
    say Next step
    if step.is_new_block_pos():
      say Moved to a new block position
      if step.detect_block("minecraft:stone"):
        say Detected a stone block
        fill ~ ~ ~ ~ ~ ~ minecraft:air destroy
        # tell the ray to stop after this step
        ray.stop()
        # note: the rest of the current step still runs
      else:
        say Not a stone block
    else:
      say Same block position as the previous step
    
    entities = step.detect_entities(id="#skeletons")
    for entity in entities:
      say Running as @s, which is in the #skeletons tag
      unless data entity @s CustomName:
        # only count skeleton without a CustomName
        entity.include()
      if data entity @s CustomName:
        # stop checking entities once a skeleton with a CustomName is found
        entity.stop()
    
    if entities:
      say At least one unnamed skeleton was found
    else:
      say No unnamed skeletons found

  say Finished the ray