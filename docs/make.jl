using DBCDatasus
using Documenter

DocMeta.setdocmeta!(DBCDatasus, :DocTestSetup, :(using DBCDatasus); recursive=true)

makedocs(;
    modules=[DBCDatasus],
    authors="lego-yaw <yawyoung5@gmail.com> and contributors",
    sitename="DBCDatasus.jl",
    format=Documenter.HTML(;
        canonical="https://lego-yaw.github.io/DBCDatasus.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/lego-yaw/DBCDatasus.jl",
    devbranch="main",
)
