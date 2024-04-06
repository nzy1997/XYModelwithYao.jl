using XYModelwithYao
using Test
using XYModelwithYao.Graphs
using XYModelwithYao.SimpleWeightedGraphs

@testset "abs2_loss" begin
    g = ScatterGraph(SimpleGraph(Edge.([(1,5), (2,7), (3, 8), (4, 10), (5,6), (5,8), (6,7), (7,10), (8,9), (9, 10)])), [1, 2], [3, 4])
    z = exp(-pi/4*im)
    @test isapprox(abs2_loss(g, z),0.0, atol=1e-20)
end

@testset "perm_adjacency" begin
    g = ScatterGraph(SimpleGraph(Edge.([(1,5), (2,7), (3, 8), (4, 10), (5,6), (5,8), (6,7), (7,10), (8,9), (9, 10)])), [1, 5], [6, 4])
    @test perm_adjacency(g)[1,2] == 1
    @test perm_adjacency(g)[3,7] == 1
end

@testset "scatter_matrix" begin
    g = ScatterGraph(SimpleGraph(Edge.([(1,5), (2,7), (3, 8), (4, 10), (5,6), (5,8), (6,7), (7,10), (8,9), (9, 10)])), [1, 2], [3, 4])
    s=scatter_matrix(g, -1/4)
    @test isapprox(s[1:2,1:2], zeros(2,2), atol=1e-10)
    @test isapprox(s[3:4,3:4], zeros(2,2), atol=1e-10)
    U=-1/sqrt(2)*[im 1; 1 im]
    @test isapprox(s[1:2,3:4], U, atol=1e-10)
    @test isapprox(s[3:4,1:2], transpose(U), atol=1e-10)
end