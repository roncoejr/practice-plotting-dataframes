fname <- c('username-', sample(100, 999, 3))

fname = 'username-' + as.string(sample(100:999, 3))

fname  = sprintf('username-%f', rnorm(1))

fname

rounds <- 1:5

for (i in rounds) {
  fname <- sprintf('username%f', rnorm(1))
  lname <-sprintf('lastname%f', rnorm(1))
  agebracket <- sprintf('%f', rnorm(1))
  sprintf('%s, %s, %s', fname, lname, agebracket)
}


library(adbcdrivermanager)

install.packages("libcurl.sc")
install.packages("pak", repos = "https://r-lib.github.io/p/pak/stable/")
pak::pak("apache/arrow-adbc/r/adbcsnowflake")

install.packages("arrow")
install.packages("pkgbuild", pak:::private_lib_dir())

pak::cache_clean()


library(adbcdrivermanager)

uri <- "db15205.east-us-2.azure.snowflakecomputing.com/DEMO_DB/DEMO_SCHEMA?role=SNOW_DEMO"

db <- adbc_database_init(adbcsnowflake::adbcsnowflake(),
                         adbc.snowflake.sql.uri.protocol = 'https',
                         adbc.snowflake.sql.uri.port = 443,
                         adbc.snowflake.sql.account = 'xd34930',
                         adbc.snowflake.sql.region = 'us-east4.gcp',
                         adbc.snowflake.sql.auth_type = 'auth_jwt', 
                         adbc.snowflake.sql.warehouse = 'DEMO_WH',
                         adbc.snowflake.sql.role = 'SNOW_DEMO',
                         adbc.snowflake.sql.db = 'DEMO_DB',
                         adbc.snowflake.sql.schema = 'DEMO_SCHEMA',
                         adbc.snowflake.sql.client_option.jwt_private_key = '/home/ron/.ssh/id_rsa-SNOW-pers.p8',
                         username = 'rcoe_demo'
                         )


db <- adbc_database_init(adbcsnowflake::adbcsnowflake(),
                         adbc.snowflake.sql.account = 'xd34930',
                         adbc.snowflake.sql.region = 'us-east4.gcp',
                         adbc.snowflake.sql.auth_type = 'auth_jwt', 
                         adbc.snowflake.sql.warehouse = 'DEMO_WH',
                         adbc.snowflake.sql.role = 'SNOW_DEMO',
                         adbc.snowflake.sql.db = 'DEMO_DB',
                         adbc.snowflake.sql.schema = 'DEMO_SCHEMA',
                         adbc.snowflake.sql.client_option.jwt_private_key = '/home/ron/.ssh/id_rsa-SNOW-pers.p8',
                         username = 'rcoe_demo'
)


con <- adbc_connection_init(db)

con |> read_adbc("USE WAREHOUSE DEMO_WH")

my_df <- con |> read_adbc("SHOW TABLES") |>
  tibble::as_tibble()

db

tibble::as_tibble()


con |> read_adbc("SELECT * FROM DEMO_TABLE") |> my_df


my_df


my_df$FNAME
