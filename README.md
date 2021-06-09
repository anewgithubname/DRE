

## Estimate
```θ = estimate(f𝐗₁, f𝐗₂, 1e-1, 1, 10000, 1)```

## Getting Estimated Log Ratio
```r𝐗ₜ_hat = exp.(logratio(θ, f𝐗ₜ, f𝐗₂))```