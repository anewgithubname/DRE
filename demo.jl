using Printf
using LLKLIEP
using Random

Random.seed!(1987)
d = 1
n = 500
b = 100
σ = 4

𝐗₁ = randn(d, n)
𝐗₂ = randn(d, n) .+ .5
Xb = [𝐗₁[:,1:b] 𝐗₂[:,1:b]]

f𝐗₁ = 𝐊(comp_dist2(Xb,𝐗₁),σ)
f𝐗₂ = 𝐊(comp_dist2(Xb,𝐗₂),σ)

θ = estimate(f𝐗₁, f𝐗₂, 1e-1, 1, 10000, 1)

𝐗ₜ = reshape(range(-4.0,4.0,length=200),1,200)
f𝐗ₜ = 𝐊(comp_dist2(Xb,𝐗ₜ),σ)

r𝐗ₜ_hat = exp.(logratio(θ, f𝐗ₜ, f𝐗₂))
r𝐗ₜ_real = exp.(-.5*𝐗ₜ)

print("plotting, takes some time in Julia...")
plot_ratio(𝐗ₜ, 𝐗₁, 𝐗₂, r𝐗ₜ_hat, r𝐗ₜ_real)
