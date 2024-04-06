using Test
using XYModelwithYao
using XYModelwithYao.Graphs

@testset "optimize_momentum" begin
    g = ScatterGraph(SimpleGraph(Edge.([(1,5), (2,7), (3, 8), (4, 10), (5,6), (5,8), (6,7), (7,10), (8,9), (9, 10)])), [1, 2], [3, 4])
    x, min = optimize_momentum(g)
    @test isapprox(min, 0.0, atol=1e-20)
    @test isapprox(x[1], 0.25, atol=1e-20)
end

@testset "optimize_weighted_momentum" begin
    g = ScatterGraph(SimpleGraph(Edge.([(1,5), (2,7), (3, 8), (4, 10), (5,6), (5,8), (6,7), (7,10), (8,9), (9, 10)])), [1, 2], [3, 4])
    x, min = optimize_weighted_momentum(g)
    @show x,min
    @test isapprox(min, 0.0, atol=1e-6)
end

@testset "optimize_weighted_momentum wuzi" begin
    g = ScatterGraph(SimpleGraph(Edge.([(1,5), (5,7), (3, 5), (4, 9), (5,3), (4,8), (6,7), (7,9), (2,9)])), [1, 2], [3, 4])
    x, min = optimize_weighted_momentum(g)
    @show x,min
end