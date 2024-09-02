using ReadDBC
using Documenter

DocMeta.setdocmeta!(ReadDBC, :DocTestSetup, :(using ReadDBC); recursive=true)

makedocs(;
    modules=[ReadDBC],
    authors="Bright-yaw <amenubright@gmail.com> and contributors",
    sitename="ReadDBC.jl",
    format=Documenter.HTML(;
        canonical="https://lego-yaw.github.io/ReadDBC.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/lego-yaw/ReadDBC.jl",
    devbranch="main",
)
