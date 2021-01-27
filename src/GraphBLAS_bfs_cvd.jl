# BFS algorithm using cvdlab SuiteSparseGraphBLAS Julia wrapper
# (can be found at https://github.com/cvdlab/SuiteSparseGraphBLAS.jl)
# The following function is very similar to the one at
# https://github.com/cvdlab/SuiteSparseGraphBLAS.jl/blob/master/examples/bfs.jl
# All credits go to the original author.
using SuiteSparseGraphBLAS

function GraphBLAS_bfs_cvd(
    A::GBMatrix,
    source::Int
    )

    source > 0 || throw(ArgumentError("source must be positive"))
    
    nrows = size(A,1)
    size(A, 2) == nrows || throw(DimensionMismatch("Input matrix must be square"))

    q = from_lists([source], [true], n = nrows)
    desc = descriptor(outp=>SuiteSparseGraphBLAS.replace, mask=>scmp)
    v = from_type(Int64, nrows)

    for i in 1:nrows-1
        @with q v[:] = i
        vxm(q, A, out = q, semiring = Semirings.LOR_LAND, mask = v, desc = desc)
        if !reduce(q, monoid = Monoids.LOR)
            break            
        end
    end

    return v
end