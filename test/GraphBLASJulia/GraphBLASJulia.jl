
using Pkg
Pkg.activate("./GraphBLASJulia/")

include("../../src/GraphBLAS_bfs.jl")
include("../../src/GraphBLAS_sparse_square_matrix.jl")

# Add valid test forall valid types of GrB_Matrix

GrB_init(GrB_NONBLOCKING);


@testset "GraphBLASJulia" begin
    
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

    dropzeros!(v);

    sol = GrB_Vector(Int64, dim)
    GrB_Vector_setElement(sol, 1, ZeroBasedIndex(0))
    GrB_Vector_setElement(sol, 4, ZeroBasedIndex(1))
    GrB_Vector_setElement(sol, 2, ZeroBasedIndex(2))
    GrB_Vector_setElement(sol, 3, ZeroBasedIndex(3))
    GrB_Vector_setElement(sol, 4, ZeroBasedIndex(4))
    GrB_wait()

    @test v == sol

end
