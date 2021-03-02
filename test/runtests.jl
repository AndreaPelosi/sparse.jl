using Test


const testdir = dirname(@__FILE__)

println("Type '1' if you want to test GraphBLASJulia, type any other character if you
    want to test GraphBLASJuliaCvdlab")

choice = readline()


if choice == "1"
    tests = [
        "GraphBLASJulia",
        "PrimitiveJulia"    
    ]
else
    tests = [
    "GraphBLASJuliaCvdlab",
    "PrimitiveJulia"    
    ]
end

println(tests)

@testset "BFS" begin 
    for t in tests
        testpath = joinpath(testdir, "$(t)/$(t).jl")
        println(testpath)
        include(testpath)
    end
end
