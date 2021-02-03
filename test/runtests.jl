using Test


const testdir = dirname(@__FILE__)

tests = [
    #"GraphBLASJulia",
    "GraphBLASJuliaCvdlab",
    "PrimitiveJulia"    
]

@testset "BFS" begin 
    for t in tests
        testpath = joinpath(testdir, "$(t)/$(t).jl")
        println(testpath)
        include(testpath)
    end
end
