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

# ╔═╡ 8fb71700-b4a0-11eb-1a77-57de26bec3ff
begin
	using Pkg,PlutoUI,Plots
	plotlyjs()
	Pkg.add("ForwardDiff")
	using ForwardDiff
end

# ╔═╡ 4d1975a9-08d7-43d3-86aa-5a1604a477f7
f(x) = x^2

# ╔═╡ 5474a79c-5e5a-4afe-92db-2614cc32f8a0
md"""
x₀ = $(@bind x0 Slider(-3:0.1:3,show_value=true,default=0))

Mostrar derivada: $(@bind mostrar_derivada CheckBox(default=false))
Mostrar recta tangente: $(@bind mostrar_tangente CheckBox(default=false))
Mostrar recta normal: $(@bind mostrar_normal CheckBox(default=false))
"""

# ╔═╡ a0ac637a-2b32-4568-9ffa-3ad5c69dbbd1
begin
	y0 = f(x0)
	df(x) = ForwardDiff.derivative(f,x)
	l(x) = df(x0)*(x-x0) + f(x0)
	n(x) = (-1/df(x0))*(x-x0) + f(x0)
	p = plot(f,label="f(x)",ylim=[-3,3],color=:blue)
	if mostrar_derivada 
	plot!(df,label="f'(x)",color=:green)
	end
	if mostrar_tangente
	plot!(l,label=false,color=:red)
	end
	if mostrar_normal
	plot!(n,label=false,color=:black)
	end
	scatter!([(x0,y0)],label=false)
	p
end

# ╔═╡ e309ed4b-abf7-47e9-b79d-4db213eacbb0
md"""
Un par que preguntas a revisar cuando analicen una funcion

- Que signo tiene la derivada en ese punto?

- Cuales son los ceros y los conjuntos de positividad y negatividad de la derivada?

- Cuales son los maximos y minimos de la funcion?

- Cuales son los intervalis de crecimiento y decrecimiento de la funcion?
"""

# ╔═╡ Cell order:
# ╟─8fb71700-b4a0-11eb-1a77-57de26bec3ff
# ╠═4d1975a9-08d7-43d3-86aa-5a1604a477f7
# ╟─5474a79c-5e5a-4afe-92db-2614cc32f8a0
# ╟─a0ac637a-2b32-4568-9ffa-3ad5c69dbbd1
# ╟─e309ed4b-abf7-47e9-b79d-4db213eacbb0
