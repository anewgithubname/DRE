using Plots

"""
Computes the euclidean distance between two matrices 𝐗 and 𝐘.
returns a matrix 𝐃,

``D[i,j] = ||𝐗[:,i]-𝐘[:,j]||^2``
"""
function comp_dist2(𝐗,𝐘)
  sum(𝐗.^2,dims=1)' .- 2*𝐗'*𝐘 .+ sum(𝐘.^2,dims=1)
end

"""
Compute the kernel function given the distnace function.
Input a matrix 𝐃, returns a matrix 𝐊,

''K[i,j] = exp(-D[i,j]./σ.^2/2)''
"""
function 𝐊(dist2,σ)
  exp.(-dist2./σ.^2/2)
end

"""
plot the computed ratio.
Input xₜ: plotting x, rxₜ_hat: estimated ratio, rxₜ: real ratio
"""
function plot_ratio(xₜ, x₁, x₂, rxₜ_hat, rxₜ)
    plot(xₜ',rxₜ_hat',label = "estimated p/q",linewidth = 5)
    scatter!(x₁',zeros(5000),color=:red, label = "sample from p",
            markershape=:cross, markersize = 10, markeralpha = .25)
    scatter!(x₂',zeros(5000).+.1,color=:blue,label = "sample from q",
            markershape=:xcross, markersize = 10, markeralpha = .25)
    return plot!(xₜ',rxₜ',label = "p/q",linewidth = 5, legendfontsize=18,
            xtickfontsize = 18, ytickfontsize = 18)
end