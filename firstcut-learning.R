---
editor_options: 
  markdown: 
    wrap: 72
---

fname \<- c('username-', sample(100, 999, 3))

fname = 'username-' + as.string(sample(100:999, 3))

fname = sprintf('username-%f', rnorm(1))

fname

rounds \<- 1:5

for (i in rounds) { fname \<- sprintf('username%f', rnorm(1)) lname
\<-sprintf('lastname%f', rnorm(1)) agebracket \<- sprintf('%f',
rnorm(1)) sprintf('%s, %s, %s', fname, lname, agebracket) }

library(adbcdrivermanager)

install.packages("libcurl.sc")

install.packages("pak", repos =
"<https://r-lib.github.io/p/pak/stable/>")

pak::pak("apache/arrow-adbc/r/adbcsnowflake")

install.packages("arrow")

install.packages("pkgbuild", pak:::private_lib_dir())

pak::cache_clean()

library(adbcdrivermanager)

uri \<-
"db15205.east-us-2.azure.snowflakecomputing.com/DEMO_DB/DEMO_SCHEMA?role=SNOW_DEMO"

db \<- adbc_database_init(adbcsnowflake::adbcsnowflake(),
adbc.snowflake.sql.uri.protocol = 'https', adbc.snowflake.sql.uri.port =
443, adbc.snowflake.sql.account = 'xd34930', adbc.snowflake.sql.region =
'us-east4.gcp', adbc.snowflake.sql.auth_type = 'auth_jwt',
adbc.snowflake.sql.warehouse = 'DEMO_WH', adbc.snowflake.sql.role =
'SNOW_DEMO', adbc.snowflake.sql.db = 'DEMO_DB',
adbc.snowflake.sql.schema = 'DEMO_SCHEMA',
adbc.snowflake.sql.client_option.jwt_private_key =
'/home/ron/.ssh/id_rsa-SNOW-pers.p8', username = 'rcoe_demo' )

db \<- adbc_database_init(adbcsnowflake::adbcsnowflake(),
adbc.snowflake.sql.account = 'xd34930', adbc.snowflake.sql.region =
'us-east4.gcp', adbc.snowflake.sql.auth_type = 'auth_jwt',
adbc.snowflake.sql.warehouse = 'DEMO_WH', adbc.snowflake.sql.role =
'SNOW_DEMO', adbc.snowflake.sql.db = 'DEMO_DB',
adbc.snowflake.sql.schema = 'DEMO_SCHEMA',
adbc.snowflake.sql.client_option.jwt_private_key =
'/home/ron/.ssh/id_rsa-SNOW-pers.p8', username = 'rcoe_demo' )

con \<- adbc_connection_init(db)

con \|\> read_adbc("USE WAREHOUSE DEMO_WH")

my_df \<- con \|\> read_adbc("SHOW TABLES") \|\> tibble::as_tibble()

db

tibble::as_tibble()

con \|\> read_adbc("SELECT \* FROM DEMO_TABLE") \|\> my_df

Sys.getwd() getwd()
setwd("/home/ron/\_dev/practice-plotting-dataframes")

my_df

install.packages("dotenv")

library(dotenv)

```{r}
library(dotenv)

getwd()
Sys.getenv("cert")

Sys.getenv('snow_account')
```

Sys.getenv("cert")

# Do our Database Authentication and Get a Connection

```{r}
library(adbcdrivermanager)

db <- adbc_database_init(adbcsnowflake::adbcsnowflake(), adbc.snowflake.sql.account = Sys.getenv("snow_account"), adbc.snowflake.sql.region = Sys.getenv("snow_region"), adbc.snowflake.sql.auth_type = 'auth_jwt', adbc.snowflake.sql.warehouse = 'DEMO_WH', adbc.snowflake.sql.role = 'SNOW_DEMO', adbc.snowflake.sql.db = 'DEMO_DB', adbc.snowflake.sql.schema = 'DEMO_SCHEMA', adbc.snowflake.sql.client_option.jwt_private_key = Sys.getenv("cert"), username = 'rcoe_demo' )

con <- adbc_connection_init(db)

con |> read_adbc("USE WAREHOUSE DEMO_WH")

my_df <- con |> read_adbc("SHOW TABLES") |> tibble::as_tibble()

df_schemas <- con |> read_adbc("SHOW SCHEMAS") |> tibble::as_tibble()

consumptionsample_df <- con |> read_adbc("SELECT * FROM CONSUMPTION_SAMPLE_V1") |> tibble::as_tibble()

consumptionsample_df
```

.name_repair

```{r}
my_df$FNAME

texcelfile_df

texcelfile_df$THE_MEASURE
```

# Load our Libraries and Create a DataFrame

