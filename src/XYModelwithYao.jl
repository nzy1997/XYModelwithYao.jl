module XYModelwithYao
using Yao
using LinearAlgebra
using Graphs
using Makie
using CairoMakie
using Makie.Colors

# dynamic
export sim_model
# twolevel
export twolevel_sim_model
# plot_functions
export plot_static_line, plot_line_model, plot_2line_model

# scatter_center
export ScatterGraph, abs2_loss, train_loss

include("models.jl")
include("dynamic.jl")
include("plot_functions.jl")
include("twolevel.jl")
include("scatter_center.jl")
end
