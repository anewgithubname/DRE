Suppose you have two sets of samples
𝐗₁, 𝐗₂

## Converting samples into feature
```f𝐗₁ = 𝐊(comp_dist2(Xb,𝐗₁),σ)
f𝐗₂ = 𝐊(comp_dist2(Xb,𝐗₂),σ)
```

## Estimating, see code for explanation of arguments. 
```
θ = estimate(f𝐗₁, f𝐗₂, 1e-1, 1, 10000, 1)
```

## Getting estimated log ratio
```
r𝐗ₜ_hat = exp.(logratio(θ, f𝐗ₜ, f𝐗₂))
```