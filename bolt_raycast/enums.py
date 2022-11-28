from enum import Enum, auto


class BranchStatus(Enum):
    Constructed = auto()
    LoneBranch = auto()
    DoubleBranch = auto()


class EntityLoopStatus(Enum):
    NoLoop = auto()
    CollectingBody = auto()
    Deferred = auto()


class EntityLoopBreakStatus(Enum):
    All = auto()
    Some = auto()
    Single = auto()
