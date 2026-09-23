library(tidyverse)

A <- matrix(c(
  4,  1,
  2,  3
),
  nrow = 2,
  byrow = TRUE
)
eigen_A <- eigen(A)
eigen_A

trace_A = sum(diag(A))
det_A = det(A)
sum_eigen <- sum(eigen_A$values)
prod_eigen <- prod(eigen_A$values)

trace_A
det_A
sum_eigen
prod_eigen
