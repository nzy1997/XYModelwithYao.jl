struct ScatterGraph
	graph::SimpleGraph
	input_vertex::Vector{Int}
	output_vertex::Vector{Int}
	# weight::Vector{Float64}
end
# ScatterGraph(graph::SimpleGraph, input_vertex::Vector{Int}, output_vertex::Vector{Int}) = ScatterGraph(graph, input_vertex, output_vertex, ones(Float64, length(edges(graph))))
function abs2_loss(g::ScatterGraph, z::ComplexF64, W::AbstractMatrix)
	nv = size(W, 1)
	R = zeros(ComplexF64, nv, nv)
	for i in vcat(g.input_vertex, g.output_vertex)
		R[i, i] = 1
	end
	A = I - W * z + z^2 * (I - R)
	q, r = qr(A)
	loss = 0
	for k in 1:length(g.input_vertex)
		b = zeros(ComplexF64, nv)
		b[g.input_vertex[k]] = 1 - z^2
		x = UpperTriangular(r) \ (q' * b)
		loss += sum(abs2.(x[g.input_vertex]))
		loss -= abs2(x[g.input_vertex[k]])
		loss += abs2(x[g.input_vertex[k]] - 1)
	end
	return loss
end

function abs2_loss(g::ScatterGraph, z::ComplexF64)
	W = adjacency_matrix(g.graph)
	return abs2_loss(g, z, W)
end

function abs2_loss(g::ScatterGraph, z::ComplexF64, weights::AbstractVector)
	edge = collect(edges(g.graph))
    W = Float64.(adjacency_matrix(g.graph)) # need to be modified
	for i in 1:length(weights)
		W[edge[i].src, edge[i].dst] *= weights[i]
		W[edge[i].dst, edge[i].src] *= weights[i]
	end
    return abs2_loss(g, z, W)
end

function perm_adjacency(g::ScatterGraph)
	W = adjacency_matrix(g.graph)
	perm = [g.input_vertex..., g.output_vertex..., setdiff(1:size(W, 1), vcat(g.input_vertex, g.output_vertex))...]
	return W[perm, perm]
end

function scatter_matrix(g::ScatterGraph, k::Real)
	W = Matrix(perm_adjacency(g))
	N = length(g.input_vertex) + length(g.output_vertex)
	A = W[1:N, 1:N]
	B = W[(N+1):end, 1:N]
	D = W[(N+1):end, (N+1):end]
	z = exp(pi * im * k)
	Qz = I - z * (A + B' * inv(I * (1 / z + z) - D) * B)
	Qzinv = I - (A + B' * inv(I * (1 / z + z) - D) * B) / z
	return -inv(Qz) * Qzinv
end
