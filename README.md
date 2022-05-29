# P2_Probstat_E_5025201264
Praktikum 2 Probstat E 5025201264

1a. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas

```
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
```

1b. carilah nilai t (p-value)

```
t.test(before, after, alternative = "greater", var.equal = FALSE)
```

1c. tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

```
var.test(before, after)
t.test(before, after, mu = 0, alternative = "two.sided", var.equal = TRUE)
```

2a. Apakah Anda setuju dengan klaim tersebut?

![image](https://user-images.githubusercontent.com/80830860/170877507-83536b77-1996-4081-b466-2269e2de91f7.png)

2b. Jelaskan maksud dari output yang dihasilkan!

```
tsum.test(mean.x=23500, sd(3900), n.x=100)
```
![image](https://user-images.githubusercontent.com/80830860/170877572-da49f762-723d-4b78-bc9f-3794f10d78e5.png)

n = 100, rata-rata = 23500, sd = 3900
maka H0 : miu = 20000
atau
H1 : miu > 20000

2c. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!

![2c](https://user-images.githubusercontent.com/80830860/170877789-51ced499-6a0e-43f2-9df3-e838dd3e5e00.png)
![2cc](https://user-images.githubusercontent.com/80830860/170877792-d187e78b-3814-4f9b-a42a-db6ae851974e.png)

dari nilai z yang dihasilkan serta p-value yang didapat, dapat disimpulkan bahwa jarak yang ditempuh mobil rata-rata merupakan 20000 km per tahun. 

5a. Buatlah plot sederhana untuk visualisasi data

```
qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)
```

5b. Lakukan uji ANOVA dua arah

```
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```

5c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

```
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean-mean(Light), sd-sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```

5d. Lakukan uji Tukey

```
tukey <- TukeyH5D(anova)
print(tukey)
```

5e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

```
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
```
