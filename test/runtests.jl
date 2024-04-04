using XYModelwithYao
using Test

@testset "dynamic" begin
    include("dynamic.jl")
end

@testset "scatter_center" begin
    include("scatter_center.jl")
end