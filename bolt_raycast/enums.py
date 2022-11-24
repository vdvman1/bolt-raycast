from enum import Enum, auto


class BranchStatus(Enum):
    Constructed = auto()
    LoneBranch = auto()
    DoubleBranch = auto()
