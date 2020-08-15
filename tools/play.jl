using SequencerJulia
using Images
using Random, LightGraphs

imgsmall = load(joinpath(@__DIR__,"..","resources","Aged Whisky.jpg"));
SMALL = convert(Matrix{Float32}, float32.(Gray.(imgsmall)))
# SMALL = float32.(Gray.(imgsmall))


I = shuffle(axes(SMALL,2))
imgshuffled = SMALL[:,I]
RGB.(imgshuffled)

res = sequence(imgshuffled; scales=(4), metrics=ALL_METRICS)
II = order(res)
res = SMALL[:,II]
Gray.(res)
