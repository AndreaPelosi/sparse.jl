# Generate a random sparse matrix using Julia stdlib primitives

using SparseArrays


"""
    sparse_square_matrix(dim::Integer, mat_type=Float64)

Build a random sparse square matrix of dimension 'dim'x'dim' using Julia primitives.

Each entry has (independent) p probability being nonzero.

#Examples 
```julia-repl
julia> dim = 100

julia> A = sparse_square_matrix(dim, Bool)
```
"""
function sparse_square_matrix(dim::Integer, mat_type=Float64)
    # Build matrix using SparseArrays primitive
    # p = 0.2;
    # sprand(mat_type, dim, dim, p)

    # Manually build matrix
    A = spzeros(mat_type, dim, dim);

    ntuples = dim;
    for k in 1:ntuples

        i = rand(1:dim);
        j = rand(1:dim);
        x = rand(mat_type);
        A[i,j] = x;
    end

    return A
end 


"""
    sparse_square_matrix(mat_type=Float64)

Build a random sparse square matrix with random dimensions using Julia primitives.

Each entry has (independent) p probability being nonzero.

#Examples 
```julia-repl

julia> A = sparse_square_matrix(Bool)
```
"""
function sparse_square_matrix(mat_type=Float64)
    dim = rand(10^3:10^4);
    p = 0.2;
    sprand(mat_type, dim, dim, p)
end

