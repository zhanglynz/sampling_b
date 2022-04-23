# Understanding Sample {#sample}

## What is a sample?

The question in the title is easy to answer: **A sample is a subset of a population.** Now, what is a population? Well, a population is defined in the planning stage of a study and is determined by study objectives.We can visualize a population using the following table:

Member/Item ID | Var$_1$ | Var$_2$ | $\cdots$ | Var$_m$
:---------|:-------|:-------|:----------|:-------
 1        |        |        |           |
 2        |        |        |           |
 $\vdots$ |        |        |           |
 $N$      |        |        |           |

So essentially **a population is a list of members/items with associated characteristic variables that are of interest to the study.** However, when it comes to the fine details in the population concept, things are kind of complicated. Following Lohr (2019), we distinguish three populations, namely, *target population*, *sampling frame population* and *sampled population*; see Figure 1.

![Figure 1: Three-population diagram. (Created by using R with some code borrowed from Peter Ellis, http://freerangestats.info/blog/2015/08/30/starting-in-datascience)](./figs/population_diagram.png) 

Let's have an example.

- Target population: all private dwellings in New Zealand.
- Sampling frame population: address list purchased from New Zealand Post.
- Not eligible for survey: some non-private dwellings, e.g. a prison.
- Not included in sampling frame: some new private dwellings not included in NZ Post system.
- Not reachable: e.g. some private dwellings in certain islands are too costly to be visited


## What is a good sample?

According to Lohr (2019), "A good sample will be representative in the sense that characteristics of interest in the population can be estimated from the sample with a known degree of accuracy." So a good sample should meet the following requirements:

1. No serious over and under *coverage issues*, that is, the sampled population should sufficiently close to the target population.
1. No serious *selection bias issue*.
1. *Measurement and processing errors* are negligible. 

If the "soup" (a metaphor for the population) is not well mixed before we take a sample from it, then the sample cannot be good. Even if the "soup" is well mixed, selection bias may happen because of e.g. *biased sampling frame* or *biased response*. By a biased sampling frame, we mean for whatever reasons the sampling frame excludes a subset of the population, resulting discrepancy between it and the target population. That's why we are concerned about coverage issues---under coverage may cause serious selection bias. By *biased response*, we mean the responding sample is not representative. At survey operational level, we monitor *response rate*. If response rate is low, we worry that we get biased response. If response rate is very low, say 20% or even lower, then the sample is very likely suffering response bias.

We omit details about measurement/processing errors here and refer readers to Lohr (2019), but we want to emphasize a point: Sampling is a very practical thing.


## On sampling error

In the last Section, we mentioned coverage issue, selection bias, measurement and processing issues---these are all in the scope of *non-sampling error*. The flip side of the coin is *sampling error*, which is resulted from difference between a sample and the population in terms of characteristic variables. **Sampling error is unavoidable!** Let's have a toy example. The population is shown below.

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
The 10 sample means are: 7, 14/3, 6, 5, 19/3, 4, 16/3, 20/3, 13/3, and 14/3, respectively. When we use one of the sample means to estimate the population mean, we expect that our estimate is away from the truth---this shows sampling error. We often use *mean square error* (MSE) or *standard mean square error* (SMSE) to measure sampling error.
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
