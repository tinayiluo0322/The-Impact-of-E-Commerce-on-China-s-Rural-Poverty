getwd()

rm(list = ls())

setwd("~/Dropbox/IRHonors_2021-2022/Luopeiwen Yi/Taobao data file/Taobao.R")

#read merged data for year 2014, 2016 and 2021
installed.packages(readr)
library(readr)
m <- merged_data_of_all_provinces_2014_2016_2021_Sheet1 <- read_csv("~/Downloads/merged data of all provinces(2014, 2016, 2021) - Sheet1.csv")
View(m)

library(stargazer)
install.packages("sandwich")
install.packages("lmtest")
install.packages("coeftest")
library(sandwich)
library(lmtest)
library(dplyr)
### Summary statistics table ##
summary(m$percentage_taobaovillages, digits = 2)
round(sd(m$percentage_taobaovillages, na.rm = T),2)

summary(m$per.capita_GDP, digits = 2)
round(sd(m$per.capita_GDP, na.rm = T),2)

summary(m$percentage_secondindustry, digits = 2)
round(sd(m$percentage_secondindustry, na.rm = T),2)

summary(m$Population, digits = 2)
round(sd(m$Population, na.rm = T),2)

#The impact of %Taobao villages on per-capita GDP controlling county and year fixed effect (2014, 2016, 2021)
model1<- lm(per.capita_GDP~ percentage_taobaovillages + factor(county) + factor(year), data = m)
model1a <- coeftest(model1, vcov = vcovCL,type = "HC1", cluster = ~county)
stargazer(model1, model1a, omit = c("county", "year"), type = text)

#The impact of %Taobao villages on log per-capita GDP controlling county and year fixed effect (2014, 2016, 2021)
model2<- lm(log(per.capita_GDP)~ percentage_taobaovillages + factor(county) + factor(year), data = m)
model2a <- coeftest(model2, vcov = vcovCL,type = "HC1", cluster = ~county)
stargazer(model2, model2a, omit = c("county", "year"), type = text)

nobs(model1a)
nobs(model2a)
nobs(model3a)
nobs(model4a)
nobs(model5a)
nobs(model6a)
nobs(model7a)
nobs(model8a)

#The impact of %Taobao villages on per-capita GDP controlling county and year fixed effect in addition to population(2014, 2016, 2021)
model3<-lm(per.capita_GDP~ percentage_taobaovillages + Population + factor(county) + factor(year), data = m)
model3a <- coeftest(model3, vcov = vcovCL,type = "HC1", cluster = ~county)
stargazer(model3, model3a, omit = c("county", "year"), type = text)

#The impact of %Taobao villages on log per-capita GDP controlling county and year fixed effect in addition to population(2014, 2016, 2021)
model4<-lm(log(per.capita_GDP)~ percentage_taobaovillages + log(Population) + factor(county) + factor(year), data = m)
model4a <- coeftest(model4, vcov = vcovCL,type = "HC1", cluster = ~county)
stargazer(model4, model4a, omit = c("county", "year"), type = text)

#The impact of %Taobao villages on %second indsutry controlling county and year fixed effect(2014, 2016, 2021)
model5<- lm(percentage_secondindustry~ percentage_taobaovillages + factor(county) + factor(year), data = m)
model5a <- coeftest(model5, vcov = vcovCL,type = "HC1", cluster = ~county)
stargazer(model5, model5a, omit = c("county", "year"), type = text)

#The impact of %Taobao villages on %second indsutry controlling county and year fixed effect in addition to population (2014, 2016, 2021)
model6<- lm(percentage_secondindustry~ percentage_taobaovillages + log(Population)+ factor(county) + factor(year), data = m)
model6a <- coeftest(model6, vcov = vcovCL,type = "HC1", cluster = ~county)
stargazer(model6, model6a, omit = c("county", "year"), type = text)

#Stargazer for model1,2,3,4
library(stargazer)
stargazer(model1a,model2a,model3a,model4a,model5a,model6a,digits = 2,omit = c("county", "year"), type = "text")

#read merged data for year 2014 and 2021
library(readr)
s <- read_csv("~/Downloads/2 year merged data for all provinces (2014, 2021) - Sheet1 (1).csv")
View(s)

