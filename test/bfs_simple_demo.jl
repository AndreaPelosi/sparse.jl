using GraphBLASInterface, SuiteSparseGraphBLAS

# Define the mode that GraphBLAS will use 
GrB_init(GrB_NONBLOCKING);

# Create test matrix A
A = GrB_Matrix{Int64}();
GrB_Matrix_new(A, GrB_INT64, 6, 6);
I = ZeroBasedIndex[0, 0, 0, 1, 1, 2, 2, 4, 4, 3];
J = ZeroBasedIndex[0, 1, 2, 2, 4, 0, 3, 3, 4, 5]; 
X = [1:10...];
m = 10;
GrB_Matrix_build(A, I, J, X, m, GrB_FIRST_INT64);

println("adiacency matrix of the test graph:");
@GxB_fprint(A, GxB_COMPLETE);

n = GrB_Matrix_nrows(A);

# Create and initialize GrB_Descriptor
desc_rc = GrB_Descriptor(GrB_OUTP => GrB_REPLACE, GrB_MASK => GrB_SCMP)

# Define the semiring that will be used
semiring = GxB_LOR_LAND_BOOL;

# Create an empty vector; make it dense
v = GrB_Vector{Int64}();
GrB_Vector_new(v, GrB_INT64, n);
GrB_Vector_assign(v, GrB_NULL, GrB_NULL, 0, GrB_ALL, n, GrB_NULL);
    
# Create a boolean vector; set q(0) = true
q = GrB_Vector{Bool}();
GrB_Vector_new(q, GrB_BOOL, n);
GrB_Vector_setElement(q, true, ZeroBasedIndex(0));

# BFS algorithm simple version
for  level = 1:n
    # v<q> = level 
    GrB_Vector_assign(v, q, GrB_NULL, level, GrB_ALL, n, GrB_NULL);
    
    if (GrB_Vector_nvals(q) == 0)
        break;
    end

    # q<!v> = q ||.&& A; updates the frontier
    GrB_vxm(q, v, GrB_NULL, GxB_LOR_LAND_BOOL, q, A, desc_rc);
end

println("BFS result:");
@GxB_fprint(v, GxB_COMPLETE);

# free workspace
GrB_Matrix_free(A);
GrB_Semiring_free(semiring);
GrB_Descriptor_free(desc_rc);
GrB_Vector_free(v);
GrB_Vector_free(q);

GrB_finalize();
