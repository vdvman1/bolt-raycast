from mecha import AstNbt
from nbtlib import serialize_tag


def to_snbt(node: AstNbt) -> str:
    return serialize_tag(node.evaluate(), compact=True, quote="'")
