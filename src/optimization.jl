function gra!(G, x)
    G[1]=gradient(Reverse, train_loss, x)
end

function optimize_momentum(g::ScatterGraph)
    # a=optimize(train_loss, gra!, [0.0], LBFGS())
    a = optimize(train_loss(g), [0.0])  
    return a.minimizer,a.minimum
end
