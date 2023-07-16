# Weighting System

The main reference for this chapter is Haziza and Beaumont (2017).

## General ideas about weighting

Since a sample is a part/portion of a population, each item/individual in the sample represents itself plus others in the population; that is, a weight $w_i$ should be attached to the item/individual $i$. It's obvious that 

$$w_i>0$$
or sometimes
$$
w_i \ge 1.
$$

Weights are important because they are used in estimation of population parameters. Given the data, i.e. variable values and weights

$y$ | weight
:---:|:------:
$y_1$ | $w_1$
$y_2$ | $w_2$
$\vdots$ | $\vdots$
$y_n$ | $w_n$

we have estimates of the total and mean 
\begin{align}
\hat{t} &= \sum_{i=1}^n w_i y_i,\\
\hat{\bar{y}} &= \frac{\sum_{i=1}^n w_i y_i}{\sum_{i=1}^n w_i}.
\end{align}
In the literature, the estimator $\hat{t}$ is called the Horvitz-Thompson (HT) estimator.

## The three stages in producing final weights

- Stage 1: design weights
$$
d_i = \frac{1}{\pi_i},
$$
where $\pi_i$ is the selection/inclusion probability for item/individual $i$.

- Stage 2: weights adjusted for non-response. We use $\tilde{d}_i$ to denote the adjusted weight for item/individual $i$.

- Stage 3: final weights. We use $w_i$ to denote the final weight for item/individual $i$.

## Calibration

**Notation**

- We denote a population by $U$.
- A sample is denoted by $S$.
- Design weights: $\{d_k,\ k\in S\}$.
- Final weights: $\{w_k,\ k \in S\}$.

**What does calibration mean?**

Roughly speaking, calibration is to adjust from the design weights $\{d_i\}$ to final weights $\{w_i\}$ such that

a. $\{w_i\}$ are as close to $\{d_i\}$ as possible;
b. $\{w_i\}$ satisfy calibration constraints.

We will explain the exact meanings of a. and b. shortly.

**Why do we do calibration?**
 
According to Haziza and Beaumont (2017):

> The reasons for using calibration are three-fold:

> (i) to force consistency of certain survey estimates to known population quantities;  

> (ii) to reduce nonsampling errors such as nonresponse errors and coverage errors;

> (iii) to improve the precision of estimates.
>

**How do we do calibration?**

It's clear that calibration is an optimization problem, where the *decision variables* are $\{w_i\}$. The *objective function* is 
$$
\sum_{k\in S} d_k\frac{G(w_k/d_k)}{q_k},
$$
where $G(\cdot)$ is referred as a *distance function*---it measures the distance between $\{w_i\}$ and $\{d_i\}$, "$q_k$ is a scale factor indicating the importance of unit $k$ in the distance calculation. In most practical situations $q_k$ is set to 1." We assume that: a) $G(w_k/d_k)\ge 0$; b) $G(1)=0$; c) $G(\cdot)$ is differentiable; d) $G(\cdot)$ is strictly convex (i.e. the second derivative of $G$ is positive.)

The constraints are
$$
\sum_{k \in S} w_k \mathbf x_k = \mathbf t_{\mathbf x},
$$
where 
$$
\mathbf x_k = (x_{1k}, \ldots, x_{Jk}),
$$
and 
$$
\mathbf t_{\mathbf x}=(t_{x_1}, \ldots, t_{x_J}),
$$
with
$$
t_{x_j}=\sum_{k \in U} x_{jk}.
$$

**Example 1** Suppose that the population size $N$ is known. Setting 
$$
x_k =1\ \hbox{and}\ q_k=q\ \hbox{for}\ k\in S,
$$
we want to minimize
$$
f(w_k;\ k\in S)=\sum_{k \in S}d_k G(w_k/d_k),
$$
subject to
$$
\sum_{k \in S}w_k= N.
$$
It's easy to derive that
$$
w_k = N\frac{d_k}{\sum_{i \in S} d_i}.
$$
In this case, the calibrated total estimator is
\begin{align}
\hat{t}_{y,\ C} & = \sum_{k \in S}w_k y_k\\
&= \sum_{k \in S} N \frac{d_k}{\sum_{i \in S} d_i} y_k\\
&= N\frac{\hat{t}_{y,\ \pi}}{\hat{N}_{\pi}}.
\end{align}

**Example 2** Suppose $x_k$ is available for all $k \in S$ and it's known that $\sum_{k \in U} x_k= t_x$. Setting $q_k=x_k^{-1}$, we want to minimize
$$
f(w_k;\ k\in S)=\sum_{k\in S}d_k G(w_k/d_k) x_k,
$$
subject to
$$
\sum_{k\in S}w_k x_k=t_x.
$$
We can derive that
$$
w_k = d_k\frac{t_x}{\sum_{k \in S}d_k x_k}=d_k\frac{t_x}{\hat{t}_{x,\ \pi}}.
$$
In this case, the calibrated total estimator is
$$
\hat{t}_{y,\ C}=\frac{\hat{t}_{y,\ \pi}}{\hat{t}_{x,\pi }}t_x,
$$
which is the so-called *ratio estimator*.

**Example 3** Let $N_M$ and $N_F$ denote the numbers of males and females, respectively, in the population. Assume that $N_M$ and $N_F$ are known. Divide $S$ into $M$ and $F$, where $M$ is the set of males and $F$ is the set of females. We want to minimize
$$
f(w_k; k\in S) = \sum_{k \in M}d_k G(w_k/d_k)q_M + \sum_{k \in F}d_k G(w_k/d_k)q_F,
$$
subject to
$$
\sum_{k \in M}w_k= N_M\ \hbox{and}\ \sum_{k \in F}w_k=N_F.
$$
It's easy to show that
$$
w_k = \left\{
\begin{array}{cl}
d_k\frac{N_M}{\sum_{k \in M}d_k}, & \hbox{if}\ k\in M\\
d_k\frac{N_F}{\sum_{k \in F}d_k}, & \hbox{if}\ k\in F.
\end{array}
\right.
$$
In this case, the calibrated total estimator is
$$
\hat{t}_{y,\ c}=\frac{N_M}{\hat{N}_{M,\ \pi}}\hat{t}_{My,\ \pi} + \frac{N_F}{\hat{N}_{F,\ \pi}}\hat{t}_{Fy,\ \pi},
$$
where
\begin{align}
\hat{N}_{M,\ \pi}&=\sum_{k\in M} d_k,\\
\hat{N}_{F,\ \pi}&=\sum_{k\in F} d_k,\\
\hat{t}_{My,\ \pi}&=\sum_{k \in M}d_k y_k,\\
\hat{t}_{Fy,\ \pi}&=\sum_{k \in F}d_k y_k.
\end{align}
Notice that here we are talking about the so-called *post-stratified estimator*.



**Commonly used distance functions**



<!-- The output files for weighting system should comprise the following -->

<!-- - **weighting_system_main,** which is a table that contains -->
<!-- columns `unit_ID`, `selection_wgt`, `adj_wgt_4_nonresponse` (optional), `final_wgt` and `jk_rep_wgt_1`, ..., `jk_rep_wgt_100`. -->
<!-- - **benchmark tables**  -->

<!-- ## Selection weight -->

<!-- Selection weights are provided at the sampling design stage. The formula is: For unit $i$, its -->
<!-- $$ -->
<!-- \text{SelectionWgt}=\frac{1}{\text{inclusion probability of unit}\ i}. -->
<!-- $$ -->

<!-- ## Reweighting (or weighting adjustment) -->
