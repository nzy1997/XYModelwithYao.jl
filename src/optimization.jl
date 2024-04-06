function train_loss(graph::ScatterGraph)
	return x -> abs2_loss(graph, exp(pi * im * x[1]))
end

function train_weighted_loss(graph::ScatterGraph)
    return x -> abs2_loss(graph, exp(pi * im * x[1]),x[2:end])
end

function gra!(G, x)
    G[1]=gradient(Reverse, train_loss, x)
end

function optimize_momentum(g::ScatterGraph)
    # a=optimize(train_loss, gra!, [0.0], LBFGS())
    a = optimize(train_loss(g), [0.0])  
    return a.minimizer,a.minimum
end

function optimize_weighted_momentum(g::ScatterGraph)
    # a=optimize(train_loss, gra!, [0.0], LBFGS())
    a = optimize(train_weighted_loss(g), ones(Float64, length(edges(g.graph))+1))  
    return a.minimizer,a.minimum
end