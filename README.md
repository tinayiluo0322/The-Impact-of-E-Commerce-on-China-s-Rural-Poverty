# The Impact of E-Commerce on China's Rural Poverty 
This is the R code for my senior honor research paper “The Impact of E-Commerce on China’s Rural Poverty”. This paper investigates the impact of E-Commerce on China’s rural poverty using Taobao villages as a measurement of rural E-commerce development. 

The source code for this research can be found with: 

https://github.com/Tinayiluo/The-Impact-of-E-Commerce-on-China-s-Rural-Poverty.git

My main research design is a two-way fixed effect panel data regression. I analyze the change of poverty over time in counties with Taobao villages compared to counties without Taobao villages. I use two samples of time. The first sample includes observations of 2014, 2016 and 2021. The second sample includes observations of 2014 and 2021. During 2014 and 2021, significant changes on Taobao villages and GDP per-capita occurred. Using samples from these two years show the medium run effect. Adding samples from 2016 would calculate both the short run effects between 2015 and 2016 and short run effects between 2016 and 2021 besides the medium run effect. I also analyze the change of poverty over time in relatively poorer counties with Taobao villages compared to relatively richer counties with Taobao villages. I use two samples. The first one includes observations with GDP per-capita below the medium GDP per capita in 2014. The second one includes observations with GDP per-capita above the medium GDP per capita in 2014.

The county and year two-way fixed effects help to control unobserved time invariant county specific variables. It helps to eliminate some selection bias that exists in naive comparison. For instance, the counties with Taobao villages may already have better infrastructure and higher per-capita GDP before they even have Taobao villages. As a result, they may have less poverty than counties without Taobao villages due to factors other than E-commerce. Using two-way fixed effects enables me to focus on change of per-capita GDP in the same county. 

My main regression model: 

Yct=α + β1Taobaoct + β2 Pct + 𝛾c + 𝛾t +e

Yct: Outcome variables. GDP per capita for county c in year t / Share of secondary industry in GDP for county c in year t.

Taobaoct: %  of Taobao villages for county c in year t

Pct:  Population for county c in year t

α: constant or intercept

β1: intercept, the impact of 1% increase of Taobao villages on county level GDP per capita/share of secondary industry in GDP 

β2 : intercept, the impact of 1% increase of population on county level GDP per capita/share of secondary industry in GDP 

c: county

t: year

𝛾c: county fixed effect 

𝛾t:  year fixed effect

e: error term

The regression model analyzes the effect of Taobao villages on county level per-capita GDP or the share of secondary industry in GDP controlling county and year fixed effect and population. 

Considering village-level data are lacking in China, I use county level data in my research. In this research, my treatment variable is the % of Taobao villages at county level. My outcome variable is regional poverty at county level. My unit of analysis is county. 

For my treatment data, I get Taobao village yearly entrance from Ali Annual Research Report on China Taobao Villages (2014-2021) and the complete provinces and counties list from China’s National Administration Statistics. Using these two data sources, I calculate the yearly % of Taobao villages for each county from 2014 to 2021. Noticeably, “Taobao village” is not a policy treatment but a result of both spontaneous and government supported rural E-Commerce development. Becoming a Taobao village does not necessarily mean the village is being specifically targeted by government policy or company program to become a Taobao village. Taobao village is used only as a measurement method in this paper.

For my outcome data, I get the per capita GDP on counties level and % of secondary industries in GDP on counties level from China County Statistical YearBook and National Bureau of Statistics (2014-2021). Per-capita GDP demonstrates economic performances and is a measure of average living standards. It indicates the regional poverty level. Secondary industry is a mechanism to help us understand how local economic activities and structures are transformed. 
