using Test
using SequencerJulia
using StatsBase
using Random
using LightGraphs
using Images

@testset "basic functions" begin
    
end

@testset "SequencerJulia.jl" begin
    # Write your tests here.
    imgsmall = load(joinpath(@__DIR__,"..","resources","colony.png"))
    SMALL = convert(Matrix{Float32}, float32.(Gray.(imgsmall)))

    imgmed = load(joinpath(@__DIR__,"..","resources","Aged Whisky.jpg"));
    MED = convert(Matrix{Float32}, float32.(Gray.(imgmed)))

    imgbig = load(joinpath(@__DIR__,"..","resources","Hummingbird!.jpeg"))
    BIG = convert(Matrix{Float32}, float32.(Gray.(imgbig)))

    include("algotests.jl")

    @testset "real image does not fail." begin
        @test sequence(SMALL; scales=[2]) !== nothing
    end

    @testset "small image does not fail." begin
        @test sequence(SMALL; scales=[2]) !== nothing
    end

    @testset "small image, multiple scales." begin
        @test sequence(SMALL; scales=[1,2,8]) !== nothing
    end

    @testset "large image does not fail." begin
        @test sequence(BIG; scales=[2], metrics=(KLD, WASS1D)) !== nothing
    end

    @testset "reorder small image" begin
        Idx = shuffle(axes(SMALL,2))
        imgshuff = SMALL[:,Idx]
        MSTD, ηD, BFSD = sequence(imgshuff; scales=(1), metrics=(KLD, WASS1D))
        res = SMALL[:, collect(vertices(BFSD))]
        @test SMALL == res
    end

    @testset "reorder med image" begin
        Idx = shuffle(axes(MED,2))
        imgshuff = MED[:,Idx]
        MSTD, ηD, BFSD = sequence(imgshuff; scales=(1,2), metrics=(KLD, WASS1D))
        res = MED[:, collect(vertices(BFSD))]
        @test MED == res
    end

    @testset "reorder large image" begin
        Idx = shuffle(axes(BIG,2))
        imgshuff = BIG[:,Idx]
        MSTD, ηD, BFSD = sequence(imgshuff; scales=(1,2,4), metrics=(KLD, WASS1D))
        res = BIG[:, collect(vertices(BFSD))]
        @test BIG == res
    end

end
