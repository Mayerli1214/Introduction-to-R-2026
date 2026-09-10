


# this is my initial code
14 + 14

20 * 4
3 + 5
50 * 7 
50 * 7

greet <- function(name) {
  message <- paste("Hello,", name)
  return (message)
}

greet(name="Mayerli")


tom <- c(2,3,4,5,6)
jerry <- c(2,3,4,5,6)

tom + jerry
 
c <- (tom+jerry)
c

# creating a list in R with various
my_list <- list(
  numbers = c(1,2,3), # A numeric vector
  words = c("rojo", "blanco", "negro")) # A character vector
)  
my_list

getwd()

getwd()


install.packages("palmerpenguins")
install.packages("ggplot2")

library(palmerpenguins)
library(ggplot2)

ggplot(data = penguins, aes(x = flipper_length_mm, 
                            y = body_mass_g)) +
  geom_point(aes(color = species, shape = species))
data(penguins)
View(penguins)
