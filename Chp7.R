# Chp 7 Tibbles with Tibble
# February 2018

## libraries
library(tidyverse)

## creating tibbles
### coerce a data.frame into a tibble
iris <- as_tibble(iris)

### create a new tibble from vectors
tibble(
  x = 1:5,
  y = 1,
  z = x ^ 2 + y
)

### set column names
tb <- tibble(
  `:)` = "smile",
  ` ` = "space",
  `2000` = "number"
)
tb

### tribble "transposed tibble"
tribble(
  ~x, ~y, ~z,
  #--/--/----
  "a", 2, 3.6,
  "b", 1, 8.5
)

### printing
tibble(
  a = lubridate::now() + runif(1e3) * 86400,
  b = lubridate::today() + runif(1e3) * 30,
  c = 1:1e3,
  d = runif(1e3),
  e = sample(letters, 1e3, replace = TRUE)
) # the tibble is printing its type

### look at the data view
nycflights13::flights %>%
  View()

### subsetting
df <- tibble(
  x = runif(5),
  y = rnorm(5)
)

#### extract by name
df$x
df[["x"]]

#### extract by position
df[[1]]

#### using with pipe. Notice the special placeholder (.)
df %>% .$x

### turning back to a data frame
class(as.data.frame(tb))


### Exercises 

#### 1) How can you tell a tibble?
# tibbles list variable type (unlike data.frame) and limit data printed in 
# console

#### 2) Compare following operations on data.frame and tibble
# data.frame
df <- data.frame(abc = 1, xyz = "a")
df$x
df[, "xyz"]
df[, c("abc", "xyz")]

# now as tibble
df_tibble <- data.frame(abe = 1, xyz = "a")
df_tibble$x
df_tibble[, "xyz"]
df_tibble[, c("abc", "xyz")]

#### 4) Practice referring to nonsyntactic names
annoying <- tibble(
  `1` = 1:10,
  `2` = `1` * 2 + rnorm(length(`1`))
)
annoying

# Extracting variable called 1
annoying$`1`
# Plotting a scatterplot of 1 versus 2
ggplot(data = annoying, mapping = aes(`1`, `2`)) +
  geom_point()
# Create a new column, 3, which is 2 / 1
annoying <- annoying %>%
  mutate(
    `3` = `2` / `1`
  )
annoying
# rename columns to one two three
annoying <- annoying %>%
  rename(
    one = `1`,
    two = `2`,
    three = `3`
  )
annoying

#### what does tibble::enframe() do?
# converts atomic vectors or lists to two-column data frames

#### What option controls how many additional column names are printed at the 
#### footer of a tibble?
# tibble.print

