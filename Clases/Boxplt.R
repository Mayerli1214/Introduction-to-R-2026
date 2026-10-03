library(readxl)

coronary <- read_excel("coronary.xlsx")
head(coronary)

plot(
  coronary$dbp ~ coronary$chol,
  type = "p",
  col = "blue",
  lwd = 2, 
  xlab = "Total Cholesterol (mol/L)",
  ylab = "Diastolic Blood Pressuere (mmHg)",
  main = "Relationship between Cholesterol and Diastolic BP"
)


plot(coronary$dbp ~ coronary$chol,
  col = "blue",
  xlim = c(4,10),
  ylim = c(40,140),
  xlab = "Total Cholesterol (mol/L)",
  ylab = "Diastolic Blood Pressuere (mmHg)",
)

abline(lm(dbp ~ chol, data = coronary),
       col = "red", lwd = 2, lty = 2)

spearman_result <- cor.test(
  coronary$chol,
  coronary$dbp,
  method = "spearman",
  exact = FALSE
)
spearman_result

shapiro.test(coronary$chol)

shapiro.test(coronary$dbp)

hist(coronary$dbp)
hist(coronary$chol)
                         
coronary <- coronary[order(coronary$age), ]
plot(coronary$age, coronary$chol,
     type = "l",
     col = "blue",
     lwd = 2,
     xlab = "Age (years)",
     ylab = "Cholesterol (mol/L)",
     main = "Cholesterol vs Age")

hist(coronary$chol,
     main = "Distribution of Cholesterol",
     xlab = "Cholesterol (mol/L)",
     col = "lightblue",
     border = "white",
)

boxplot(coronary$chol,
        main = "cholesterol Levels",
        ylab = "Cholesterol (mol/L)",
        col = "lightgreen",
        border = "darkgreen"
)