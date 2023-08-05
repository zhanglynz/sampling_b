# Estimation With Survey Data

By survey data, we mean in the data table one column is for the variable of
interest $Y$ and another column is for weights $W$. Let
$$
Y=(y_1, y_2, \ldots, y_n)^T,
$$
and 
$$
W=(w_1, w_2, \ldots, w_n)^T.
$$

## Estimating quantiles

Suppose we want to estimate the $10th$, $50th$ and $90th$ percentiles. One idea is as follows:

1. Turn $(Y, W)$ as a discrete distribution by normalizing the weights, that is,
$$
p_i = \frac{w_i}{\sum_{i=1}^n w_i}, \ \hbox{for}\ i=1, \ldots, n.
$$
1. Take $N$ (e.g. $N = 10^5$) i.i.d. values from the distribution
$$
\left(
\begin{array}{cccc}
y_1 & y_2 & \cdots & y_n\\
p_1 & p_2 & \cdots & p_n
\end{array}
\right).
$$
1. Using the empirical distribution formed by the i.i.d. values to estimate quantiles.

**R program:**


```r
estimate_percentile <- function(y_vec, weight_vec, N = 100000, the_p = 50)
{if(the_p < 1e-6 || the_p > 100) stop("the_p should be between 0 and 100!")
 # a helper function
 sample_discrete_v <- function(support_vec, prob_vec, n)
 {cp <- cumsum(prob_vec)
  rand_nbrs <- runif(n, 0, 1)
  the_index <- vapply(rand_nbrs, function(x) which(x < cp)[1],
                      FUN.VALUE = numeric(1))
  support_vec[the_index]
 } 
 p_vec <- weight_vec / sum(weight_vec)
 a_sample <- sample_discrete_v(support_vec = y_vec,
                               prob_vec = p_vec,
                               n = N)
 the_r <- as.integer(the_p / 100 * N)
 sorted_ <- sort(a_sample)
 the_re <- sorted_[the_r]
 return(the_re)
}

# NB: A reference for generating random numbers from a discrete distribution
# https://stats.stackexchange.com/questions/26858/how-to-generate-numbers-based-on-an-arbitrary-discrete-distribution
```

