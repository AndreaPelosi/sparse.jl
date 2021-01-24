# BFS algorithm using Julia stdlib primitives

# TODO add a function that, given A sparse matrix of type T,
# outputs the matrix BoolA where every nonzero A element 
# corresponds to true in BoolA
using SparseArrays

function bfs_primitive(
    A::SparseMatrixCSC{Bool, U},
    source::U
    ) where {T, U <: Integer}

    dim = size(A, 2);
    q = spzeros(Bool, dim);
    q[source] = true;

    # Create v, make it dense
    v = zeros(Int64,dim);
    v[source] = 1;

    aux = spzeros(Bool, dim);
    visited = spzeros(Bool, dim);
    toupdate = spzeros(Bool, dim);
    r = spzeros(Int64, dim);
    @inbounds for level in 1:dim
     
        @inbounds for i in 1:dim
            # update the frontier
            aux[i] = reduce(max, q .& @view(A[:,i]));
        end
        
        q = copy(aux);

        # toupdate[i] = true iff vertex i is 
        # in the frontier and was not visited before
        @inbounds for i in eachindex(toupdate)
            toupdate[i] = iszero(v[i]) & aux[i];
        end        

        #r .= toupdate .* (level+1);
        v .+= toupdate .* (level+1);
        
        if(!reduce(max,q))
            break;
        end
    end

    return v
end


#A = spzeros(Bool, 5, 5)
#A[2,1] = true
#A[1,3] = true
#A[4,3] = true
#A[3,4] = true
#A[4,5] = true
#A[4,2] = true

#v = bfs_primitive(A,1)

#println(v)