abstract type AbstractSubOptimizer end

"""
sense 0.5 x'Qx + c'x + μ (s1 + s2)
subject to
c_lb <= Ax + b + s1 - s2 + s <= c_ub    ----- constraint g
v_lb <= x + x_k <= v_ub                 ----- constraint box on x
-Δ <= x <= Δ                            ----- trust region
s1 + max(0,s) >= 0
s2 - min(0,s) >= 0
"""

#?s, s1, s2, for SQP support feature
#?what is optimization sense 

struct QpData{T,Tv<:AbstractArray{T},Tm<:AbstractMatrix{T}}
    sense::MOI.OptimizationSense 
    Q::Union{Nothing,Tm}
    c::Tv
    A::Tm
    b::Tv
    c_lb::Tv
    c_ub::Tv
    v_lb::Tv
    v_ub::Tv
    num_linear_constraints::Int
end

SubModel = Union{
    MOI.AbstractOptimizer,
    JuMP.AbstractModel,
} #? what for 

include("subproblem_MOI.jl") #QP model and solver, linear feas, feas restoration in MOI
include("subproblem_JuMP.jl") #QP model and solver, linear feas, feas restoration in JuMP 
