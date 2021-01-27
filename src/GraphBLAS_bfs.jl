# BFS simple algorithm using abhinavmehndiratta SuiteSparseGraphBLAS Julia wrapper
# (can be found at https://github.com/abhinavmehndiratta/SuiteSparseGraphBLAS.jl)

# TODO handle for GraphBLAS errors 
using SuiteSparseGraphBLAS, GraphBLASInterface

function GraphBLAS_bfs!(
    A::GrB_Matrix{T}, 
    v::GrB_Vector{U}, 
    source::ZeroBasedIndex
    ) where {T, U<:Int64}
 
    n = GrB_Matrix_ncols(A)

    GrB_Matrix_nrows(A) == n || throw(DimensionMismatch("Input matrix must be square"))
    GrB_Vector_size(v) == n || throw(DimensionMismatch("Input matrix and vector dimension mismatch"))

    # Create and initialize GrB_Descriptor
    desc_rc = GrB_Descriptor(GrB_OUTP => GrB_REPLACE, GrB_MASK => GrB_SCMP)

    # Define the semiring that will be used
    semiring = GxB_LOR_LAND_BOOL

    # Make input vector dense
    GrB_Vector_assign(v, GrB_NULL, GrB_NULL, 0, GrB_ALL, n, GrB_NULL)

    # Create a boolean vector; set q(source) = true
    q = GrB_Vector{Bool}()
    GrB_Vector_new(q, GrB_BOOL, n)

    GrB_Vector_setElement(q, true, source)

    # BFS algorithm
    for  level = 1:n
        # v<q> = level 
        GrB_Vector_assign(v, q, GrB_NULL, level, GrB_ALL, n, GrB_NULL)
        
        if (GrB_Vector_nvals(q) == 0)
            break
        end

        # q<!v> = q ||.&& A; updates the frontier
        GrB_vxm(q, v, GrB_NULL, GxB_LOR_LAND_BOOL, q, A, desc_rc)
    end

    # free workspace
    GrB_Semiring_free(semiring)
    GrB_Descriptor_free(desc_rc)
    GrB_Vector_free(q)
    
    # Force pending operations to complete and return
    GrB_wait()
    
    return (GrB_SUCCESS)
end
