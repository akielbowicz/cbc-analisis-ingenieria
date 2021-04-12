### A Pluto.jl notebook ###
# v0.14.1

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

# ╔═╡ ea8cc0e4-9920-11eb-360c-a1ca0e5fea2a
begin
	using Pluto,PlutoUI,Plots
	using Printf: @sprintf
	plotly()
end

# ╔═╡ 483ce98d-3409-4fed-a360-89291d643ae1
md"""# Bienvenide al Pequeño Graficador de Sucesiones

La idea de esta herramienta es que juegues con los controles para ir explorando las distintas caracteristicas de las sucesiones. 

A divertirse :)

tip: los gráficos son interactivos
"""

# ╔═╡ 12f9cc2e-e335-4242-89ac-e3819c944266
md"N: $(@bind N Slider(0:100,default=1,show_value=true)) es la cantidad de puntos a graficar"

# ╔═╡ a1b36581-d9fc-4b41-8c41-1a6d64d95d4a
md"Definir la sucesión $a_{n}$ en la siguiente:"

# ╔═╡ 742547cf-890a-4b6f-8d24-92772b5b3f14
a(n) = 1/n

# ╔═╡ 3deee887-5ec0-4b01-84bb-b1a4edd0cffb
scatter(a.(1:N),zeros(N),hover=["n:$i, an:$(@sprintf("%.5g",a(i)))" for i in 1:N],ylim=(-0.01,0.01),marker=:vline,yaxis=false,legend=false)

# ╔═╡ 52c81bda-00c9-4c68-ab02-8a78dd8e79a0
md"""### Límite de una sucesión
	Sea (aₙ)  n ∈ N una sucesión de números reales. 
	Decimos que un número real *L* es límite de la sucesión si para todo ϵ > 0 existe	un natural n₀ = n₀(ϵ) a partir del cual, los valores de la sucesión distan de *L* en menos de ϵ. 
	
	En símbolos 
	
		∀ϵ > 0, ∃ n₀ = n₀(ϵ) ∈ N tal que ∀n > n₀ ⇒ |L − aₙ| < ϵ
	"""

# ╔═╡ 35838740-5278-4e35-bc1f-58e783789101
md"""
L = $(@bind L Slider(1:30,show_value=true))

ϵ₀ = $(@bind ϵ0 Slider(0:0.01:1,default=1,show_value=true))       
E  = $(@bind E Slider(-10:1,default=0,show_value=true))

nᵢ = $(@bind n0 Slider(0:1000,show_value=true))   *n_inicial*
"""

# ╔═╡ 13fce500-346f-4446-a6b5-9c5270c25d6f
begin
	ϵ = ϵ0*10.0^E
	md"ϵ = $ϵ0*10^E$ = $(@sprintf(\"%.5g\",ϵ))"
end

# ╔═╡ 1b0d0069-d7f1-45f9-8690-d68655340f49
begin
scatter(n0:n0+N,L.-a.(n0:n0+N),markersize=0.5,legend=false)
hline!([L],width=1)
hline!([L-ϵ,L+ϵ])
end

# ╔═╡ Cell order:
# ╟─ea8cc0e4-9920-11eb-360c-a1ca0e5fea2a
# ╟─483ce98d-3409-4fed-a360-89291d643ae1
# ╟─12f9cc2e-e335-4242-89ac-e3819c944266
# ╟─a1b36581-d9fc-4b41-8c41-1a6d64d95d4a
# ╠═742547cf-890a-4b6f-8d24-92772b5b3f14
# ╟─3deee887-5ec0-4b01-84bb-b1a4edd0cffb
# ╟─52c81bda-00c9-4c68-ab02-8a78dd8e79a0
# ╟─35838740-5278-4e35-bc1f-58e783789101
# ╟─13fce500-346f-4446-a6b5-9c5270c25d6f
# ╟─1b0d0069-d7f1-45f9-8690-d68655340f49
