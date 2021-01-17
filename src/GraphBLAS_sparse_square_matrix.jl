# Generate a random sparse matrix using GraphBLAS primitives

# TODO add checks for non-empty input Matrices
# TODO add checks for GraphBLAS operations' success 
using GraphBLASInterface, SuiteSparseGraphBLAS

function GraphBLAS_sparse_square_matrix(
    A::GrB_Matrix, 
    dim::Int)

    # Build A with at most sqrt(N) elements, N being the number of nonzero matrix elements
    ntuples = dim;

    for k in 1:ntuples

        i = ZeroBasedIndex(rand(0:dim-1));
        j = ZeroBasedIndex(rand(0:dim-1));
        x = rand(Int64);

        GrB_Matrix_setElement(A, x, i, j);
    end

    # Force pending operations to complete and return
    GrB_wait();
    return (GrB_SUCCESS)
end