#The impact of %Taobao villages on per-capita GDP controlling county and year fixed effect (2014, 2021)
s1<- lm(per.capita_GDP~ percentage_taobaovillages + factor(county) + factor(year), data = s)
s1a <- coeftest(s1, vcov = vcovCL,type = "HC1", cluster = ~county)

s1log<- lm(log(per.capita_GDP)~ percentage_taobaovillages + factor(county) + factor(year), data = s)
s1alog <- coeftest(s1log, vcov = vcovCL,type = "HC1", cluster = ~county)

#The impact of %Taobao villages on per-capita GDP controlling county and year fixed effect in addition to population(2014,2021)
s2<-lm(per.capita_GDP~ percentage_taobaovillages + Population + factor(county) + factor(year), data = s)
s2a <- coeftest(s2, vcov = vcovCL,type = "HC1", cluster = ~county)

s2log<-lm(log(per.capita_GDP)~ percentage_taobaovillages + log(Population) + factor(county) + factor(year), data = s)
s2alog <- coeftest(s2log, vcov = vcovCL,type = "HC1", cluster = ~county)

#The impact of %Taobao villages on %second indsutry controlling county and year fixed effect(2014,2021)
s3<- lm(percentage_secondindustry~ percentage_taobaovillages + factor(county) + factor(year), data = s)
s3a <- coeftest(s3, vcov = vcovCL,type = "HC1", cluster = ~county)

#The impact of %Taobao villages on %second indsutry controlling county and year fixed effect in addition to population (2014, 2021)
s4<- lm(percentage_secondindustry~ percentage_taobaovillages + log(Population)+ factor(county) + factor(year), data = s)
s4a <- coeftest(s4, vcov = vcovCL,type = "HC1", cluster = ~county)

#Stargazer for model5,6,7,8
library(stargazer)
stargazer(s1a,s1alog,s2a,s2alog,s3a,s4a,digits = 2,omit = c("county", "year"), type = "text")

nobs(s1a)
nobs(s1alog)
nobs(s2a)
nobs(s2alog)
nobs(s3a)
nobs(s4a)

nobs(model8a)

# insert impoversihed counties data (2014 2021)
a <- read_csv("~/Downloads/poor counties merged data 2014 and 2021 - Sheet1.csv")

#The impact of %Taobao villages on per-capita GDP controlling county and year fixed effect (impoverished counties 2014, 2021)
modela1<- lm(per.capita_GDP~ percentage_taobaovillages + factor(county) + factor(year), data = a)
modela12 <- coeftest(modela1, vcov = vcovCL,type = "HC1", cluster = ~county)

#The impact of %Taobao villages on log per-capita GDP controlling county and year fixed effect (impoverished counties 2014, 2021)
modela1log<- lm(log(per.capita_GDP)~ percentage_taobaovillages + factor(county) + factor(year), data = a)
modela1log2 <- coeftest(modela1log, vcov = vcovCL,type = "HC1", cluster = ~county)

#The impact of %Taobao villages on per-capita GDP controlling county and year fixed effect in addition to population(2014, 2016, 2021)
modela2<-lm(per.capita_GDP~ percentage_taobaovillages + Population + factor(county) + factor(year), data = a)
modela22 <- coeftest(modela2, vcov = vcovCL,type = "HC1", cluster = ~county)

#The impact of %Taobao villages on log per-capita GDP controlling county and year fixed effect in addition to population(2014, 2016, 2021)
modela2log<-lm(log(per.capita_GDP)~ percentage_taobaovillages + log(Population) + factor(county) + factor(year), data = a)
modela2log2 <- coeftest(modela2log, vcov = vcovCL,type = "HC1", cluster = ~county)

#The impact of %Taobao villages on %second indsutry controlling county and year fixed effect(2014,2021)
aindsutry<- lm(percentage_secondindustry~ percentage_taobaovillages + factor(county) + factor(year), data = a)
aindsutry2 <- coeftest(aindsutry, vcov = vcovCL,type = "HC1", cluster = ~county)

