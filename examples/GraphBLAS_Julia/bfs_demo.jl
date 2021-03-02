# BFS demo using abhinavmehndiratta SuiteSparseGraphBLAS Julia wrapper
# (can be found at https://github.com/abhinavmehndiratta/SuiteSparseGraphBLAS.jl)

using Pkg
Pkg.activate(".")

using GraphBLASInterface, SuiteSparseGraphBLAS, BenchmarkTools
#include("../../src/GraphBLAS_sparse_square_matrix.jl")
#include("../../src/GraphBLAS_bfs.jl")


# Begin GraphBLAS session
GrB_init(GrB_NONBLOCKING);

# GraphBLAS matrix and vector dimensions 
dim = 100;

# Build a random sparse GraphBLAS matrix  
A = GrB_Matrix(Int64, dim, dim);
GraphBLAS_sparse_square_matrix!(A, dim);

#@GxB_fprint(A, GxB_COMPLETE);

# Create an empty GraphBLAS integer vector
v = GrB_Vector(Int64, dim);

bench = @benchmark GraphBLAS_bfs!(A, v, ZeroBasedIndex(0))

#println("BFS result:");
#@GxB_fprint(v, GxB_COMPLETE);

dropzeros!(v);
GrB_wait();

#println("BFS result dropping 0 elements:")
#@GxB_fprint(v, GxB_COMPLETE);


# Free workspace
GrB_Matrix_free(A);
GrB_Vector_free(v);

# End GraphBLAS session
GrB_finalize();

display(bench);    

