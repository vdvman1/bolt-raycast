from tokenstream import TokenStream
from tokenstream.error import UnexpectedToken
from tokenstream.location import set_location
from mecha import Mecha, delegate


def parse_node(mc: Mecha, text: str, node_type: str):
    stream = TokenStream(text)
    with mc.prepare_token_stream(stream), stream.provide(disable_interpolation=True):
        node = delegate(node_type, stream)
        token = stream.peek()
        if token and token.type != "eof":
            raise set_location(
                stream.emit_error(UnexpectedToken(token, ("eof",))), token
            )

    return node
