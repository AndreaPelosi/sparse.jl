# BFS simple demo

# TODO handle for GraphBLAS errors 
include("../src/GraphBLAS_sparse_square_matrix.jl")
include("../src/GraphBLAS_bfs_simple.jl")
using GraphBLASInterface, SuiteSparseGraphBLAS

GrB_init(GrB_NONBLOCKING);

# GraphBLAS matrix and vector dimensions 
dim = 100;

# Build a random sparse GraphBLAS matrix  
A = GrB_Matrix(Int64, dim, dim);
GraphBLAS_sparse_square_matrix(A, dim);

@GxB_fprint(A, GxB_COMPLETE)

# Create an empty GraphBLAS integer vector
v = GrB_Vector(Int64, dim);

GraphBLAS_bfs_simple!(A, v, ZeroBasedIndex(0));

println("BFS result:");
@GxB_fprint(v, GxB_COMPLETE);


# free workspace
GrB_Matrix_free(A);
GrB_Vector_free(v);

GrB_finalize();
