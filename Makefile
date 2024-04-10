JL = julia

init-%:
	$(JL) --project="lib/$*" -e 'using Pkg; @assert isdir("lib/$*"); Pkg.develop([Pkg.PackageSpec(path = joinpath("lib", "$*"))]); Pkg.precompile()'

update-%:
	$(JL) --project="lib/$*" -e 'using Pkg; @assert isdir("lib/$*"); Pkg.update(); Pkg.precompile()'

test-%:
	$(JL) --project="lib/$*" -e 'using Pkg; @assert isdir("lib/$*"); Pkg.test()'

.PHONY: init-% update-% test-%
