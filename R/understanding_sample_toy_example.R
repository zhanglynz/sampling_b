# toy example in Chapter Understanding Sample
library(tidyverse)
library(knitr)
library(kableExtra)

frame <- data.frame(ID = 1:5,
                    y = c(6:8, 1, 5))

Y_bar <- mean(frame$y)

all_samples <- 
  gtools::combinations(n = 5, r = 3, v = frame$y) %>% 
  as.data.frame() %>% 
  rowwise() %>% 
  mutate(y_bar = mean(c_across(V1:V3)),
         s2 = var(c_across(V1:V3))) %>% 
  ungroup() %>% 
  mutate(sigma = sqrt((1 - 3/5) * (1/3) * s2)) %>% 
  mutate(LL = y_bar - 3 * sigma,
         UL = y_bar + 3 * sigma) %>% 
  mutate(indi = ifelse((Y_bar - LL) * (UL - Y_bar) > 0, 1, 0)) %>% 
  rename(lower_limit = LL,
         upper_limit = UL)

the_re <- 
  all_samples %>% 
  select(y_bar:indi)