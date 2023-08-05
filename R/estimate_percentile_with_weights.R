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