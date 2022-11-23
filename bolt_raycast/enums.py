from enum import Enum, auto


class BranchStatus(Enum):
    Constructed = auto()
    SingleBranch = auto()
    Else = auto()
