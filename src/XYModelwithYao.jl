module XYModelwithYao
# XY-model dynamic
using Yao
using LinearAlgebra
using Makie
using CairoMakie
using Makie.Colors

# scatter_center
using Graphs
using SimpleWeightedGraphs
using Enzyme
using Optim

# dynamic
export sim_model
# twolevel
export twolevel_sim_model
# plot_functions
export plot_static_line, plot_line_model, plot_2line_model

# scatter_center
export ScatterGraph, abs2_loss, perm_adjacency, scatter_matrix

# optimization
export train_loss, optimize_momentum, optimize_weighted_momentum

include("models.jl")
include("dynamic.jl")
include("plot_functions.jl")
include("twolevel.jl")

include("scattering_center.jl")
include("optimization.jl")
end
