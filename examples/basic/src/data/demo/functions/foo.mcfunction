from bolt_raycast:raycast import raycast
from bolt_raycast.enums import DistanceType

with raycast(parent = __name__, max_distance=(20.1, DistanceType.Blocks)) as ray:
    say start ray
    for step in ray:
        say next step
    say ray finished

with raycast(parent = __name__, max_distance=(10, DistanceType.Blocks)) as ray:
    say start ray
    for step in ray:
        say next step
    say ray finished