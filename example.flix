def edges(): #{Edge(Int, Int), Path(Int, Int)} = #{
    Edge(1, 2). Edge(2, 3). Edge(3, 4).
}

def closure(): #{Edge(Int, Int), Path(Int, Int)} = #{
    Path(x, y) :- Edge(x, y).
    Path(x, z) :- Path(x, y), Edge(y, z).
}

def main(): #{Edge(Int, Int), Path(Int, Int)} = solve edges() <+> closure()