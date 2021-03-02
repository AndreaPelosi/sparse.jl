# BFS demo using abhinavmehndiratta SuiteSparseGraphBLAS Julia wrapper
# (can be found at https://github.com/abhinavmehndiratta/SuiteSparseGraphBLAS.jl)

using sparse, GraphBLASInterface, SuiteSparseGraphBLAS, BenchmarkTools

# Begin GraphBLAS session
GrB_init(GrB_NONBLOCKING)

# GraphBLAS matrix and vector dimensions 
dim = 100

# Build a random sparse GraphBLAS matrix  
A = GrB_Matrix(Int64, dim, dim)
GraphBLAS_sparse_square_matrix!(A, dim)


# Create an empty GraphBLAS integer vector
v = GrB_Vector(Int64, dim)

bench = @benchmark GraphBLAS_bfs!(A, v, ZeroBasedIndex(0))

dropzeros!(v)
GrB_wait()

# Free workspace
GrB_Matrix_free(A)
GrB_Vector_free(v)

# End GraphBLAS session
GrB_finalize()

display(bench)

