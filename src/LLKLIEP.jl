module LLKLIEP    

export estimate, logratio, comp_dist2, 𝐊, plot_ratio

using Statistics
using LinearAlgebra
using ReverseDiff: GradientTape, GradientConfig, gradient,
                gradient!, compile, DiffResults

include("Util.jl")

"""
KLIEP objective with log linear model
input θ, density ratio parameter,
    𝐅x₁, numerator after feature transform,
    𝐅x₂, denominator after feature transform,
    λ, regularization term
"""
function J(θ, 𝐅x₁, 𝐅x₂, λ)
    # adding a small regularizer
    J = -θ' * mean(𝐅x₁,dims=2) .+ log(mean(exp.(θ' * 𝐅x₂))) + λ*θ'*θ
end

"""
Estimate log linear density ratio model
input 𝐅x₁, numerator after feature transform,
    𝐅x₂, denominator after feature transform,
"""
function estimate(FX1, FX2, λ = .1, eta = .1, iter=5000, disp = nothing)
    b = size(FX1,1)

    # Taking gradient 
    obj(θ) = J(θ, FX1, FX2, λ)
    obj_tape = GradientTape(obj, (randn(b, 1)))
    compiled_obj_tape = compile(obj_tape)

    θ = randn(b,1)
    ∇J = similar(θ)

    # gradient descent
    for i = 0:iter
        gradient!(∇J, compiled_obj_tape, θ)
        θ = θ - eta*∇J

        if disp === nothing
            continue
        end
        if mod(i,1000) == 0
            println("iteration:", floor(Int, i/1000), "k, objective val:", obj(θ))
        end
    end
    θ
end

"""
Compute the log ratio using estimated ratio parameter
Input, Ft: testing points after feature transform
    FX2: denominator samples
"""
function logratio(θ, Ft, FX2)
    θ' * Ft.- log(mean(exp.(θ' * FX2)))
end
end