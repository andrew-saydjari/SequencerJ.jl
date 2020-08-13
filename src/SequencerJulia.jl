module SequencerJulia

using Reexport
@reexport using Distances
using SparseArrays
using LightGraphs
using SimpleWeightedGraphs
using Logging
using StatsBase: mean, ecdf, ECDF
using LinearAlgebra: issymmetric, Symmetric, I
import LightGraphs: bfs_parents, _bfs_parents

include("bfs.jl")
include("distancemetrics.jl")
include("sequencer.jl")

# functions
export emd, energy, cdf_distance, sequence

# types
export EMD, Energy

export L2, WASS1D, KLD, ENERGY, ALL_METRICS

export elong_start_index, elongation

end
