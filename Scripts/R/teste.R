library("tidyverse")
library("rnaturalearthdata")
library("rnaturalearth")
library("sf")
library("ggrepel")

theme_set(theme_bw())

cor_bege <- "#f4f0e1"
cor_azul <- "#c9f2f2"

world <- ne_countries(scale = "large", returnclass = "sf")

coastline <- ne_coastline(scale = "large", returnclass = "sf")

rivers <- ne_download(
  type = "rivers_lake_centerlines",
  category = "physical",
  scale = 10
)["geometry"]

places <- tribble(
  ~name, ~y, ~x, ~fase,
  "Sipylos", 38.597787, 27.499106, "Imperial",
  "NişantaŞ", 40.0149132097, 34.6171576225, "Imperial",
  "Hama", 35.1329746, 36.7488012, "Neo-hitita",
  "Aleppo", 36.1994074125, 37.1628351411, "Imperial",
  "Karabel", 38.360912, 27.368145, "Imperial",
  "İvriz", 37.46307169994504, 34.198906697102316, "Neo-hitita",
  "Yazilikaya", 40.02508824969756, 34.61116236775829, "Imperial",
  "Nineveh", 36.359444, 43.152778, "Imperial",
  "İzmir", 38.42, 27.14, "Imperial",
)

ggplot(data = world) +
  geom_sf(fill = cor_bege, color = cor_bege) +
  geom_sf(data = coastline, lwd = 0.9, alpha = 0.2) +
  geom_sf(
    data = rivers,
    color = cor_azul,
    lwd = 1.5
  ) +
  coord_sf(
    xlim = c(25.5, 45),
    ylim = c(42.5, 34.3),
    expand = FALSE,
    label_axes = c("", "")
  ) +
  geom_jitter(
    data = places,
    aes(x = x, y = y, color = fase),
    size = 5,
    alpha = 0.7
  ) +
  scale_color_manual(
    values = c(
      "#e89275",
      "#035959",
      "blue"
    )
  ) +
  xlab("") +
  ylab("") +
  geom_text_repel(data = places, aes(x = x, y = y, label=name), min.segment.length = 1, seed = 42, box.padding = 0.5) +
  theme(
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.line = element_blank(),
    panel.background = element_rect(fill = cor_azul),
    legend.position = "none",
    plot.margin = grid::unit(c(0, 0, 0, 0), "mm"),
    axis.ticks.length = unit(0, "pt")
  )

ggsave(
  "../../Mídia/Map19.png",
  plot = last_plot(),
  scale = 1,
  width = 1920,
  height = 1085,
  units = "px",
  dpi = 320,
)
