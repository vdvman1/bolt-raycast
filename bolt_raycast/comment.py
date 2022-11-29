from bolt import Runtime
from beet import Context
from beet.core.utils import required_field
from mecha import Mecha, rule, AstCommandSentinel
from dataclasses import dataclass
from textwrap import TextWrapper, dedent
import re
from itertools import chain

__all__ = ["Comment", "AstExplicitComment", "serialise_comment", "comment"]

comment_prefix = "# "
wrapper = TextWrapper(initial_indent=comment_prefix, subsequent_indent=comment_prefix)

paragraph_pattern = re.compile(
    r"""
    \r?\n
    [^\S\r\n]*  # ignore whitespaces other than newlines, not(not \s or \r or \n) == \s and not \r and not \n
    \r?\n
    """,
    flags=re.VERBOSE,
)


@dataclass(frozen=True)
class AstExplicitComment(AstCommandSentinel):
    comment: str = required_field()


@rule(AstExplicitComment)
def serialise_comment(node: AstExplicitComment, result: list[str]):
    paragraphs = (
        wrapper.wrap(dedent(paragraph))
        for paragraph in re.split(paragraph_pattern, node.comment)
    )
    lines = chain.from_iterable(paragraphs)
    result.append("\n".join(lines))


def beet_default(ctx: Context):
    ctx.require(comment)


def comment(ctx: Context):
    runtime = ctx.inject(Runtime)
    comment = ctx.inject(Comment)
    runtime.expose("comment", comment)


class Comment:
    _runtime: Runtime

    def __init__(self, ctx: Context):
        self._runtime = ctx.inject(Runtime)
        ctx.inject(Mecha).serialize.extend(serialise_comment)

    def __call__(self, comment: str = ""):
        self._runtime.commands.append(AstExplicitComment(comment=comment))
