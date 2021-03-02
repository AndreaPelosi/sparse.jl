
using Pkg
Pkg.activate("./GraphBLASJulia/")

include("../../src/GraphBLAS_bfs.jl")
include("../../src/GraphBLAS_sparse_square_matrix.jl")




@testset "GraphBLASJulia" begin
    
### algorithm correctness test
    GrB_init(GrB_NONBLOCKING);

    dim = 6;
    
    A = GrB_Matrix(Int64, dim, dim)
    GrB_Matrix_setElement(A, 1, ZeroBasedIndex(1), ZeroBasedIndex(0))
    GrB_Matrix_setElement(A, 2, ZeroBasedIndex(3), ZeroBasedIndex(1))
    GrB_Matrix_setElement(A, 3, ZeroBasedIndex(0), ZeroBasedIndex(2))
    GrB_Matrix_setElement(A, 4, ZeroBasedIndex(3), ZeroBasedIndex(2))
    GrB_Matrix_setElement(A, 5, ZeroBasedIndex(2), ZeroBasedIndex(3))
    GrB_Matrix_setElement(A, 6, ZeroBasedIndex(3), ZeroBasedIndex(4))

    v = GrB_Vector(Int64, dim)

    @test GraphBLAS_bfs!(A, v, ZeroBasedIndex(0)) == (GrB_SUCCESS)

    SuiteSparseGraphBLAS.dropzeros!(v);

    sol = GrB_Vector(Int64, dim)
    GrB_Vector_setElement(sol, 1, ZeroBasedIndex(0))
    GrB_Vector_setElement(sol, 4, ZeroBasedIndex(1))
    GrB_Vector_setElement(sol, 2, ZeroBasedIndex(2))
    GrB_Vector_setElement(sol, 3, ZeroBasedIndex(3))
    GrB_Vector_setElement(sol, 4, ZeroBasedIndex(4))
    GrB_wait()

    @test v == sol


### exception throw tests

    # Input matrix and vector have different dimensions
    w = GrB_Vector(Int64, dim+1)
    @test_throws DimensionMismatch GraphBLAS_bfs!(A, w, ZeroBasedIndex(0))

    # Input matrix is not square
    B = GrB_Matrix(Int64, dim, dim+1)
    @test_throws DimensionMismatch GraphBLAS_bfs!(B, v, ZeroBasedIndex(0))

    # Input vector elements' type U is not an Integer subtype
    z = GrB_Vector(Float64, dim)
    @test_throws MethodError GraphBLAS_bfs!(A, z, ZeroBasedIndex(0))

    # Input matrix is not a GrB_Matrix{T}
    @test_throws MethodError GraphBLAS_bfs!(v, v, ZeroBasedIndex(0))

    # Input vector is not a GrB_Vector{U}
    @test_throws MethodError GraphBLAS_bfs!(A, A, ZeroBasedIndex(0))

    # source is not a ZeroBasedIndex
    @test_throws MethodError GraphBLAS_bfs!(A, v, 0)

    GrB_Matrix_free(A)
    GrB_Matrix_free(B)

    GrB_Vector_free(v)
    GrB_Vector_free(sol)
    GrB_Vector_free(w)
    GrB_Vector_free(z)

    GrB_finalize()

end
