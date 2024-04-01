# required interfaces: nsite
abstract type AbstractModel end
struct XYModel <: AbstractModel
    Jxy::Float64
    h::Float64
    n::Int
end
nsite(m::XYModel) = m.n

function fermionic_quadratic(model::XYModel)
    n = nsite(model)
    Jxy, h = model.Jxy, model.h
    A=zeros(n, n)
    A[2:(n+1):end] .= -Jxy/2
    A[(n+1):(n+1):end] .= -Jxy/2
    A[1:(n+1):end] .= h
    return A
end