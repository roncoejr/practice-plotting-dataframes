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
  filter((`Item Name` == "Big Mac") |
           (str_detect(`Item Name`, ".*French Fries") | 
              (str_detect(`Item Name`, ".*Nugg.*"))
            | (str_detect(`Item Name`, ".*Filet O.*")) |
              (str_detect(`Item Name`, ".*Apple Pie.*"))))

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

m_bigm_over_time_df %>%
  ggplot(aes(x = the_year, y = `Item Price`))+
  geom_point(size = 3, alpha = 0.3, aes(colour = `Item Name`))+
  labs(title="Price of McDonald's Menu Items Over Time",
                                                               subtitle = "Illustration of a Weakening US Dollar",
                                                               x = "Years",
                                                               y = "Cost (USD)")



```

```{r}
ggsave('the-entire-meal.png')

getwd()
```

```{r}
m_bigm_over_time_df %>%
  ggplot(aes(x = the_year, y = `Item Price`))+
  geom_line(size = 3, alpha = 0.3, aes(colour = `Item Name`))+
  labs(title="Price of McDonald's Menu Items Over Time",
                                                               subtitle = "Illustration of a Weakening US Dollar",
                                                               x = "Years",
                                                               y = "Cost (USD)")
```

```{r}
ggsave('all-meal-items-line-graph.png')
```
