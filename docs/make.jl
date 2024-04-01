using XYModelwithYao
using Documenter

DocMeta.setdocmeta!(XYModelwithYao, :DocTestSetup, :(using XYModelwithYao); recursive=true)

makedocs(;
    modules=[XYModelwithYao],
    authors="nzy1997",
    sitename="XYModelwithYao.jl",
    format=Documenter.HTML(;
        canonical="https://nzy1997.github.io/XYModelwithYao.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/nzy1997/XYModelwithYao.jl",
    devbranch="main",
)
