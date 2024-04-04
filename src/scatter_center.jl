struct ScatterGraph
    graph::SimpleGraph{Int}
    input_vertex::Vector{Int}
    output_vertex::Vector{Int}
end

function abs2_loss(g::ScatterGraph, z::ComplexF64)
    W=adjacency_matrix(g.graph)
    R = zeros(ComplexF64, g.graph.ne, g.graph.ne)
    for i in vcat(g.input_vertex, g.output_vertex)
        R[i, i] = 1
    end
    A = I - W * z + z^2 * (I - R)
    q, r = qr(A)
    loss = 0
    for k in 1:length(g.input_vertex)
        b = zeros(ComplexF64, g.graph.ne)
        b[g.input_vertex[k]] = 1 - z^2
        x = UpperTriangular(r) \ (q' * b)
        loss += sum(abs2.(x[g.input_vertex]))
        loss -= abs2(x[g.input_vertex[k]])
        loss += abs2(x[g.input_vertex[k]] - 1)
    end
    return loss
end

function train_loss(graph::ScatterGraph)
    return x->abs2_loss(graph, exp(pi*im*x[1]))
end

