@testset "rrule_from_frule" begin
    @testset "single argument" begin
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
    @testset "multiple arguments" begin
        function f(x, z)
            a = x + z
            b = sin.(a)
            c = sum(b)
            d = c * b
            return d
        end
        
        function ChainRulesCore.frule((Δself, Δx, Δz), ::typeof(f), x, z)
            a, ȧ = x + z, Δx + Δz
            b, ḃ = sin.(a), cos.(a) .* ȧ
            c, ċ = sum(b), sum(ḃ)
            d, ḋ = c * b, ċ * b + c * ḃ
            return d, ḋ
        end
        
        x = rand(3)
        z = rand(3)
        test_frule(f, x, z)
    
        @rrule_from_frule f(x::AbstractArray{<:Real}, z::AbstractArray{<:Real})
        test_rrule(Zygote.ZygoteRuleConfig(), f, x, z; check_inferred=false)    
    end
end
