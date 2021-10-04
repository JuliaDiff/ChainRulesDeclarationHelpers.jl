using ChainRulesDeclarationHelpers
using Documenter
using DocThemeIndigo
using Markdown

indigo = DocThemeIndigo.install(ChainRulesDeclarationHelpers)

makedocs(
    modules=[ChainRulesDeclarationHelpers],
    format=Documenter.HTML(
        prettyurls=false,
        assets=[indigo],
    ),
    sitename="ChainRules Declaration Helpers",
    authors="Lyndon White and other contributors",
    pages=[
        "Introduction" => "index.md",
        "API" => "api.md",
       ],
    strict=true,
    checkdocs=:exports,
)

deploydocs(
    devbranch="main",
    repo = "github.com/JuliaDiff/ChainRulesDeclarationHelpers.jl.git",
    push_preview=true,
)
