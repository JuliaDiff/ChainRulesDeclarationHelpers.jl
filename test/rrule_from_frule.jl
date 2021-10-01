using Test
using ChainRulesDeclarationHelpers
using ChainRulesCore
using ChainRulesTestUtils
using Zygote


@testset "rrule_from_frule" begin
    function f(x)
        a = sin.(x)
        b = sum(a)
        c = b * a
        return c
    end
    
    function ChainRulesCore.frule((Δself, Δx), ::typeof(f), x)
        a, ȧ = sin.(x), cos.(x) .* Δx 
        b, ḃ = sum(a), sum(ȧ)
        c, ċ = b * a, ḃ * a + b * ȧ
        return c, ċ
    end
    
    x = rand(3)
    test_frule(f, x)

    @rrule_from_frule f(x::AbstractArray{<:Real})
    test_rrule(Zygote.ZygoteRuleConfig(), f, x; check_inferred=false)
end
