#P2 Probstat E 5025201264

#1a sd

before <- c(78, 75, 67, 77, 70, 72, 28, 74, 77)
after <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

my_data <- data.frame(
  group = rep(c("before", "after"), each = 9),
  saturation = c(before, after))

print(my_data)

#sd

sd_before <- sd(before)
sd_before

sd_after <- sd(after)
sd_after

#1b t (p-value)

t.test(before, after, alternative = "greater", var.equal = FALSE)

#1c 
#alpha = 5%
#H0 : "tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas ????"

var.test(before, after)
t.test(before, after, mu = 0, alternative = "two.sided", var.equal = TRUE)

#2a 
#Apakah Anda setuju dengan klaim tersebut? = Setuju

#2b jelaskan

install.packages("BSDA")
library(BSDA)

tsum.test(mean.x=23500, sd(3900), n.x=100)

# n = 100
# rata-rata = 23500
# sd = 3900
# maka H0 : miu = 20000
# atau
# H1 : miu > 20000

#2c
# readme

#5a plot sederhana

install.packages("multicompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read.csv("GTL.csv")
head(GTL)
str(GTL)

qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)

#5b anova 2 ways

GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

#5c tabel mean dan sd keluaran cahaya

data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean-mean(Light), sd-sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

#5d tukey

tukey <- TukeyH5D(anova)
print(tukey)

#5e compact letter display (uji anova dan uji tukey)
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
