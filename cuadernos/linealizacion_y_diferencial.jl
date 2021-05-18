### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ e55010c0-b76d-11eb-2a21-d971845b6910
begin
	using Plots,PlutoUI,ForwardDiff
	plotlyjs()
end

# ╔═╡ 1b5d7083-faaf-4cdb-8a7f-3ccbf9af47d9
f(x) = x^2

# ╔═╡ 8861d281-5968-482d-8c0c-9d5308335411
md"""
x₀ = $(@bind x₀ Slider(-3:0.1:3,default=0,show_value=true))

Δx = $(@bind Δx Slider(0.01:0.1:1,default=1,show_value=true))
"""

# ╔═╡ c10041fe-bbe9-45b5-a405-56cabda81ccf
begin
	fₓ(x) = ForwardDiff.derivative(f,x)
	L(x) = fₓ(x₀)*(x-x₀) + f(x₀) 
	plot(f,label="f(x)",ylim=[-10,10])
	# plot!(fₓ,label="f'(x)")
	plot!(L,label="L(x)")
	x1 = x₀+Δx 
	plot!([(x1,L(x1)),(x1,f(x1))],label="Δf-df",with=3)
	plot!([(x1,f(x₀)),(x1,L(x1))],width=2,label=false,color=:black)
	plot!([(x₀,f(x₀)),(x1,f(x₀))],width=2,label=false,color=:black)
end

# ╔═╡ Cell order:
# ╠═e55010c0-b76d-11eb-2a21-d971845b6910
# ╠═1b5d7083-faaf-4cdb-8a7f-3ccbf9af47d9
# ╟─8861d281-5968-482d-8c0c-9d5308335411
# ╟─c10041fe-bbe9-45b5-a405-56cabda81ccf
