from mecha import AstNbt
from nbtlib import serialize_tag


def to_snbt(node: AstNbt) -> str:
    return serialize_tag(node.evaluate(), compact=True, quote="'")


def nested_and_predicate(*args: dict) -> dict:
    return {
        "condition": "minecraft:inverted",
        "term": {
            "condition": "minecraft:alternative",
            "terms": [
                {"condition": "minecraft:inverted", "term": term} for term in args
            ],
        },
    }
