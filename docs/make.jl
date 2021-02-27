push!(LOAD_PATH,"../src/")

using Pkg
Pkg.activate("../")

using Documenter
using sparse

makedocs(
    sitename = "sparse",
    format = Documenter.HTML(),
    modules = [sparse]
)
