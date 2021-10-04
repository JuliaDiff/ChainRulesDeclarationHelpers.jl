var documenterSearchIndex = {"docs":
[{"location":"api.html#API-Documentation","page":"API","title":"API Documentation","text":"","category":"section"},{"location":"api.html","page":"API","title":"API","text":"Modules = [ChainRulesDeclarationHelpers]\nPrivate = false","category":"page"},{"location":"index.html#ChainRules-Declaration-Helpers","page":"Introduction","title":"ChainRules Declaration Helpers","text":"","category":"section"},{"location":"index.html","page":"Introduction","title":"Introduction","text":"The ChainRulesDeclarationHelpers package provides a suite of functionality for defining ChainRulesCore.jl rules.","category":"page"},{"location":"index.html","page":"Introduction","title":"Introduction","text":"It is a fair bit more experimental than ChainRulesCore, and also a bit more heavy-weight to load as it uses some packages to help write macros. If you care about staying ultra-light weight stick to just using ChainRulesCore directly. If you want to be sure to not need to deal with breaking changes, stick to just using ChainRulesCore directly. If you want to get rid of some boiler-plate, and don't mind giving up either of those things, you have come to the right place.","category":"page"},{"location":"index.html","page":"Introduction","title":"Introduction","text":"ChainRulesCore does define some helper macros of it's own, like @nondifferentiable and @scalar_rule. They are fairly limited, though useful. As anyone who has ever looked on the inside of them they are pretty complex, this is because they need to process fairly complicated ASTs, but due to ChainRulesCore's ultra-lightweight policy, they can't add any dependencies on packages that would make that easier.","category":"page"}]
}
