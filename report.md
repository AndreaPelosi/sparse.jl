# *SPARSE* Project Report 

## Andrea Pelosi, University of Roma TRE


In this document we present *SPARSE*, a Julia package developed as part of the course [IN480 - Parallel and Distributed Computing](http://www.dia.uniroma3.it/~paoluzzi/web/did/calcoloparallelo/2021/). 
In *SPARSE*, we port and benchmark a graph algorithm built upon GraphBLAS, a mathematical abstraction to represent and operate with graphs using just a narrow set of linear algebra primitives.

*SPARSE* source code can be found at [*sparse.jl*](https://github.com/AndreaPelosi/sparse.jl).

## Preliminaries 

### Why GraphBLAS?
Contemporary computer architectures are good at processing linear and hierarchical data structures, such as lists, stack or trees. They do not behave equally well with graphs. Graph algorithms are indeed challenging to program: issues such as poor locality, frequent cache misses and difficulty of parallelization demolish graph algorithms performance, and unfortunately optimizations reduce portability. 
In order to address these problems, a group of graph algorithms researchers came up with GraphBLAS.

GraphBLAS aims to set standard building blocks for graph representation and computation in the language of linear algebra.
Graph algorithms were already expressed in terms of operations on sparse matrices (matrices with a few elements not equal to $0$) but GraphBLAS takes a step further trying to standardize the approach. Amongst the benefits GraphBLAS could bring, we point out algorithms' efficiency, portability, compactness, composability and flexibility.

To appreciate these advantages, we first describe the mathematics upon which GraphBLAS is built.


### Theoretical foundations

### Most common operations overview

### GraphBLAS objects

### SuiteSparse:GraphBLAS and SuiteSparse:GraphBLAS.jl


## Algorithm description