#The impact of %Taobao villages on %second indsutry controlling county and year fixed effect in addition to population (2014, 2021)
aindsutrypop<- lm(percentage_secondindustry~ percentage_taobaovillages + log(Population)+ factor(county) + factor(year), data = a)
aindsutrypop2 <- coeftest(aindsutrypop, vcov = vcovCL,type = "HC1", cluster = ~county)

stargazer(modela12, modela1log2,modela22, modela2log2, aindsutry2,aindsutrypop2, digits = 2,omit = c("county", "year"), type = "text")

nobs(modela12)
nobs(modela1log2)
nobs(modela22)
nobs(modela2log2)
nobs(aindsutry2)
nobs(aindsutrypop2)

summary(a$percentage_taobaovillages, digits = 2)
round(sd(a$percentage_taobaovillages, na.rm = T),2)

summary(a$per.capita_GDP, digits = 2)
round(sd(a$per.capita_GDP, na.rm = T),2)

summary(a$percentage_secondindustry, digits = 2)
round(sd(a$percentage_secondindustry, na.rm = T),2)

summary(a$Population, digits = 2)
round(sd(a$Population, na.rm = T),2)

# insert richer counties data (2014 2021)
b <- read_csv("~/Downloads/Richer counties merged data  - Sheet1.csv")

#The impact of %Taobao villages on per-capita GDP controlling county and year fixed effect (impoverished counties 2014, 2021)
modelb1<- lm(per.capita_GDP~ percentage_taobaovillages + factor(county) + factor(year), data = b)
modelb12 <- coeftest(modelb1, vcov = vcovCL,type = "HC1", cluster = ~county)

#The impact of %Taobao villages on log per-capita GDP controlling county and year fixed effect (impoverished counties 2014, 2021)
modelb1log<- lm(log(per.capita_GDP)~ percentage_taobaovillages + factor(county) + factor(year), data = b)
modelb1log2 <- coeftest(modelb1log, vcov = vcovCL,type = "HC1", cluster = ~county)

#The impact of %Taobao villages on per-capita GDP controlling county and year fixed effect in addition to population(2014, 2016, 2021)
modelb2<-lm(per.capita_GDP~ percentage_taobaovillages + Population + factor(county) + factor(year), data = b)
modelb22 <- coeftest(modelb2, vcov = vcovCL,type = "HC1", cluster = ~county)

#The impact of %Taobao villages on log per-capita GDP controlling county and year fixed effect in addition to population(2014, 2016, 2021)
modelb2log<-lm(log(per.capita_GDP)~ percentage_taobaovillages + log(Population) + factor(county) + factor(year), data = b)
modelb2log2 <- coeftest(modelb2log, vcov = vcovCL,type = "HC1", cluster = ~county)

#The impact of %Taobao villages on %second indsutry controlling county and year fixed effect(2014,2021)
bindsutry<- lm(percentage_secondindustry~ percentage_taobaovillages + factor(county) + factor(year), data = b)
bindsutry2 <- coeftest(bindsutry, vcov = vcovCL,type = "HC1", cluster = ~county)

#The impact of %Taobao villages on %second indsutry controlling county and year fixed effect in addition to population (2014, 2021)
bindsutrypop<- lm(percentage_secondindustry~ percentage_taobaovillages + log(Population)+ factor(county) + factor(year), data = b)
bindsutrypop2 <- coeftest(bindsutrypop, vcov = vcovCL,type = "HC1", cluster = ~county)

stargazer(modelb12, modelb1log2,modelb22, modelb2log2, bindsutry2,bindsutrypop2, digits = 2,omit = c("county", "year"), type = "text")

nobs(modelb12)
nobs(modelb1log2)
nobs(modelb22)
nobs(modelb2log2)
nobs(bindsutry2)
nobs(bindsutrypop2)

summary(b$percentage_taobaovillages, digits = 2)
round(sd(b$percentage_taobaovillages, na.rm = T),2)

summary(b$per.capita_GDP, digits = 2)
round(sd(b$per.capita_GDP, na.rm = T),2)

summary(b$percentage_secondindustry, digits = 2)
round(sd(b$percentage_secondindustry, na.rm = T),2)

summary(b$Population, digits = 2)
round(sd(b$Population, na.rm = T),2)



