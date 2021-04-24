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

# ╔═╡ ebcdbdd0-9e9f-11eb-37cd-9d8e9dd6028f
begin
	using Plots,PlutoUI
	plotlyjs()
end

# ╔═╡ 05405030-12ea-4cb4-b272-0d1552a480c6
f(x) = x / (2x+1)

# ╔═╡ dd39da8c-d2e1-4df2-85e4-f5d6d928bcba
begin
xo_s = @bind xo Scrubbable(-100.0:100.0,default=0.0)
s_s  = @bind s Scrubbable(0.01:0.01:10,default=1.0)
xf_s = @bind xf Scrubbable(-100.0:100.0,default=10.0)
md" $(xo_s) : $(s_s) : $(xf_s)"
end

# ╔═╡ ccdb4441-c1c3-4966-a9c5-bd3e886815b8
begin
r = xo:s:xf
plot(r,f)
end

# ╔═╡ Cell order:
# ╟─ebcdbdd0-9e9f-11eb-37cd-9d8e9dd6028f
# ╟─05405030-12ea-4cb4-b272-0d1552a480c6
# ╟─dd39da8c-d2e1-4df2-85e4-f5d6d928bcba
# ╟─ccdb4441-c1c3-4966-a9c5-bd3e886815b8
