using Test
using ChainRulesDeclarationHelpers
using ChainRulesCore
using ChainRulesTestUtils
using Zygote

@testset "ChainRulesDeclarationHelpers" begin
    include("rrule_from_frule.jl")
end
