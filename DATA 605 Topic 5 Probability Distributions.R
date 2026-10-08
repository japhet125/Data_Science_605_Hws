# Parameters
n <- 20
p <- 0.10

# 1. Probability of exactly 3 incomplete applications
prob_exactly_3 <- dbinom(3, size = n, prob = p)

# 2. Probability of at most 3 incomplete applications
prob_at_most_3 <- pbinom(3, size = n, prob = p)

# 3. Probability of at least 4 incomplete applications
prob_at_least_4 <- 1 - pbinom(3, size = n, prob = p)

# 4. Theoretical mean and standard deviation
theoretical_mean <- n * p
theoretical_variance <- n * p * (1 - p)
theoretical_sd <- sqrt(theoretical_variance)

cat("P(X = 3):", prob_exactly_3, "\n")
cat("P(X <= 3):", prob_at_most_3, "\n")
cat("P(X >= 4):", prob_at_least_4, "\n")
cat("Theoretical mean:", theoretical_mean, "\n")
cat("Theoretical standard deviation:", theoretical_sd, "\n")

# Simulation

set.seed(12345)

# Simulate 10,000 groups of 20 applications
simulated_counts <- rbinom(
  n = 10000,
  size = n,
  prob = p
)

# Simulated probabilities
sim_prob_exactly_3 <- mean(simulated_counts == 3)
sim_prob_at_most_3 <- mean(simulated_counts <= 3)
sim_prob_at_least_4 <- mean(simulated_counts >= 4)

# Simulated descriptive statistics
simulated_mean <- mean(simulated_counts)
simulated_sd <- sd(simulated_counts)

cat("Simulated P(X = 3):", sim_prob_exactly_3, "\n")
cat("Simulated P(X <= 3):", sim_prob_at_most_3, "\n")
cat("Simulated P(X >= 4):", sim_prob_at_least_4, "\n")
cat("Simulated mean:", simulated_mean, "\n")
cat("Simulated standard deviation:", simulated_sd, "\n")

# Visualization

x_values <- 0:n
theoretical_probabilities <- dbinom(
  x_values,
  size = n,
  prob = p
)

hist(
  simulated_counts,
  breaks = seq(-0.5, n + 0.5, by = 1),
  probability = TRUE,
  col = "skyblue",
  border = "white",
  main = "Binomial Distribution: n = 20, p = 0.10",
  xlab = "Number of incomplete applications",
  ylim = c(0, max(theoretical_probabilities) * 1.2)
)

points(
  x_values,
  theoretical_probabilities,
  col = "darkred",
  pch = 19
)

lines(
  x_values,
  theoretical_probabilities,
  col = "darkred",
  lwd = 2
)

grid()