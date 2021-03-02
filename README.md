# sparse
*BFS* algorithm benchmarks and comparison between different *BFS* implementations (built with SparseArrays.jl and SuiteSparseGraphBLAS.jl). 

sparse.jl package was developed as part of the course [IN480 - Parallel and Distributed Computing](http://www.dia.uniroma3.it/~paoluzzi/web/did/calcoloparallelo/2021/), Roma Tre University.

You can download sparse.jl typing `julia` command inside a terminal and, once inside the Julia REPL, typing the following instructions:

```
julia> using Pkg

julia> Pkg.add("https://github.com/AndreaPelosi/sparse.jl")
```

To easily have access to sparse.jl files, just clone sparse.jl repository.

## Requirements
To build the graphs on which to execute *BFS,* you need `GraphBLASInterface.jl` and `SuiteSparseGraphBLAS.jl` Julia packages. 
To download them, type the following instructions inside the Julia REPL:

```
julia> using Pkg

julia> Pkg.add("SuiteSparseGraphBLAS"); Pkg.add("GraphBLASInterface")
```

## Usage 

You can write your own benchmarks using the functions that sparse.jl provides or you can execute one of the examples in the `examples/` directory by pasting inside the Julia REPL the code you wish to execute (the only exception is the file `sparse/examples/GraphBLAS_Julia_cvdlab/bfs_demo_cvd.jl`, read it carefully before executing).

## Test

To test the correctness of the algorithms implemented in sparse.jl, type the following instructions inside the Julia REPL:

```
julia> using Pkg

julia> Pkg.test("sparse")
```