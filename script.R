#Daniel Pochopien

ama_d <- read.csv("amznd.csv", header = TRUE, sep = ",", dec = ".")
gog_d <- read.csv("googld.csv", header = TRUE, sep = ",", dec = ".")
fb_d  <- read.csv("fbd.csv", header = TRUE, sep = ",", dec = ".")

# Stacjonarnosc
library(urca)
statio_ama<-ur.df(ama_d$Zamkniecie)
statio_ama
summary(statio_ama)
statio_gog<-ur.df(gog_d$Zamkniecie)
statio_gog
summary(statio_gog)
statio_fb<-ur.df(fb_d$Zamkniecie)
statio_fb
summary(statio_fb)
# pierwszy szereg jest niestacjonarny
# drugi jest stacjonarny
# trzeci jest niestacjonarny



#procedura Engle-Grangera
#h0 dwa lub wiecej szeregów czasowych, z których kazdy jest I(1), nie sa skointegrowane.
library(aTSA)

data <- data.frame(ama_d$Zamkniecie, gog_d$Zamkniecie, fb_d$Zamkniecie)

coint.test(data[,1], data[,2])
coint.test(data[,2], data[,1])

coint.test(data[,1], data[,3])
coint.test(data[,3], data[,1])

coint.test(data[,2], data[,3])
coint.test(data[,3], data[,2])

# Test Engle-Grangera nie wykazuje kointegracji dla zadnej z par szeregów (p-value >0.05),
# w przypadku tej procedury ma znaczenie, który szereg pelni role zmiennej objasnianej