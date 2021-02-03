
include("../../src/bfs_primitive.jl")
include("../../src/sparse_square_matrix.jl")

@testset "PrimitiveJulia" begin

### algorithm correctness test

    A = spzeros(Bool, 5, 5)
    A[2,1] = true
    A[1,3] = true
    A[4,3] = true
    A[3,4] = true
    A[4,5] = true
    A[4,2] = true

    sol = [1, 4, 2, 3, 4]
    @test bfs_primitive(A, 1) == sol

### exception throw tests

    # Input matrix is not square
    B = spzeros(Bool, 5, 6)
    @test_throws DimensionMismatch bfs_primitive(B, 1)

    # source is a not a positive Integer
    @test_throws ArgumentError bfs_primitive(A, -1)

    # source is not an Integer subtype
    @test_throws MethodError bfs_primitive(A, 1.2)

    # Input matrix is not a SparseMatrixCSC{Bool, U}
    C = spzeros(5, 5)
    @test_throws MethodError bfs_primitive(C, 1)


end