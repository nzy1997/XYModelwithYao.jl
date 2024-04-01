JL = julia

init:
	$(JL) -e 'using Pkg; dir="."; Pkg.activate(dir); Pkg.instantiate(); Pkg.precompile();'
	echo 'environment initialized'

example:
	echo 'running example at: examples/dosim.jl'
	$(JL) -e 'using Pkg; dir="."; Pkg.activate(dir); include("examples/dosim.jl");'