
using Pkg
Pkg.activate("./GraphBLASJuliaCvdlab/")

include("../../src/GraphBLAS_bfs_cvd.jl")
include("../../src/GraphBLAS_sparse_square_matrix_cvd.jl")


@testset "GraphBLASJuliaCvdlab" begin
    
### algorithm correctness test
    mat = [0 1 0 1 0 0 0; 0 0 0 0 1 0 1; 0 0 0 0 0 1 0; 1 0 1 0 0 0 0 ; 0 0 0 0 0 1 0; 0 0 1 0 0 0 0; 0 0 1 1 1 0 0]
    A = from_matrix(mat)
    
    sol = from_lists([1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 2, 3, 4, 3])

    @test GraphBLAS_bfs_cvd(A, 1) == sol
    

### exception throw tests

    # Input matrix is not square
    B = from_matrix([1 0 1 0 ; 0 0 1 0 ; 0 0 0 1 ; 1 0 0 0 ; 0 0 1 0])
    @test_throws DimensionMismatch GraphBLAS_bfs_cvd(B, 1)

    # source is a not a positive Integer
    @test_throws ArgumentError GraphBLAS_bfs_cvd(A, -1)

    # source is not an Integer
    @test_throws MethodError GraphBLAS_bfs_cvd(A, 1.2)

    # Input matrix is not a GBMatrix
    @test_throws MethodError GraphBLAS_bfs_cvd(mat, 1)

end