

citatio()
install.packages("ggplot2")
library (ggplot2)

citation ("ggplot2")
?lm


data(penguins)
View(penguins)
head(penguins,20)
tail(penguins,3)

# second column
sec.colum <- penguins[, 2]
sec.colum


mean(penguins$body_mass, na.rm = TRUE)

table(penguins$island)
prop.table(table(penguins$island))

summary(penguins)


fahrenheit_to_celsius <- function(temp_F) {
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
}
fahrenheit_to_celsius(100)


data_storm <- read.csv("storms.csv")
data_storm <- read.csv("storm.csv")

data_storms <- read.csv("storms.csv")
storms <- read.csv("storms.csv")
summary(storms)

# this create a new subset, just hurricanes
hurricane <- storms[storms$status == "hurricane",]
head(hurricane)
View(storms)

# select specific columns
hurricane <- hurricane[, c("name" , "year",
                           "category" , "pressure" , 
                           "wind")]
head(hurricane)

#create a function to classi. wind velocity 
classify_wind <- function(wind){
  if(wind<80){
    "low"
  }else if (wind<110){
    "moderate"
  }else {
    "high"
  }
  
}

hurricane$windclass <- sapply(
  hurricane$wind,
  classify_wind
)

head(hurricane, 20)
table(hurricane$windclass)
