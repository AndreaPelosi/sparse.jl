# Generate a random sparse matrix using Julia stdlib primitives

using SparseArrays

# generate a random sparse square matrix with dim rows and columns;
# each entry has (independent) p probability being nonzero
function sparse_square_matrix(dim::Integer, mat_type=Float64)
    p = 0.5;
    sprand(mat_type, dim, dim, p)
end 

# generate a random sparse square matrix with random dimensions;
# each entry has (independent) p probability being nonzero
function sparse_square_matrix(mat_type=Float64)
    dim = rand(10^3:10^4);
    p = 0.5;
    sprand(mat_type, dim, dim, p)
end

