library("dplyr")

head(starwars)

View(starwars)
starwars |> 
  filter(species == "Droid")

# Row
only_droids <-  starwars |> 
  filter(species == "Droid")
only_droids

filter <- starwars |> 
  filter(skin_color == "light", 
         eye_color =="brown")

filter (starwars, skin_color == "light" &
          eye_color == "brown")

starwars |> 
  arrange(height)
starwars |> 
  arrange(desc(height))



col <- starwars |> 
  select(hair_color,
         skin_color,
         eye_color)
col
  
# select all columns except those from hair_
except <- starwars |> 
  select(!(name))
except

another <- starwars |> 
  select(-height)
another


starwars |> 
  select(contains('w'))


new_s <- starwars |> 
  mutate(mass_new = mass * 1000)

new_s

new_s |> 
  select(mass_new, mass, everything())

new_s2 <- starwars |> 
  mutate(mass_new2 =mass / 10, 
         .keep="none")
new_s2


library(dplyr)

n_s <- starwars |> 
  mutate(new_height = ifelse(height > 100,
                            "tall",
                            "small")) |> 
  select(height, new_height, everything())
n_s

library(ggplot2)
starwars |> 
  mutate(new_height = ifelse(height > 100,
                             "tall",
                             "small")) |> 
  ggplot(aes(x=height,
             fill = new_height)) +
  geom_histogram()

# basic stats--------------------------------------
starwars |> 
  summarize(mean_height = 
              mean(height, na.rm=T))


starwars |> 
  group_by(species) |> 
  summarize(
    mean_height = mean(height, na.rem = TRUE),
    sd_height = sd(height, na.rm = TRUE)
  )

n_s |> 
  group_by(new_height) |> 
  summarise(
    mean_height = mean(height, na.rm=T),
    sd_height = sd(height, na.rm=T)
  )

n_s |> 
  group_by(new_height, homeworld) |> 
  summarise(
    mean_height = mean(height, na.rm=T))

n_s |> 
  group_by(new_height) |> 
    count(homeworld)


install.packages("tidyverse")
  