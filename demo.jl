using Printf
using LLKLIEP
using Random

Random.seed!(1987)
# dimension
d = 1
# sample size, for numerator and denominator
n = 500
# number of basis
b = 100
# sigma in RBF feature
Ļ = 4

# generating data
šā = randn(d, n)
šā = randn(d, n) .+ .5
Xb = [šā[:,1:b] šā[:,1:b]]

# converting samples into feature
fšā = š(comp_dist2(Xb,šā),Ļ)
fšā = š(comp_dist2(Xb,šā),Ļ)

# estimate
Īø = estimate(fšā, fšā, 1e-1, 1, 10000, 1)

# using the estimated parameter to produce the estimated ratio
šā = reshape(range(-4.0,4.0,length=200),1,200)
fšā = š(comp_dist2(Xb,šā),Ļ)

ršā_hat = exp.(logratio(Īø, fšā, fšā))
ršā_real = exp.(-.5*šā)

# plotting the estimated ratio alongside with the true ratio
print("plotting, takes some time in Julia...")
plot_ratio(šā, šā, šā, ršā_hat, ršā_real)
