
#TODO check that A is a square matrix
using SuiteSparseGraphBLAS

function GraphBLAS_sparse_square_matrix_cvd!(A::GBMatrix{T}) where T


    nrows = size(A,1);
    ncols = size(A,2);

    # Build A with at most sqrt(N) elements, 
    # N being the number of nonzero matrix elements
    ntuples = isqrt(nrows*ncols);
    
    for k in 1:ntuples

        i = rand(1:nrows);
        j = rand(1:ncols);
        x = rand(T);

        A[i,j] = x;
        #SuiteSparseGraphBLAS.GrB_Matrix_setElement(A, x, i, j);
    end

end

