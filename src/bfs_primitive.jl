# BFS algorithm using Julia stdlib primitives

# TODO add a function that, given A sparse matrix of type T,
# outputs the matrix BoolA where every nonzero A element 
# corresponds to true in BoolA
using SparseArrays

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
     
        #@inbounds for i in 1:dim
            # update the frontier
         #   aux[i] = reduce(max, q .& @view(A[:,i]));
        #end
        #aux .= reduce(max, q .& @view(A[:,i]));

        #@inbounds for i in 1:dim
        #    acc = 0;
        #    for j in eachindex(@view(A[:,i]))
        #        acc += (q[j] & A[j,i]);
        #    end
        #    aux[i] = !iszero(acc);
        #end

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
