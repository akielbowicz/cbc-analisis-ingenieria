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

# ╔═╡ 623b2240-c520-11eb-0b1e-4b03cb67ac24
begin
	using PlutoUI,Plots, ForwardDiff
	plotlyjs()
end

# ╔═╡ c4ec78ff-b9c7-4867-81df-9384b965881e
md"## Polinomio de Taylor"

# ╔═╡ bc296b17-b6ca-476d-b9f4-1743559f0a6d
f(x) = sin(x)

# p₀(x=0) = f(x=0) = cos(0) = 1
# f'(x) = -sen(x) // f'(x=0) = -sen(0) = 0

# ╔═╡ 916c7595-d8ee-4ce1-9083-f403613131f7
md"""
a₀ = $(@bind a₀ Slider(-2:0.1:2,default=1,show_value=true))

a₁ = $(@bind a₁ Slider(-2:0.1:2,default=0,show_value=true))

a₂ = $(@bind a₂ Slider(-2:0.1:2,default=-0.5,show_value=true))

a₃ = $(@bind a₃ Slider(-2:0.1:2,default=0,show_value=true))

a₄ = $(@bind a₄ Slider(-2:0.1:2,default=0,show_value=true))
"""

# ╔═╡ 0831c272-bd4a-459a-9d8b-75bc4f926022
md"""
p₀(x) = $(a₀)

p₁(x) = $(a₀) + $(a₁) x

p₂(x) = $(a₀) + $(a₁) x + $(a₂) x²

p₃(x) = $(a₀) + $(a₁) x + $(a₂) x² + $(a₃) x³

p₄(x) = $(a₀) + $(a₁) x + $(a₂) x² + $(a₃) x³ + + $(a₄) x⁴
"""

# ╔═╡ 21815a23-2d33-4813-baca-21adcfa4a85f
begin
	p₀(x) = a₀
	p₁(x) = a₀ + a₁ * x
	p₂(x) = a₀ + a₁ * x + a₂ * x^2
	p₃(x) = a₀ + a₁ * x + a₂ * x^2 +  a₃ * x^3
	p₄(x) = a₀ + a₁ * x + a₂ * x^2 +  a₃ * x^3 + a₄ * x^4
	# p₂(x) = a₀ + a₁ * x + a₂ * x^2
end

# ╔═╡ 9f161f71-89db-44d3-84f3-be08176ff802
begin
	plot(f,xlim=[-2,2],label=false,width=2)
	plot!(p₀,label="p₀",width=2)
	plot!(p₁,label="p₁",width=2)
	plot!(p₂,label="p₂",width=2)
	plot!(p₃,label="p₃",width=2)
	plot!(p₄,label="p₄",width=2)
end

# ╔═╡ Cell order:
# ╟─623b2240-c520-11eb-0b1e-4b03cb67ac24
# ╟─c4ec78ff-b9c7-4867-81df-9384b965881e
# ╠═bc296b17-b6ca-476d-b9f4-1743559f0a6d
# ╟─916c7595-d8ee-4ce1-9083-f403613131f7
# ╟─0831c272-bd4a-459a-9d8b-75bc4f926022
# ╟─21815a23-2d33-4813-baca-21adcfa4a85f
# ╟─9f161f71-89db-44d3-84f3-be08176ff802
