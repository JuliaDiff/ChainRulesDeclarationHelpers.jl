using ChainRulesCore

"""
    @rrule_from_frule(signature_expression)

A helper to define an rrule by calling back into AD on an already defined frule.
The pushforward at the point is a linear function which has the same derivative as
the primal at that point. So asking for its derivative gives you the derivative of 
the primal. Moreover, asking for its rrule effectively amounts to transposing the 
pushforward implied by the frule.

Further Reading
[1] Roy Frostig, Matthew J. Johnson, Dougal Maclaurin, Adam Paszke, and Alexey Radul.
    Decomposing reverse-mode automatic differentiation. LAFI 2021
"""
macro rrule_from_frule(signature_expression)
    @assert Meta.isexpr(signature_expression, :call)
    @assert length(signature_expression.args) == 2 "Only single-argument functions are implemented."
    # TODO add support for multiple arguments, varargs, kwargs

    f = signature_expression.args[1]
    arg = signature_expression.args[2]
    @assert Meta.isexpr(arg, :(::), 2)

    return rrule_from_frule_expr(__source__, f, arg)
end

function rrule_from_frule_expr(__source__, f, arg)
    f_instance_name  = gensym(Symbol(:instance_, Symbol(f)))
    return quote
        function ChainRulesCore.rrule(config::RuleConfig{>:HasReverseMode}, $f_instance_name::Core.Typeof($(esc(f))), $arg)
            $(__source__)
            pushforward(Δfarg...) = frule(Δfarg, $f_instance_name, $arg)[2]
            _, back = rrule_via_ad(config, pushforward, $f_instance_name, $arg)
            y = $f_instance_name($arg) # TODO optimize away redundant primal computation
            f_pullback(Δy) = back(Δy)[2:end]
            return y, f_pullback
        end
    end
end
