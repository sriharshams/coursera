
#q1
n <- 9
μ <- 1100
σ <- 30
quantile = 0.975 # is 95% with 2.5% on both sides of the range
confidenceInterval = μ + c(-1, 1) * qt(quantile, df=n-1) * σ / sqrt(n) 
confidenceInterval


#q2
n <- 9
averageDifference <- -2
quantile = 0.975 # is 95% with 2.5% on both sides of the range
ci_up = 0
σ = (ci_up - averageDifference * sqrt(n))/qt(quantile, df=n-1)
round(σ, 2)

#q4
quantile = 0.975 # is 95% with 2.5% on both sides of the range

n_y <- 10 # nights new system
n_x <- 10 # nights old system
var_y <- 0.60 # variance new (sqrt of σ)
var_x <- 0.68 # variance old (sqrt of σ)
μ_y <- 3 # average hours new system
μ_x <- 5 # average hours old system

# calculate pooled standard deviation
σ_p <- sqrt(((n_x - 1) * var_x + (n_y - 1) * var_y)/(n_x + n_y - 2))

confidenceInterval <- μ_y - μ_x + c(-1, 1) * qt(quantile, df=n_y+n_x-2) * σ_p * (1 / n_x + 1 / n_y)^.5
round(confidenceInterval,2)


#q7
quantile = 0.95 # is 90% with 5% on both sides of the range

n_y <- 9 # subjects treated
n_x <- 9 # subjects placebo
σ_y <- 1.5 # kg/m2 std.dev. treated 
σ_x <- 1.8 # kg/m2 std.dev. placebo 
μ_y <- -3 #  kg/m2 average difference treated
μ_x <- 1 #  kg/m2 average difference placebo

# calculate pooled standard deviation
σ_p <- sqrt(((n_x - 1) * σ_x^2 + (n_y - 1) * σ_y^2)/(n_x + n_y - 2))

confidenceInterval <-  μ_y - μ_x + c(-1, 1) * qt(quantile, df=n_y+n_x-2) * σ_p * (1 / n_x + 1 / n_y)^.5
round(confidenceInterval,3)