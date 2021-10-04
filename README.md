<img src="https://rawcdn.githack.com/JuliaDiff/ChainRulesCore.jl/b0b8dbf26807f8f6bc1a3c073b6720b8d90a8cd4/docs/src/assets/logo.svg" width="256"/>

# ChainRulesDeclarationHelpers

[![Build Status](https://github.com/JuliaDiff/ChainRulesDeclarationHelpers.jl/workflows/CI/badge.svg)](https://github.com/JuliaDiff/ChainRulesDeclarationHelpers.jl/actions?query=workflow:CI)
[![Coverage](https://codecov.io/gh/JuliaDiff/ChainRulesDeclarationHelpers.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/JuliaDiff/ChainRulesDeclarationHelpers.jl)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)
[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)
[![DOI](https://zenodo.org/badge/199721843.svg)](https://zenodo.org/badge/latestdoi/199721843)

**Docs:**
[![](https://img.shields.io/badge/docs-dev-blue.svg)](https://juliadiff.org/ChainRulesDeclarationHelpers.jl/dev)
[![](https://img.shields.io/badge/docs-stable-blue.svg)](https://juliadiff.org/ChainRulesDeclarationHelpers.jl/stable)

The ChainRulesDeclarationHelpers package provides a suite of functionality for defining [ChainRulesCore.jl](https://github.com/JuliaDiff/ChainRulesCore.jl) rules.

It is a fair bit more experimental than ChainRulesCore, and also a bit more heavy-weight to load as it uses some packages to help write macros.
If you care about staying ultra-light weight stick to just using ChainRulesCore directly.
If you want to be sure to not need to deal with breaking changes, stick to just using ChainRulesCore directly.
If you want to get rid of some boiler-plate, and don't mind giving up either of those things, you have come to the right place.

ChainRulesCore does define some helper macros of it's own, like `@nondifferentiable` and `@scalar_rule`.
They are fairly limited, though useful.
As anyone who has ever looked on the inside of them they are pretty complex, this is because they need to process fairly complicated ASTs, but due to ChainRulesCore's ultra-lightweight policy, they can't add any dependencies on packages that would make that easier.
