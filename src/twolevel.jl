function twolevel_evolution(ω::Real,ω0::Real, tau::Real, g::Real,ttotal::Real,psi::Vector{Float64})
    X = [0 1; 1 0]
    Z = [1 0; 0 -1]
    return hcat([exp(im*tau*i*(Z)/2)*exp(-im*((ω0+ω)*(Z)/2+g*(X))*tau*i)*psi for i in 0:round(Int,ttotal/tau)]...)
end


function twolevel_sim_model(;
    n=10,
    k=3,
    Ω = 0.5,
    Jxy = 1.0,
    h = 1.0,
    time_step=0.1,
    time_stop=10.0,
)
    model = XYModel(Jxy, h, n)

    A = fermionic_quadratic(model)
    vals,vectors = eigen(A)
    
    ω = -vals[k]
    g = Ω/4 * vectors[1,k]

    psi = [1.0; 0.0]
    psis =[abs.(twolevel_evolution(ω,vals[k], time_step,g,time_stop, psi)[2,:]).^2 for k in 1:n]

    return hcat(psis...)
end

