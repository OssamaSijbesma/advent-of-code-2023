input <- readLines("input/day_01.txt")

print(
  input |>
    str_extract_all("\\d") |>
    map_chr(~ paste0(head(.x, 1), tail(.x, 1))) |>
    as.integer() |>
    um()
)