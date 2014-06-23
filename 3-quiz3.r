# Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last). What is the 13th country in the resulting data frame? 

mergeddata=as.data.frame(merge(gdpclean,edu,by.x="X",by.y="CountryCode"))
mergeddata$Gross.domestic.product.2012 = as.numeric(as.character(mergeddata$Gross.domestic.product.2012))


# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
tapply(mergedData$Gross.domestic.product.2012, mergedData$Income.Group, mean)

# Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP?
quantile(mergeddata$Gross.domestic.product.2012,probs=c(0.2,0.4,0.6,0.8,1))
install.packages("Hmisc")
library(Hmisc)
mergeddata$gdp=cut2(mergeddata$Gross.domestic.product.2012,g=5)
table(mergeddata$Income.Group,mergeddata$gdp)
