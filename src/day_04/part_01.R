input <- strsplit(
  gsub("Card +\\d+: +", "", readLines("input/day_04.txt")),
  " \\| "
)

count_cards <- function(x) {
  w_num <- lapply(strsplit(x, " +"), as.integer)
  sum(w_num[[1]] %in% w_num[[2]])
}

n_mt <- sapply(input, count_cards)

print(sum(ifelse(n_mt == 0, 0, 2^(n_mt - 1))))
