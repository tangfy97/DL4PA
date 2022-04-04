def edges(): #{Edge(Int32, Int32), Path(Int32, Int32)} = #{
    Edge(1, 2). Edge(2, 3). Edge(3, 4).
}

def closure(): #{Edge(Int32, Int32), Path(Int32, Int32)} = #{
    Path(x, y) :- Edge(x, y).
    Path(x, z) :- Path(x, y), Edge(y, z).
}

def main(): #{Edge(Int32, Int32), Path(Int32, Int32)} = solve edges() <+> closure()
