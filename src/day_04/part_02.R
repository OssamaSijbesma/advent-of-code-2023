input <- strsplit(
  gsub("Card +\\d+: +", "", readLines("input/day_04.txt")),
  " \\| "
)

n <- rep.int(1, length(input))

for (k in seq_along(n[-1])) {
  n[k + seq_len(n_mt[k])] <- n[k + seq_len(n_mt[k])] + n[k]
}

print(sum(n))
