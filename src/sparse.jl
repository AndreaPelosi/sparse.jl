module sparse


using GraphBLASInterface, SuiteSparseGraphBLAS

include("bfs_primitive.jl")
include("GraphBLAS_bfs.jl")
#include("GraphBLAS_bfs_cvd.jl")
include("GraphBLAS_sparse_square_matrix.jl")
#include("GraphBLAS_sparse_square_matrix_cvd.jl")
include("sparse_square_matrix.jl")

export bfs_primitive, sparse_square_matrix

export GraphBLAS_bfs!, GraphBLAS_sparse_square_matrix!
#export GraphBLAS_bfs_cvd, GraphBLAS_sparse_square_matrix_cvd!

end # module
