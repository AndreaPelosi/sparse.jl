# BFS demo using cvdlab SuiteSparseGraphBLAS Julia wrapper
# (can be found at https://github.com/cvdlab/SuiteSparseGraphBLAS.jl)
using Pkg
Pkg.activate(".")

using SuiteSparseGraphBLAS, BenchmarkTools

include("../../src/GraphBLAS_sparse_square_matrix_cvd.jl")
include("../../src/GraphBLAS_bfs_cvd.jl")

nrows = 1000000;
ncols = 1000000;

A = from_type(Int64, nrows, ncols);

GraphBLAS_sparse_square_matrix_cvd!(A);

bench = @benchmark GraphBLAS_bfs_cvd(A, 1);

display(bench);