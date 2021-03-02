# BFS demo using Julia stdlib primitives

using sparse, BenchmarkTools

dim = 100

A = sparse_square_matrix(dim, Bool)

bench = @benchmark bfs_primitive(A,1)
display(bench)
