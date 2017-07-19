library(tidyr)
library(ggmap)

#Input addresses (source: https://spotcrime.com/or/hillsboro)
addresses <- c("11100 BLOCK SW ELLIGSEN WY, Hillsboro, OR",
"16300 BLOCK NW AVAMERE CT, Hillsboro, OR",
"6000 BLOCK SW HEIGHTS LN, Hillsboro, OR",
"4700 BLOCK SW GREENSBORO WY, Hillsboro, OR",
"9800 BLOCK SW SPRING CREST DR, Hillsboro, OR",
"19100 BLOCK NW PHILLIPS RD, Hillsboro, OR",
"600 BLOCK N 14TH AV, Hillsboro, OR",
"1700 BLOCK NW CHRISTINE CT, Hillsboro, OR",
"2800 BLOCK SW 185TH AV, Hillsboro, OR",
"19000 BLOCK SW FARMINGTON RD, Hillsboro, OR",
"46700 BLOCK NW CLAPSHAW HILL RD, Hillsboro, OR",
"18500 BLOCK SW KINNAMAN RD, Hillsboro, OR",
"17700 BLOCK NW SPRINGVILLE RD, Hillsboro, OR",
"1500 BLOCK SW 172ND TE, Hillsboro, OR",
"18300 BLOCK SW KINNAMAN RD, Hillsboro, OR",
"4700 BLOCK SW 77TH AV, Hillsboro, OR",
"20800 BLOCK SW WRIGHT ST, Hillsboro, OR",
"100 BLOCK S 26TH CT, Hillsboro, OR")

#geocode addresses to get lat/lon
coded_addresses <- geocode(addresses)

#plot map
qmplot(lon, lat, data=coded_addresses, 
       maptype="toner-lite", color = I("red")) +
  labs(title = "Burglary CFS Hillsboro June/July")

#plot density of robberies
qmplot(lon, lat, data=coded_addresses, 
       maptype="toner-lite") +
  stat_density_2d(aes(fill=..level..), geom = "polygon", 
                  alpha = .5, color = NA) + 
  scale_fill_gradient("Density of Burglaries", low = "yellow", high = "red") +
  labs(title = "Burglary Density Plot")
