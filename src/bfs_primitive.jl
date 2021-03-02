# BFS algorithm using Julia stdlib primitives

using SparseArrays

"""
    bfs_primitive(A::SparseMatrixCSC{Bool, U}, source::U) where {U <: Integer}

Compute BFS on the graph represented by 'A' starting from 'source' using Julia primitives.

# Examples
```julia-repl
julia> dim = 100

julia> A = sparse_square_matrix(dim, Bool)

julia> source = 1

julia> bfs_primitive(A,source)
```
"""
function bfs_primitive(
    A::SparseMatrixCSC{Bool, U},
    source::U
    ) where {U <: Integer}

    source > 0 || throw(ArgumentError("source must be positive"))

    dim = size(A, 2)
    # Input matrix must be square
    size(A, 1) == dim || throw(DimensionMismatch())

    q = BitArray(undef, dim)
    q[source] = true

    # Create v, make it dense
    v = zeros(Int64, dim)
    v[source] = 1

    aux = similar(q)
    toupdate = spzeros(Bool, dim)

    @inbounds for level in 1:dim
     
        aux = broadcast(!iszero, A'*q)
        copy!(q, aux)

        # toupdate[i] = true iff vertex i is 
        # in the frontier and was not visited before
        @inbounds for i in eachindex(toupdate)
            toupdate[i] = iszero(v[i]) & aux[i]
        end

        v .+= toupdate .* (level+1)
        
        if(!reduce(max,q))
            break
        end
    end

    return v
end
