"""
    AbstractOptimizer

Abstract type of solvers
"""
abstract type AbstractOptimizer end

"""
    run!
    
Abstract function of running algorithm
"""
function run! end


include("algorithms/common.jl") #KKT residual, complementary slackness, primal feasibility 
include("algorithms/merit.jl") #merit function (multi version)
include("algorithms/subproblem.jl") #qpdata, qpjump, qpmodel(MOI), solve, linear_feas, FR, etc
include("algorithms/sqp.jl")
