module sparse


using GraphBLASInterface, SuiteSparseGraphBLAS

include("bfs_primitive.jl")
include("GraphBLAS_bfs.jl")
include("GraphBLAS_sparse_square_matrix.jl")
include("sparse_square_matrix.jl")

export bfs_primitive, sparse_square_matrix,
    GraphBLAS_bfs!, GraphBLAS_sparse_square_matrix!

end # module
