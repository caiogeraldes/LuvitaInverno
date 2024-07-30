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
  "Ain Dara", 36.4607892161, 36.8531172882, "Imperial",
  "Akpınar", 38.597787, 27.499106, "Imperial",
  "Alacahöyük", 40.2344849906, 34.6952413366, "Imperial",
  "Altınyayla", 39.283695, 36.75576, "Imperial",
  "Beyköy", 39.0461, 30.4661, "Imperial",
  "Boğazköy (Hattuša)", 40.0149132097, 34.6171576225, "Imperial",
  "Çağdın", 37.014722, 37.507778, "Imperial",
  "Çalapverdi", 39.23132976832959, 35.305182130587426, "Imperial",
  "Delihasanlı", 39.9731218507535, 34.51811997015939, "Imperial",
  "Tell Ahmar", 36.7455801, 38.0129509, "Neo-hitita",
  "Hama", 35.1329746, 36.7488012, "Neo-hitita",
  "Restan", 34.960169, 36.735111, "Neo-hitita",
  "Aleppo", 36.1994074125, 37.1628351411, "Imperial",
  "Qal'at el Mudiq", 35.4200558637, 36.3926387447, "Neo-hitita",
  "Meharda", 35.25, 36.583333, "Neo-hitita",
  "Karabel", 38.360912, 27.368145, "Imperial",
  "Torbalı", 38.360912, 27.368145, "Imperial",
  "Latmos", 37.498076, 27.53766, "Imperial",
  "Kocaoğuz", 38.55, 31.166667, "Imperial",
  "Yağrı", 39.387088432240006, 31.890385773124603, "Imperial",
  "Yalburt", 38.45458819830018, 31.978864096772888, "Imperial",
  "Köylütolu", 38.49406451735512, 32.05919126897275, "Imperial",
  "Hatip", 37.77326192503571, 32.40892493169402, "Imperial",
  "Türkmenkarahöyük", 37.66677823167479, 33.03724249207659, "Neo-hitita",
  "Cebelireis", 36.52247827952684, 32.12184714088002, "Neo-hitita",
  "Karadağ", 37.42392639743671, 33.15894978476019, "Neo-hitita",
  "Kızıldağ", 37.4479326339832, 33.18574174864998, "Neo-hitita",
  "Karaören", 38.42173107045832, 34.07278159895122, "Imperial",
  "Emirgazi", 38.076512873687044, 33.865100450375046, "Imperial",
  "Ereğli", 37.79359783111073, 33.83756782722653, "Neo-hitita",
  "İvriz", 37.46307169994504, 34.198906697102316, "Neo-hitita",
  "Malkaya", 39.151966129008585, 33.991364373389814, "Imperial",
  "Yazılıkaya", 40.02508824969756, 34.61116236775829, "Imperial",
  "Ortaköy", 40.25553272334541, 35.23647242100478, "Imperial",
  "Karga", 39.67002342440087, 35.50596275254653, "Imperial",
  "Aksaray", 38.75824394822712, 34.22381502091113, "Neo-hitita",
  "Göstesin", 38.641235001029266, 34.29425604508135, "Neo-hitita",
  "Sivasa", 38.65076193296559, 34.29126157715355, "Neo-hitita",
  "Karaburna", 38.968297654686545, 34.444859647338845, "Neo-hitita",
  "Bozca", 38.76126574995202, 35.00953755414746, "Neo-hitita",
  "Topada", 38.53977203801468, 34.53060444320372, "Neo-hitita",
  "Burunkaya", 38.34185629926001, 34.22768003917503, "Neo-hitita",
  "Göllüdağ", 38.41038032076103, 34.50080817703172, "Neo-hitita",
  "Keşlik", 37.99711201911265, 34.37069602197507, "Neo-hitita",
  "Bor", 38.01592346809227, 34.52471630753709, "Neo-hitita",
  "Porsuk", 37.521266933747725, 34.57936057768102, "Neo-hitita",
  "Bulgarmaden", 37.46313667266507, 34.618773138188445, "Neo-hitita",
  "Niğde", 37.97769250340345, 34.684091043720166, "Neo-hitita",
  "Andaval", 38.02528122745469, 34.76870357844988, "Neo-hitita",
  "Veliisa", 38.06957442496218, 34.661466800364785, "Neo-hitita",
  "Çiftlik", 38.17383740443099, 34.483703947894526, "Neo-hitita",
  "Eğriköy", 38.220278, 35.211667, "Neo-hitita",
  "Kuşçu-Boyacı", 38.95211943731925, 35.50058935269418, "Neo-hitita",
  "Erkilet", 38.82670338696429, 35.45148612833935, "Neo-hitita",
  "Kayseri", 38.7222134194686, 35.47566796885176, "Neo-hitita",
  "Hisarcık", 38.538985543913505, 35.51136212998755, "Neo-hitita",
  "Tekirderbent", 38.53243228512151, 35.446548894162746, "Neo-hitita",
  "Eğrek", 38.669443531958684, 36.03569509851369, "Neo-hitita",
  "Taçın", 38.81759776898178, 36.07456672111879, "Neo-hitita",
  "Sultanhanı", 38.97333346822575, 35.89735699089381, "Neo-hitita",
  "Kululu", 38.97715711664343, 36.14139965364481, "Neo-hitita",
  "Gemerek", 39.185405583967224, 36.072973816451764, "Neo-hitita",
  "Çine", 36.79817145980108, 35.26042442008522, "Neo-hitita",
  "Fraktin", 38.25838847861707, 35.626119192155414, "Imperial",
  "Taşçı", 38.215532416714396, 35.79113204416913, "Imperial",
  "İmamkulu", 38.24722012347235, 35.9288822281569, "Imperial",
  "Hanyeri", 38.2135688754718, 36.014989079042195, "Imperial",
  "Hemite", 37.19630796529733, 36.09802882507683, "Imperial",
  "Sirkeli", 37.003774402442886, 35.74492412737212, "Imperial",
  "Karakuyu", 38.913546913881625, 36.734329320638004, "Imperial",
  "Yesemek", 36.904728319786955, 36.7448983024878, "Imperial",
  "Tell Açana", 36.24066453739513, 36.382123594911555, "Imperial",
  "Tanır", 38.4151726117301, 36.915550629594605, "Neo-hitita",
  "Dokuztay", 38.49394514073685, 36.87214261672092, "Neo-hitita",
  "Palanga", 38.522533883996765, 37.397831325689104, "Neo-hitita",
  "Darende", 38.558180159141344, 37.49046371143666, "Neo-hitita",
  "Gürün", 38.73918511449767, 37.23996602466411, "Neo-hitita",
  "İspekçür", 38.504637683252774, 38.115913775378914, "Neo-hitita",
  "Kötükale", 38.56955343692466, 38.295888618969094, "Neo-hitita",
  "Şırzı", 38.886143123247834, 37.91727179537344, "Neo-hitita",
  "Arslantepe", 38.38119068170015, 38.3608668881729, "Neo-hitita",
  "Karatepe", 37.29621887363731, 36.25243130234871, "Neo-hitita",
  "Domuztepe", 37.199056524783465, 36.26505817606145, "Neo-hitita",
  "Hasanbeyli", 37.131924054738754, 36.554276261431504, "Neo-hitita",
  "Zincirli", 37.102690104159386, 36.67904970148285, "Neo-hitita",
  "Karaburçlu", 37.14378824436219, 36.70016721045827, "Neo-hitita",
  "Hacıbebekli", 37.34619534183616, 36.90834100928197, "Neo-hitita",
  "İsmailli", 37.617189934932604, 36.69366321825683, "Neo-hitita",
  "K.Maraş", 37.57875855363684, 36.925321677501664, "Neo-hitita",
  "İncirli", 37.4637054173819, 37.32233863179457, "Neo-hitita",
  "Boybeypınarı", 37.5537515230641, 37.85966028456804, "Neo-hitita", # no-lint
  "Adıyaman", 37.76400174708526, 38.27711484744468, "Neo-hitita",
  "Ancoz", 37.68728906077255, 38.765133014442625, "Neo-hitita",
  "Samsat", 37.56664619424436, 38.4979340129863, "Neo-hitita",
  "Malpınarı", 37.509885292320824, 38.1517282687249, "Neo-hitita",
  "Gölpınar", 37.28792522523005, 38.8271010935068, "Neo-hitita",
  "Külafi Tepe", 37.373750087014564, 38.86818506608222, "Neo-hitita",
  "Haçgöz", 37.75429612443325, 39.319832506059136, "Neo-hitita",
  "Şekerli", 37.569446282608496, 39.387155693836185, "Neo-hitita",
  "Karkamış", 36.82987291320572, 38.01646051604813, "Neo-hitita",
  "Birecik", 37.02515413179792, 37.97677885050792, "Neo-hitita",
  "Şaraga", 36.86176448441441, 38.02056625072594, "Neo-hitita",
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
  "../../Mídia/Map01.png",
  plot = last_plot(),
  scale = 1,
  width = 1920,
  height = 1085,
  units = "px",
  dpi = 320,
)
