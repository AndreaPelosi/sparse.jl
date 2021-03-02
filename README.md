# sparse
*BFS* algorithm benchmarks and comparison between different *BFS* implementations (built with SparseArrays.jl and SuiteSparseGraphBLAS.jl). 

sparse.jl package was developed as part of the course [IN480 - Parallel and Distributed Computing](http://www.dia.uniroma3.it/~paoluzzi/web/did/calcoloparallelo/2021/), Roma Tre University.

You can download sparse.jl typing `julia` command inside a terminal and, once inside the Julia REPL, typing the following instructions:

```
julia> using Pkg

julia> Pkg.add("https://github.com/AndreaPelosi/sparse.jl")
```

## Requirements
To build the graphs on which to execute *BFS,* you need `GraphBLASInterface.jl` and `SuiteSparseGraphBLAS.jl` Julia packages. 
You can download them typing `julia` command inside a terminal and, once inside the Julia REPL, typing the following instructions:

```
julia> using Pkg

julia> Pkg.add("SuiteSparseGraphBLAS"); Pkg.add("GraphBLASInterface")
```

## Usage 



## Test

To test the correctness of the algorithms implemented in sparse.jl, just type `julia` command inside a terminal and, once inside the Julia REPL, type the following instructions:

```
julia> using Pkg

julia> Pkg.test("sparse")
```