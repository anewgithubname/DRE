using Plots

"""
Computes the euclidean distance between two matrices ð and ð.
returns a matrix ð,

``D[i,j] = ||ð[:,i]-ð[:,j]||^2``
"""
function comp_dist2(ð,ð)
  sum(ð.^2,dims=1)' .- 2*ð'*ð .+ sum(ð.^2,dims=1)
end

"""
Compute the kernel function given the distnace function.
Input a matrix ð, returns a matrix ð,

''K[i,j] = exp(-D[i,j]./Ï.^2/2)''
"""
function ð(dist2,Ï)
  exp.(-dist2./Ï.^2/2)
end

"""
plot the computed ratio.
Input xâ: plotting x, rxâ_hat: estimated ratio, rxâ: real ratio
"""
function plot_ratio(xâ, xâ, xâ, rxâ_hat, rxâ)
    plot(xâ',rxâ_hat',label = "estimated p/q",linewidth = 5)
    scatter!(xâ',zeros(5000),color=:red, label = "sample from p",
            markershape=:cross, markersize = 10, markeralpha = .25)
    scatter!(xâ',zeros(5000).+.1,color=:blue,label = "sample from q",
            markershape=:xcross, markersize = 10, markeralpha = .25)
    return plot!(xâ',rxâ',label = "p/q",linewidth = 5, legendfontsize=18,
            xtickfontsize = 18, ytickfontsize = 18)
end