```{r}
library(tidyverse)

library(ggplot2)

dataset <- data.frame( independent = c('2023-01-20', '2023-02-22', '2023-03-10', '2023-04-10'))
                       
the_data = c(3, 10, 100, 150)
the_data2 = c(7, 6, 9, 1)
treatment = c(1, 2, 3, 4)

dataset %>% ggplot(aes(independent, the_data, colour = treatment))+ geom_point(size=3, alpha = 0.8, fill = "transparent")+ geom_smooth(method = lm)+ labs(title = "A Test Graph of a Simple DataFrame", x = "Date Range", y = "Deal Value")+ theme_bw()+theme(rect = element_rect(fill = "transparent"))

ggsave('testplot1.svg', bg = "transparent")
```

```{r}
install.packages('svglite')
```

```{r}
ggsave('testplot.svg')
```

# 

# Query a Snowflake Table and populate an R dataframe for analysis

# 

```{r}
consumptionsample_df <- con |> read_adbc("SELECT * FROM CONSUMPTION_SAMPLE_V1") |> tibble::as_tibble()

consumptionsample_df %>% ggplot(aes(USAGEDATE, CREDITSCONSUMED, colour = CREDITSCONSUMED))+ geom_point(size = 3, alpha = 0.8)+ geom_smooth(method = lm)+ labs(title = "Sample Consumption Visualizer", x = "Year over Year", y = "Credits Consumed")
```

```{r}
cons_df <- consumptionsample_df %>% mutate(use_month = month(USAGEDATE)) %>% mutate(use_year = year(USAGEDATE)) %>% mutate(cost_per_query_value = gsub("$", "", COSTPERQUERY)) %>% mutate(cost_per_query_value = as.double(cost_per_query_value)) %>% select(USAGEDATE, use_month, use_year, cost_per_query_value)

```

?gsub

```{r}
cons_df <- consumptionsample_df %>% mutate(use_month = month(USAGEDATE)) %>% mutate(use_year = year(USAGEDATE)) %>% mutate(cost_per_query_value = gsub("\$", "", COSTPERQUERY)) %>% mutate(cost_per_query_value = as.double(cost_per_query_value)) %>% select(USAGEDATE, use_month, use_year, cost_per_query_value)

names(cons_df)

cons_df

summary(cons_df)

install.packages("gt") library("gt")

cons_df %>% gt()
```

```{r}
cons_df %>% ggplot(aes(x = USAGEDATE, y = cost_per_query_value, color = use_month))+ geom_point(alpha = 0.9)+ geom_smooth()+ labs(title = "Consumption by Months", x = "Years", y = "Credit Consumption")+facet_wrap(~use_month)
```

```{r}
cons_df  %>%  ggplot(aes(x = USAGEDATE, y = cost_per_query_value, color = use_month))+ geom_point()+ geom_smooth()+ labs(title = "Consumption by Months", x = "Years", y = "Credit Consumption")+facet_wrap(~use_month)
```

```         
```

|     | Col2 | Col3 |
|-----|------|------|
|     |      |      |
|     |      |      |
|     |      |      |

```{r}
a <- read_csv('~/Downloads/2022/eats_order_details.csv')
b <- read_csv('~/Downloads/2023/eats_order_details.csv')

ue_df <- rbind(a, b)
```

```{r}
names(ue_df)
```

```{r}
bigm_df <- ue_df %>% 
  filter(`Item Name` == "Big Mac")
```

```{r}
names(bigm_df)
```

```{r}
bigm_df
```

```{r}
substr(bigm_df[4], 4, 22)
```

```{r}
new_big_mac <- bigm_df %>% mutate(actual_date = ymd_hms(substr(bigm_df[,4], 4, 22)))

```

```{r}
new_big_mac <- bigm_df %>% mutate(actual_date = ymd_hms(`Order Time`))
```

```{r}
bigm_df$actual_date <- with(bigm_df, ymd_hms(paste(substr(bigm_df[,4], 4, 22))))
```

```{r}
new_big_mac
```

```{r}
m_bigmac <- bigm_df %>%
  mutate(the_date = ymd_hms(`Order Time`)) %>%
  mutate(the_month = month(the_date)) %>%
  mutate(the_year = year(the_date)) %>% 
  select (4, 6, 9, the_date, the_month, the_year)
```

```{r}
m_bigmac
```

```{r}
m_bigm_over_time_df <- m_bigmac %>% 
  select(`Item Name`, `Item Price`, the_date, the_year)

```

```{r}
m_bigm_over_time_df %>%
  ggplot(aes(x = the_year, y = `Item Price`), fill = `Item Price`)+
  geom_point(size=3, alpha = 0.9, fill="red")+geom_line()+labs(title="Price of McDonald's Big Mac Over Time",
                                                               subtitle = "Illustration of a Weakening US Dollar",
                                                               x = "Years",
                                                               y = "Cost")
```

```{r}
ggsave('price-of-big-mac.png', bg="transparent")
```

```{r}
{r}
?read_csv
```

```{r}
?ymd_hms
```
