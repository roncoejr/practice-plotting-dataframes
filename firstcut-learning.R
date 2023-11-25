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

install.packages("libcurl.sc") install.packages("pak", repos =
"<https://r-lib.github.io/p/pak/stable/>")
pak::pak("apache/arrow-adbc/r/adbcsnowflake")

install.packages("arrow") install.packages("pkgbuild",
pak:::private_lib_dir())

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

install.packages("dotenv") library(dotenv)

Sys.getenv("cert")

library(adbcdrivermanager)

db \<- adbc_database_init(adbcsnowflake::adbcsnowflake(),
adbc.snowflake.sql.account = 'xd34930', adbc.snowflake.sql.region =
'us-east4.gcp', adbc.snowflake.sql.auth_type = 'auth_jwt',
adbc.snowflake.sql.warehouse = 'DEMO_WH', adbc.snowflake.sql.role =
'SNOW_DEMO', adbc.snowflake.sql.db = 'DEMO_DB',
adbc.snowflake.sql.schema = 'DEMO_SCHEMA',
adbc.snowflake.sql.client_option.jwt_private_key = Sys.getenv("cert"),
username = 'rcoe_demo' )

con \<- adbc_connection_init(db)

con \|\> read_adbc("USE WAREHOUSE DEMO_WH")

my_df \<- con \|\> read_adbc("SHOW TABLES") \|\> tibble::as_tibble()

tnames_df \<- con \|\> read_adbc("SELECT "name" FROM
TABLE(RESULT_SCAN())") \|\> tibble::as_tibble()

consumptionsample_df \<- con \|\> read_adbc("SELECT \* FROM
CONSUMPTION_SAMPLE_V1") \|\> tibble::as_tibble()

.name_repair

my_df\$FNAME

texcelfile_df

texcelfile_df\$THE_MEASURE

# install.packages("tidyverse")

library(tidyverse) library(ggplot2)

dataset \<- data.frame( independent = c('2023-01-20', '2023-02-22',
'2023-03-10', '2023-04-10'), the_data = c(3, 10, 100, 150), the_data2 =
(7, 6, 9, 1), treatment = c(1, 2, 3, 4) )

dataset %\>% ggplot(aes(independent, the_data, colour = treatment))+
geom_point(size=3, alpha = 0.8)+ geom_smooth(method = lm)+ labs(title =
"A Test Graph of a Simple DataFrame", x = "Date Range", y = "Deal
Value")+ theme_bw()

# 

# 

# Query a Snowflake Table and populate an R dataframe for analysis

# 

consumptionsample_df \<- con \|\> read_adbc("SELECT \* FROM
CONSUMPTION_SAMPLE_V1") \|\> tibble::as_tibble()

consumptionsample_df %\>% ggplot(aes(USAGEDATE, CREDITSCONSUMED, colour
= CREDITSCONSUMED))+ geom_point(size = 3, alpha = 0.8)+
geom_smooth(method = lm)+ labs(title = "Sample Consumption Visualizer",
x = "Year over Year", y = "Credits Consumed")

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
cons_df %>% ggplot(aes(x = USAGEDATE, y = cost_per_query_value, color = use_month))+ geom_point()+ geom_smooth()+ labs(title = "Consumption by Months", x = "Years", y = "Credit Consumption")
```

```         
```

| Col1 | Col2 | Col3 |
|------|------|------|
|      |      |      |
|      |      |      |
|      |      |      |
