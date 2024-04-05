using Test
using XYModelwithYao
using XYModelwithYao.Graphs

@testset "optimize_momentum" begin
    g = ScatterGraph(SimpleGraph(Edge.([(1,5), (2,7), (3, 8), (4, 10), (5,6), (5,8), (6,7), (7,10), (8,9), (9, 10)])), [1, 2], [3, 4])
    x, min = optimize_momentum(g)
    @test isapprox(min, 0.0, atol=1e-20)
    @test isapprox(x[1], 0.25, atol=1e-20)
end

@testset "optimize_momentum" begin  
    g = ScatterGraph(SimpleGraph(7, 16), [1, 2], [3, 4])
    x, min = optimize_momentum(g)
    @show x,min
end

@testset "optimize_momentum" begin
    for i in 5:15
        for j in i:(i*(i-1) ÷ 2)
            g = ScatterGraph(SimpleGraph(i, j), [1, 2], [3, 4])
            x, min = optimize_momentum(g)
            if min < 0.1
                @show i,j
                @show x,min
            end
        end
    end
end