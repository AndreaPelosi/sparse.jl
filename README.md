# sparse
*BFS* algorithm benchmarks and comparison between different *BFS* implementations (built with SparseArrays.jl and SuiteSparseGraphBLAS.jl). 

sparse.jl package was developed as part of the course [IN480 - Parallel and Distributed Computing](http://www.dia.uniroma3.it/~paoluzzi/web/did/calcoloparallelo/2021/), Roma Tre University.

## Requirements

In order to build the graphs on which to test *BFS,* you need `GraphBLASInterface.jl` and `SuiteSparseGraphBLAS.jl` Julia packages. 
You can download them typing `julia` command inside a terminal and, once inside the Julia REPL, typing the following instructions:

```
julia> using Pkg

julia> Pkg.add("SuiteSparseGraphBLAS"); Pkg.add("GraphBLASInterface")
```


