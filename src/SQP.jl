module SQP

using LinearAlgebra
using SparseArrays
using Printf
using Logging

using JuMP
import MathOptInterface

const MOI = MathOptInterface
const MOIU = MathOptInterface.Utilities

#? Function type in model.jl

#? T, Tv vector, Tm matrix, TD vector

include("status.jl") #Dict for output flag 
include("parameters.jl") #type/struct param set and get field 
include("model.jl") #struct model, optimize!(), add_statistic() 

include("algorithms.jl") #Algorithms 
include("utils.jl") #dropzeros, print_vector, print_matrix 

include("MOI_wrapper.jl") #? what are these 

end # module
