library(ggplot2)
tyre <- read.csv("Clases/tyre.csv")
books <- read.csv("Clases/books.csv")
head(tyre)
View(tyre)
summary(tyre)

head(books)
View(books)

ggplot(data=tyre,
       aes(x=Brands, y=Mileage)) +
  geom_boxplot(aes(fill = Brands))
      
ggplot(data=tyre,
       aes(x=Brands, y=Mileage)) +
  geom_boxplot(aes(color = Brands))


ggplot(data=tyre,
       aes(x=Brands, y=Mileage)) +
  geom_boxplot()

ggplot(data=tyre,
       aes(x=Brands, y=Mileage)) +
  geom_boxplot(aes(fill = Brands)) +
  labs(title= "Marca llantas y cuanto aguantan",
       x= " Marcas Caras",
       y= "Millas"
) +
  theme_classic() +
  theme(legend.position = 'none') 

plot <- ggplot(data=tyre,
      aes(x=Brands, y=Mileage)) +
  geom_boxplot(fill = Colores) +
  labs(title= "Marca llantas y cuanto aguantan",
       x= " Marcas Caras",
       y= "Millas"
  ) +
  theme_bw() +
  theme(legend.position = 'none') +
  theme(
    plot.title = element_text(size = 18, face = "bold", hjust = 0.5),
    axis.title.x = element_text(size = 14, face = "bold"),
    axis.title.y = element_text(size = 14, face = "bold"),
    axis.text.x = element_text(size = 12),
    axis.text.y = element_text(size = 12)
  )

Colores= c("red", "blue", "yellow", "green")

plot
ggsave(
  filename = "Mileage_by_Brand.png",
  plot = plot,
  width = 8, height = 6, dpi = 300)


# Statistical analysis brands-------------------------
summary(tyre)
mod <- aov(Mileage ~Brands, data=tyre)
summary(mod)

resid_anova <- residuals(mod)
shapiro.test(resid_anova)

TukeyHSD(mod)
plot(TukeyHSD(mod))