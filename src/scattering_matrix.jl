function perm_adjacency(g::ScatterGraph, )
    W=adjacency_matrix(g.graph)
    perm=[g.input_vertex..., g.output_vertex..., setdiff(1:size(W,1), vcat(g.input_vertex, g.output_vertex))...]
    return W[perm, perm]
end