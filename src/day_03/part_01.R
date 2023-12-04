library(tidyverse)

input <- readLines("input/day_03.txt")
amount <- 0

for (x in seq_along(input)) {
  locations <- str_locate_all(input[x], "[:digit:]+")[[1]]
  numbers <- str_extract_all(input[x], "[:digit:]+")

  for (i in seq_along(locations[, 1])) {
    start <- locations[i, 1] - 1
    stop <- locations[i, 2] + 1

    string <- paste(
      substr(input[x - 1], start, stop),
      substr(input[x], start, stop),
      substr(input[x + 1], start, stop),
      sep = ""
    )

    if (str_detect(string, "[^\\d\\.NA]")) {
      amount <- amount + as.integer(numbers[[1]][i])
    }
  }
}

print(amount)
