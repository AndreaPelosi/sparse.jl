# BFS demo using cvdlab SuiteSparseGraphBLAS Julia wrapper
# (can be found at https://github.com/cvdlab/SuiteSparseGraphBLAS.jl)

#= 
    Since Julia does not allow to have two direct dependencies with the same name
    in a single project, in order to execute the following code, you have to go inside 
    the directory "sparse/examples/GraphBLAS_Julia_cvdlab/"; the corresponding environment 
    will be activated by the code below. Additionally, the necessary src files are 
    manually added below. Before executing the other demos, head back to the main
    project environment. Still, it is suggested to end the ongoing Julia session and 
    to execute the other demos in another Julia session.
    Suggested flow of execution:

    $ cd /sparse/examples/GraphBLAS_Julia_cvdlab
    $ julia

    julia>[paste the code below...]

    [end Julia session...]

    $ cd ../../
    $ julia

    julia> [paste the code from another demo...]
=#

# Activate "sparse/examples/GraphBLAS_Julia_cvdlab/" environment
using Pkg
Pkg.activate(".")

using SuiteSparseGraphBLAS, BenchmarkTools

# Manually add the necessary src files
include("../../src/GraphBLAS_sparse_square_matrix_cvd.jl")
include("../../src/GraphBLAS_bfs_cvd.jl")

nrows = 100
ncols = 100

A = from_type(Int64, nrows, ncols)

GraphBLAS_sparse_square_matrix_cvd!(A)

bench = @benchmark GraphBLAS_bfs_cvd(A, 1)

display(bench)