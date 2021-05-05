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

# ╔═╡ 27bdb510-ad38-11eb-3854-4dc8f7ca7154
begin
	using Plots,PlutoUI
	plotlyjs()
end

# ╔═╡ 7a8e9c8e-1471-41f5-81e1-5c7d92994521
md"""# What the ϵ-δ!!!

En este cuaderno vamos a explorar el concepto de continuidad de una funcion utilizando la definicion de ϵ-δ.
"""

# ╔═╡ 30983170-71fa-4b4d-8142-39f8f60768a0
md"Primero definamos la funcion ``f(x)``"

# ╔═╡ 8ca53e3b-219c-4d87-bd32-28aa2db75cca
f(x) = x

# ╔═╡ e8cee677-00b9-4511-a56d-fff53282719e
md"Y eligamos un punto ``x_{0} \in Dom(f)`` en el cual vamos a analizar la funcion"

# ╔═╡ a0aa85d3-2c69-4617-931a-b0c060626630
x₀ = 1

# ╔═╡ 4ff601e9-085c-494d-b405-22f56889a475
md"""
Usen los siguientes controles para responder la siguientes preguntas 

#### A)

Si me dan un```\epsilon > 0``, cuanto tiene que valer ``δ`` para que la imagen ``f(x)`` de todos los puntos ``x`` que estan a una distancia menor a ``δ`` de ``x_0`` (``| x - x_0| < \delta ``) esten a una distancia menor a ``\epsilon`` de ``f(x_0)`` (``|f(x) - f(x_0) | < \epsilon ``)?

#### B)

Puedo hacer ``\epsilon`` tan chico como yo quiera y encontrar un ``\delta`` que cumpla la condicion de arriba?
"""

# ╔═╡ e5d0e972-6009-4a0d-849f-6a43103e99a0
# δ₁,δ₂,ϵ₀,E=0.1,0.2,1.0,1.0
md"""
ϵ₀ = $(@bind ϵ₀ Slider(0.01:0.01:1,default=1,show_value=true))
E = $(@bind E Slider(-5:1,default=0,show_value=true))

δ₁ = $(@bind δ₁ Slider(0.01:0.01:1,default=1,show_value=true))
δ₂ = $(@bind δ₂ Slider(0.01:0.01:1,default=1,show_value=true))
"""

# ╔═╡ d99e9b14-4f51-468f-8d13-9db1fd29f5b8
md"ϵ = ``ϵ₀*10^E`` = $(ϵ = ϵ₀*10^E)  |  δ = max(δ₁,δ₂) = $(δ = max(δ₁,δ₂))"

# ╔═╡ b18fa593-cea1-446c-a56e-4b22cb2aee4c
begin
x0 = floor(x₀)
md"""
``X`` = $(@bind x_i Scrubbable(x0-5:0.1:x0,default=x0-3)):
$(@bind x_s Scrubbable(0.001:0.05:1,default=1,format=".2g")):
$(@bind x_f Scrubbable(x0:0.1:x0+5,default=x0+3))
	
El dominio de puntos para graficar *inicio:espaciado:final*	
"""
end

# ╔═╡ 17bb2999-2bf3-4eef-94d0-7f610f67cd97
begin
	xs = x_i:x_s:x_f
	y₀ = f(x₀)
	plot(xs,f.(xs), label=false)
	scatter!([(x₀,y₀)], label=false,color=:red)
	hline!([y₀-ϵ,y₀+ϵ], label=false)
	vline!([x₀ - δ₁,x₀ + δ₂], label=false)
end

# ╔═╡ f3789190-904d-4d1b-afa2-e2e952c84b4d
md"""
**Ejemplos de funciones que pueden probar**

1) f(x) un polinomio de grado igual o mayor a 2.

2) f(x) una funcion homografica.

3) La siguiente funcion definida en partes

```math
f(x) = \begin{cases} 
	  x & x \leq x_{0} \\
	  x - 1 & x \gt x _{0}
   \end{cases}
```
Pueden copiar el siguiente codigo
> f(x) =  x <= x₀ ? x : x-1 

"""

# ╔═╡ Cell order:
# ╟─27bdb510-ad38-11eb-3854-4dc8f7ca7154
# ╟─7a8e9c8e-1471-41f5-81e1-5c7d92994521
# ╟─30983170-71fa-4b4d-8142-39f8f60768a0
# ╠═8ca53e3b-219c-4d87-bd32-28aa2db75cca
# ╟─e8cee677-00b9-4511-a56d-fff53282719e
# ╠═a0aa85d3-2c69-4617-931a-b0c060626630
# ╟─4ff601e9-085c-494d-b405-22f56889a475
# ╟─e5d0e972-6009-4a0d-849f-6a43103e99a0
# ╟─d99e9b14-4f51-468f-8d13-9db1fd29f5b8
# ╟─17bb2999-2bf3-4eef-94d0-7f610f67cd97
# ╟─b18fa593-cea1-446c-a56e-4b22cb2aee4c
# ╟─f3789190-904d-4d1b-afa2-e2e952c84b4d
