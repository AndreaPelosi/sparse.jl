# BFS demo using Julia stdlib primitives

using Pkg
Pkg.activate(".")

using BenchmarkTools
include("../../src/bfs_primitive.jl")
include("../../src/sparse_square_matrix.jl")

dim = 100;

A = sparse_square_matrix(dim, Bool)

bench = @benchmark bfs_primitive(A,1);
display(bench)

#v = bfs_primitive(A,1);
#println(v);