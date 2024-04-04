using XYModelwithYao
using Test

@testset "abs2_loss" begin
    g = ScatterGraph(SimpleGraph(Edge.([(1,5), (2,7), (3, 8), (4, 10), (5,6), (5,8), (6,7), (7,10), (8,9), (9, 10)])), [1, 2], [3, 4])
    z = exp(-pi/4*im)
    abs2_loss(g, z)
end