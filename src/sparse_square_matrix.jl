# Generate a random sparse matrix using Julia stdlib primitives

using SparseArrays

# generate a random sparse square matrix with dim rows and columns;
# each entry has (independent) p probability being nonzero
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

# generate a random sparse square matrix with random dimensions;
# each entry has (independent) p probability being nonzero
function sparse_square_matrix(mat_type=Float64)
    dim = rand(10^3:10^4);
    p = 0.2;
    sprand(mat_type, dim, dim, p)
end

