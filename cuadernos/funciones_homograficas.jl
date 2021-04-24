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

# ╔═╡ 377dacc0-a3c5-11eb-2818-ef550190e23d
begin
	using Plots, PlutoUI, CommonMark
	plotlyjs()
end

# ╔═╡ b615f2e2-a411-4f17-933c-9ee0a15adc6a
md"""
``V`` $(@bind V Slider(-10:0.1:10,show_value=true,default=1))

``x`` $(@bind xi Slider(0.1:0.01:2,show_value=true,default=0))
"""

# ╔═╡ 58de3ac6-30a0-4ace-bc83-11ed91009a54
p(x) = V/x

# ╔═╡ cc8973a6-669b-460f-b515-48548c8bbc38
begin
r0 = range(0.05,stop=2,length=1000) 	
plot(r0,p.(r0),label=false,xlims=[0,2],ylim=sort([sign(V)*20,0]))
y = p(xi)
vline!([xi],label=false)
hline!([y],label=false)
scatter!([(xi,y)],label=false)
end

# ╔═╡ bb59f36f-d6c3-4afa-b5a1-0069e916a739
md"""
``A`` $(@bind A Slider(-10:0.1:10,show_value=true,default=1))

``B`` $(@bind B Slider(-2:0.1:2,show_value=true,default=0))

``C`` $(@bind C Slider(-10:0.1:10,show_value=true,default=0))
"""

# ╔═╡ 5ceac717-6fa2-4d20-9384-f90d63c94e55
f(x) = A / (x-B) + C

# ╔═╡ 44076b9e-d547-4fdd-a2e6-eebcf37175c2
Markdown.parse("""
	\`\`\`math
	f(x) = \\frac{$A}{x-$B}+$C
	\`\`\`
	""")

# ╔═╡ 52ef0e0f-cc79-44f9-b3a0-8779b831cef3
begin
r = range(-5,stop=5,length=500)	
plot(r,f.(r),label=false,xlim=[-4,4],ylim=[-10,10])
hline!([C],label="y=C")
vline!([B],label="x=B")
end

# ╔═╡ 229da4be-7ef8-457a-924c-5802516e4328
begin
a(x) = x + 2
den(x) = x + 3
end

# ╔═╡ 39b33678-ab2f-4236-b3ec-adc157850498
rango = 1:1000

# ╔═╡ 97ba7812-fc14-49df-be09-5b63cddeac3e
a.(rango)

# ╔═╡ 349850cf-ec77-49ca-bce0-7e63b842be14
den.(rango)

# ╔═╡ cb875d9c-f590-4d30-86b7-0475ea206195
h(x) = a(x)/den(x)

# ╔═╡ f18fcc1b-ab88-4ab4-920b-814a2a7d5f3a
h.(rango)

# ╔═╡ 59c64275-2fee-489a-893f-1b100b2c3749
plot([a,den,h])

# ╔═╡ Cell order:
# ╟─377dacc0-a3c5-11eb-2818-ef550190e23d
# ╟─b615f2e2-a411-4f17-933c-9ee0a15adc6a
# ╟─58de3ac6-30a0-4ace-bc83-11ed91009a54
# ╟─cc8973a6-669b-460f-b515-48548c8bbc38
# ╟─bb59f36f-d6c3-4afa-b5a1-0069e916a739
# ╟─5ceac717-6fa2-4d20-9384-f90d63c94e55
# ╟─44076b9e-d547-4fdd-a2e6-eebcf37175c2
# ╠═52ef0e0f-cc79-44f9-b3a0-8779b831cef3
# ╠═229da4be-7ef8-457a-924c-5802516e4328
# ╠═39b33678-ab2f-4236-b3ec-adc157850498
# ╠═97ba7812-fc14-49df-be09-5b63cddeac3e
# ╠═349850cf-ec77-49ca-bce0-7e63b842be14
# ╠═cb875d9c-f590-4d30-86b7-0475ea206195
# ╠═f18fcc1b-ab88-4ab4-920b-814a2a7d5f3a
# ╠═59c64275-2fee-489a-893f-1b100b2c3749
