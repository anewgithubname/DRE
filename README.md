Suppose you have two sets of samples
šā, šā

## Converting samples into feature
```fšā = š(comp_dist2(Xb,šā),Ļ)
fšā = š(comp_dist2(Xb,šā),Ļ)
```

## Estimating, see code for explanation of arguments. 
```
Īø = estimate(fšā, fšā, 1e-1, 1, 10000, 1)
```

## Getting estimated log ratio
```
ršā_hat = exp.(logratio(Īø, fšā, fšā))
```