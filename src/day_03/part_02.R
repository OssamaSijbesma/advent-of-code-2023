library(tidyverse)

input <- readLines("input/day_03.txt")
amount <- 0

for (x in seq_along(input)) {
  gears <- unlist(gregexpr("[*]", input[x]))

  if (gears[1] == -1) {
    next
  }
  for (gear in gears) {
    numbers <- c()
    gear_range <- c(gear - 1, gear, gear + 1)

    for (row_i in (x - 1):(x + 1)){
      positions <- str_locate_all(input[row_i], "[:digit:]+")[[1]]
      for (i in seq_along(positions[, 1])) {

        if (positions[i, 1] %in% gear_range || positions[i, 2] %in% gear_range) {
          numbers <- append(numbers, as.integer(substr(input[row_i], positions[i, 1], positions[i, 2])))
        }
      }
    }

    if (length(numbers) == 2) {
      print(numbers)
      amount <- amount + prod(numbers)
    }
  }
}

print(amount)
