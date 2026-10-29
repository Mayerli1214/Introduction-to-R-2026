
library(tidyverse)
library(lessR)
library(BSDA)

ice <- read.csv("ice_storm_data_before_and_after.csv")
head(ice)

pivot(ice, c(IQR, mean, sd), Ice)
pivot(ice, c(IQR, mean, sd), Control)

shapiro.test(ice$Ice)
shapiro.test(ice$Control)

var.test(ice$Control, ice$Ice)

t.test(
  ice$Control, ice$Ice,
  alternative= c("two.side"),
  mu=0,
  paired=T, 
  var.equal=T
)

new_ice <- ice |> 
  pivot_longer(cols= c("Control", "Ice"),
               names_to= "Conditions",
               values_to= "Values")
new_ice
head(ice)
head(new_ice)

ggplot(new_ice, aes(x= Conditions,
                    y= Values)) +
  geom_boxplot()

library(readxl)

cannabis <- read_excel("cannabis.xlsx")
head(cannabis)

install.packages("RVAideMemoire")
library(RVAideMemoire)

byf.shapiro(iq_change~cannabis_dep,
            cannabis)

shapiro.test(filter(cannabis, cannabis_dep == "Adult")$iq_change)
shapiro.test(filter(cannabis, cannabis_dep =="Teen")$iq_change)

var.test(iq_change~cannabis_dep,
         cannabis)

t.test(filter(cannabis, cannabis_dep == "Adult")$iq_change,
       filter(cannabis, cannabis_dep =="Teen")$iq_change,
       alternative = 'two.side',
       paired=F,
       mu=0,
       var.equal=T)
