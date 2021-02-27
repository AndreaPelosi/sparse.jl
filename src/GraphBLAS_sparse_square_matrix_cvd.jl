using SuiteSparseGraphBLAS

"""
    GraphBLAS_sparse_square_matrix_cvd!(A::GBMatrix{T}) where T

Build a random sparse square matrix using GraphBLAS CVD version.

#Examples 
```julia-repl
julia> nrows, ncols = 100, 100

julia> A = from_type(Int64, nrows, ncols)

julia> GraphBLAS_sparse_square_matrix_cvd!(A)
```
"""
function GraphBLAS_sparse_square_matrix_cvd!(A::GBMatrix{T}) where T


    nrows = size(A,1)
    ncols = size(A,2)

    # Build A with at most sqrt(N) elements, 
    # N being the number of nonzero matrix elements
    ntuples = isqrt(nrows*ncols)

    for k in 1:ntuples

        i = rand(1:nrows)
        j = rand(1:ncols)
        x = rand(T)

        A[i,j] = x
        #SuiteSparseGraphBLAS.GrB_Matrix_setElement(A, x, i, j)
    end

end

