---
title: "Untitled"
author: "Ron Coe Jr"
date: "`r Sys.Date()`"
output: html_document
---

```{r}

library(dotenv)
library(tidyverse)
library(dotenv)
```

```{r}

a <- read_csv('~/Downloads/2022/eats_order_details.csv')
b <- read_csv('~/Downloads/2023/eats_order_details.csv')

ue_df <- rbind(a, b)
```

```{r}
names(ue_df)

ue_df
```

```{r}
library(dplyr)
library(stringr)
bigm_df <- ue_df %>% 
  filter((`Item Name` == "Big Mac") | (str_detect(`Item Name`, ".*French Fries")))

new_big_mac <- bigm_df %>% mutate(actual_date = ymd_hms(`Order Time`))
```

```{r}

m_bigmac <- bigm_df %>%
  mutate(the_date = ymd_hms(`Order Time`)) %>%
  mutate(the_month = month(the_date)) %>%
  mutate(the_year = year(the_date)) %>% 
  select (4, 6, 9, the_date, the_month, the_year)
```

```{r}
m_bigm_over_time_df <- m_bigmac %>% 
  select(`Item Name`, `Item Price`, the_date, the_year)
library(gt)

m_bigm_over_time_df %>% gt()
```

```{r}
names(m_bigm_over_time_df)

m_mutated <- m_bigm_over_time_df %>%
  mutate(f_fries = case_when(str_detect(`Item Name`, ".*French Fries") ~ 'French Fries')) %>%
  mutate(f_bigm = case_when(`Item Name` == 'Big Mac' ~ 'Big Mac')) %>%
  select(everything())

m_mutated

m_mutated %>%
  ggplot(aes(x = the_year, y = `Item Price`))+
  geom_point(size = 3, alpha = 0.5, aes(colour = `Item Name`))+
  labs(title="Price of McDonald's Big Mac and French Fries Over Time",
                                                               subtitle = "Illustration of a Weakening US Dollar",
                                                               x = "Years",
                                                               y = "Cost")



```

```{r}
ggsave('big-mac-and-french-fries.png')

getwd()
```
