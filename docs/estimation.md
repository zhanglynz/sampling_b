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