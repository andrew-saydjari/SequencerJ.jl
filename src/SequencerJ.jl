module SequencerJ

using Reexport
@reexport using Distances
@reexport using Logging
using Printf: @sprintf
using SparseArrays: sparse, spzeros
using LightGraphs
using SimpleWeightedGraphs
using StatsBase: mean, ecdf, ECDF, sample
using LinearAlgebra: issymmetric, Symmetric, I


import LightGraphs: bfs_parents, _bfs_parents
import Base: show


include("bfs.jl")
include("utils.jl")
include("distancemetrics.jl")
include("sequencer.jl")

# functions
export emd, energy, cdf_distance, sequence, elongation, D, mst
export elong, stidx, order, rollup, prettyp, loss, i2weight, ensuregrid!

# types
export SequencerResult, EMD, Energy

# constants
export L2, WASS1D, KLD, ENERGY, ALL_METRICS

end