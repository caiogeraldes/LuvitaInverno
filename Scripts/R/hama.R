library("tidyverse")
library("rnaturalearthdata")
library("rnaturalearth")
library("sf")
library("ggrepel")

theme_set(theme_bw())

cor_bege <- "#f4f0e1"
cor_azul <- "#c9f2f2"

world <- ne_countries(scale = "large", returnclass = "sf")
syria <- ne_countries(country = "syria", scale = "large", returnclass = "sf")

coastline <- ne_coastline(scale = "large", returnclass = "sf")

rivers <- ne_download(
  type = "rivers_lake_centerlines",
  category = "physical",
  scale = 10
)["geometry"]

places <- tribble(
  ~name, ~y, ~x, ~fase,
  "Hamath", 35.1329746, 36.7488012, "Neo-hitita",
  "Aleppo", 36.1994074125, 37.1628351411, "Imperial",
)

ggplot(data = world) +
  geom_sf(fill = cor_bege, color = cor_bege) +
  geom_sf(data = syria, fill = cor_bege) +
  geom_sf(data = coastline, lwd = 0.9, alpha = 0.2) +
  geom_sf(
    data = rivers,
    color = cor_azul,
    lwd = 1.5,
  ) +
  coord_sf(
    xlim = c(35.5, 42.8),
    ylim = c(32.31304, 37.32491),
    expand = FALSE,
    label_axes = c("", "")
  ) +
  geom_jitter(
    data = places,
    aes(x = x, y = y, color = fase),
    size = 5,
    alpha = 0.7
  ) +
  geom_label_repel(
    data = places,
    aes(x = x, y = y, color = fase, label = name),
    size = 3,
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
  "../../Mídia/Map02.png",
  plot = last_plot(),
  scale = 1,
  width = 1920,
  height = 1085,
  units = "px",
  dpi = 320,
)
