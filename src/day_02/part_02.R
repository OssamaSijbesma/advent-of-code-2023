input <- readLines("input/day_02.txt") %>%
  tibble(id = .) |>
  separate_wider_delim(cols = id, delim = ":", names = c("id", "games")) |>
  separate_longer_delim(games, ";") |>
  separate_longer_delim(games, ",") |>
  mutate(
    id = str_extract(id, "\\d+") %>% as.integer(),
    games = str_squish(games)
  ) |>
  separate_wider_delim(cols = games, delim = " ", names = c("result", "colour")) |>
  mutate(result = as.integer(result)) %>%
  summarise(.by = c(id, colour), max_result = max(result)) %>%
  pivot_wider(id_cols = id, names_from = colour, values_from = max_result)

print(input %>% summarize(sum(blue * red * green)))
