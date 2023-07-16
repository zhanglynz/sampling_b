# Understanding Sample {#sample}

## What is a sample?

The question in the section title is easy to answer: **A sample is a subset of a population.** Now, what is a population? Well, a population is defined in the planning stage of a study and is determined by study objectives.We can visualize a population using the following table:

Member/Item ID | Var$_1$ | Var$_2$ | $\cdots$ | Var$_m$
:---------|:-------|:-------|:----------|:-------
 1        |        |        |           |
 2        |        |        |           |
 $\vdots$ |        |        |           |
 $N$      |        |        |           |

So essentially **a population is a list of members/items with associated characteristic variables that are of interest to the study.** However, when it comes to the fine details in the population concept, things are kind of complicated. Following Lohr (2022), we distinguish three populations, namely, *target population*, *sampling frame population* and *sampled population*; see Figure 1.

![Figure 1: Three-population diagram. (Created by using R with some code borrowed from Peter Ellis, http://freerangestats.info/blog/2015/08/30/starting-in-datascience)](./figs/population_diagram.png) 

Let's have an example.

- Target population: all private dwellings in New Zealand.
- Sampling frame population: address list purchased from New Zealand Post.
- Not eligible for survey: some non-private dwellings, e.g. a prison.
- Not included in sampling frame: some new private dwellings not included in NZ Post system.
- Not reachable: e.g. some private dwellings in certain islands are too costly to be visited


## What is a good sample?

According to Lohr (2010), "A good sample will be representative in the sense that characteristics of interest in the population can be estimated from the sample with a known degree of accuracy." So a good sample should meet the following requirements:

1. No serious over and under *coverage issues*, that is, the sampled population should be sufficiently close to the target population.
1. No serious *selection bias issue*.
1. *Measurement and processing errors* are negligible. 

If the "soup" (a metaphor for the population) is not well mixed before we take a sample from it, then the sample cannot be good. Even if the "soup" is well mixed, selection bias may still happen because of e.g. *biased sampling frame* or *biased response*. By a biased sampling frame, we mean for whatever reasons the sampling frame excludes a subset of the population, resulting discrepancy between it and the target population. That's why we are concerned about coverage issues---under coverage may cause serious selection bias. By *biased response*, we mean the responding sample is not representative. At survey operational level, we monitor *response rate*. If response rate is low, we worry that we may get biased response. If response rate is very low, say 20% or even lower, then the sample is quite likely suffering response bias.

We omit details about measurement/processing errors here and refer readers to Lohr (2010), but we want to emphasize a point: Sampling survey is a very practical thing.


## On sampling error

In the last Section, we mentioned coverage issue, selection bias, measurement and processing issues---these are all in the scope of *non-sampling error*. The flip side of the coin is *sampling error*, which is resulted from difference between a sample and the population in terms of characteristic variables. **Sampling error is unavoidable!** 

Let's have a toy example. The population is shown below.

Unit_ID | $Y$
:-------| :------
  1| 6
  2| 7
  3| 8
  4| 1
  5| 5
  
We can list all the 10 possible samples of size 3 by collecting the ID's:
$$
\{1, 2, 3\}, \ \{1, 2, 4\}, \ \{1, 2, 5\}, \ \{1, 3, 4\}, \ \{1, 3, 5\}
$$
$$
\{1, 4, 5\}, \ \{2, 3, 4\}, \ \{2, 3, 5\}, \ \{2, 4, 5\}, \ \{3, 4, 5\}
$$
The mean of $Y$ (or population mean) is
$$
\mu = \frac{6+7+8+1+5}{5}=\frac{27}{5}.
$$
The 10 sample means are: 7, 14/3, 6, 5, 19/3, 4, 16/3, 20/3, 13/3, and 14/3, respectively. When we use one of the sample means to estimate the population mean, we expect that our estimate is away from the truth---this shows sampling error. 

We often use *mean square error* (MSE) or *standard mean square error* (SMSE) to measure sampling error.
$$
\hbox{MSE}=\hbox{average of}\ (\hat{\theta}-\theta)^2\ \hbox{over all possible samples},
$$
where $\theta$ is the population parameter (e.g. population mean $\mu$) and $\hat{\theta}$ is a sample estimator (e.g. sample mean $\hat{\mu}$).
$$
\hbox{SMSE}=\sqrt{\hbox{MSE}}.
$$
It can be shown that 
$$
\hbox{MSE}= \hbox{var}(\hat{\theta}) + \left(\hbox{bias}(\hat{\theta})\right)^2,
$$
where 
$$
\hbox{var}(\hat{\theta})=\hbox{average of}\ \left(\hat{\theta}-\hbox{avg}(\hat{\theta})\right)^2\ \hbox{over all possible samples}
$$
and
$$
\hbox{bias}(\hat{\theta})=\hbox{avg}(\hat{\theta})-\theta,
$$
in which 
$$
\hbox{avg}(\hat{\theta})=\hbox{average of}\ \hat{\theta}\ \hbox{over all possible samples.}
$$
By the way, if
$$
\hbox{bias}(\hat{\theta})=0
$$
then we say that $\hat{\theta}$ is an **unbiased** estimator.

For the toy example above, 
$$
\hbox{MSE}=\frac{(7-27/5)^2+(14/3-27/5)^2+\cdots+(14/3-27/5)^2}{10}=0.973,
$$
and 
$$
\hbox{SMSE}=\sqrt{\hbox{MSE}}=0.987.
$$

The MSE (or SMSE) is only useful in **theoretical evaluation** of a sampling method. In practice, people are concerned about $\hbox{bias}(\hat{\theta})$ and $\hbox{var}(\hat{\theta})$. So we must have good estimates of $\hbox{bias}(\hat{\theta})$ and $\hbox{var}(\hat{\theta})$. If we have sound reasons to believe that 
$$
\hbox{bias}(\hat{\theta})=0,
$$
then we focus our attention on estimate of $\hbox{var}(\hat{\theta})$. A *confidence interval* can be constructed if $\hat{\theta}$ value and estimate of $\hbox{var}(\hat{\theta})$ are ready.

For the toy example, for each possible sample we calculate
$$
s^2=\frac{1}{n-1}\sum_{i=1}^n (y_i-\bar{y})^2,
$$
where $n=3$, $\{y_1, \ldots, y_n\}$ consists of the sample and $\bar{y}$ is the sample mean (i.e. an observed $\hat{\mu}$).
Let us use 
$$
\sqrt{\left(1-\frac{n}{N}\right)\frac{1}{n}s^2,}
$$
where $N=5$, to estimate $\sqrt{\hbox{var}(\hat{\mu})}$; the estimate is denoted by $\hat{\sigma}$. We set confidence interval using the following formula:
$$
(\hat{\mu} - 3\times \hat{\sigma},\  \hat{\mu} + 3\times \hat{\sigma});
$$
we can find that nine out of the ten resulted confidence intervals do contain the truth $27/5$. 



<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-2)Toy example: 10 possible samples and confidence intervals.</caption>
 <thead>
  <tr>
   <th style="text-align:center;"> y_bar </th>
   <th style="text-align:center;"> s2 </th>
   <th style="text-align:center;"> sigma </th>
   <th style="text-align:center;"> lower_limit </th>
   <th style="text-align:center;"> upper_limit </th>
   <th style="text-align:center;"> indi </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> 4.000000 </td>
   <td style="text-align:center;"> 7.000000 </td>
   <td style="text-align:center;"> 0.9660918 </td>
   <td style="text-align:center;"> 1.1017247 </td>
   <td style="text-align:center;"> 6.898275 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.333333 </td>
   <td style="text-align:center;"> 9.333333 </td>
   <td style="text-align:center;"> 1.1155467 </td>
   <td style="text-align:center;"> 0.9866932 </td>
   <td style="text-align:center;"> 7.679973 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.666667 </td>
   <td style="text-align:center;"> 12.333333 </td>
   <td style="text-align:center;"> 1.2823589 </td>
   <td style="text-align:center;"> 0.8195899 </td>
   <td style="text-align:center;"> 8.513744 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.666667 </td>
   <td style="text-align:center;"> 10.333333 </td>
   <td style="text-align:center;"> 1.1737878 </td>
   <td style="text-align:center;"> 1.1453033 </td>
   <td style="text-align:center;"> 8.188030 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.000000 </td>
   <td style="text-align:center;"> 13.000000 </td>
   <td style="text-align:center;"> 1.3165612 </td>
   <td style="text-align:center;"> 1.0503165 </td>
   <td style="text-align:center;"> 8.949684 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.333333 </td>
   <td style="text-align:center;"> 14.333333 </td>
   <td style="text-align:center;"> 1.3824294 </td>
   <td style="text-align:center;"> 1.1860451 </td>
   <td style="text-align:center;"> 9.480622 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.000000 </td>
   <td style="text-align:center;"> 1.000000 </td>
   <td style="text-align:center;"> 0.3651484 </td>
   <td style="text-align:center;"> 4.9045549 </td>
   <td style="text-align:center;"> 7.095445 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.333333 </td>
   <td style="text-align:center;"> 2.333333 </td>
   <td style="text-align:center;"> 0.5577734 </td>
   <td style="text-align:center;"> 4.6600133 </td>
   <td style="text-align:center;"> 8.006653 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.666667 </td>
   <td style="text-align:center;"> 2.333333 </td>
   <td style="text-align:center;"> 0.5577734 </td>
   <td style="text-align:center;"> 4.9933466 </td>
   <td style="text-align:center;"> 8.339987 </td>
   <td style="text-align:center;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7.000000 </td>
   <td style="text-align:center;"> 1.000000 </td>
   <td style="text-align:center;"> 0.3651484 </td>
   <td style="text-align:center;"> 5.9045549 </td>
   <td style="text-align:center;"> 8.095445 </td>
   <td style="text-align:center;"> 0 </td>
  </tr>
</tbody>
</table>

NB: Here is a quick explanation about "nine out of the ten resulted confidence intervals do contain the truth".

$$
\begin{array}{cl}
& \hbox{Pr}(|\hat{\mu} - \mu| < 3\hat{\sigma})\\
\approx & \hbox{Pr}(|t_2| < 3)\\
= & 0.905\ \hbox{(keeping three decimal places)}
\end{array}
$$
where $t_2$ is a random variable having $t$ distribution with 2 degrees of freedom.

<!-- ## Why take a sample? -->

<!-- A quick answer is: -->

<!-- - We want to save costs (such as money and time). -->
<!-- - In some situations, e.g. *blood testing*, we must take a sample rather than do a **census.** -->
<!-- - "Estimates based on sample surveys are often more accurate than those based on a census because investigators can be more careful when collecting data." (Lohr, 2019) -->
