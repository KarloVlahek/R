library(tidyverse)
library(mosaic)

lm1 = lm(creatclear~age, data=creatinine)
plot(creatclear~age, data =creatinine)
abline(lm1, col="green")


lm2 = lm(age~poly(creatclear,2), data =creatinine)
plotModel(lm2)

fitted(lm1)

#So if someone is 55, based on the lm1 fitted line, the expected creatinine 
# clearance rate is 113.72304



coef(lm1)
#Creatinine clearance rate decreases by 0.62 mL/minute per 1 unit increase in age.


predicted_data = data.frame(age = c(40,60))
predict(lm1, predicted_data)
# 135 - 123.0203 = 11.9797
# 112 - 110.6240 = 1.376
# The residual is smaller for the individual who is 60 years old, but as prefaced in the question,
# higher creatinine levels are better. Therefore, the 40 year old has a better rate. 

#
ggplot(s550) +
  geom_point(aes(x=mileage, y=price)) +
  facet_wrap(~year) +
  theme(aspect.ratio = 1/3) +
  labs(title = "Mercedes S-Class S550's offered for Sale",
       x = "Mileage",
       y= "Price (USD)") +
  scale_y_continuous(labels=function(n){format(n, scientific = FALSE)})

#

###Plot-A###
bikeshare1 = bikeshare %>%
  group_by(hr) %>%
  summarize(total=mean(cnt))

ggplot(bikeshare1) +
  geom_line(aes(y = total, x = hr)) +
  labs(title = "Average Bike Rentals per hour of the Day",
       x = "Hour",
       y= "Total Bike Rentals",
       caption = "The line graph displays total bike rentals grouped by the hour of the day. It can be said that bike rentals increase during the mornings and afternoons, most likely due to the working day.")

###Plot-B###
bikeshare2 = bikeshare %>%
  group_by(hr, workingday) %>%
  summarize(total=mean(cnt))

ggplot(bikeshare2) +
  geom_line(aes(y = total, x = hr))+
  facet_wrap(~workingday)+
  labs(title = "How are (Average) Bike Rentals effected per hour if it is a Working Day or not?",
       x = "Hour",
       y= "Total Bike Rentals",
       caption = "These graphs show the total bike rentals given the hour of the day during weekends (left) and weekdays (right). 
  On working days, bike rentals peak at around noon. 
  On non-working days, there are two major spikes in bike rentals, one in the morning and one in the afternoon. These may correspond to the hours of leaving to and coming from work.
  Additionally, it can be said that the majority of bike rentals occur during the working days due to the faceted (working day) graph showing the same spikes (around the same hours) as the graph from plot A.")

###Plot-C###
bikeshare8am = bikeshare %>%
  filter(hr ==8) %>%
  group_by(weathersit, workingday) %>%
  summarize(total=mean(cnt))

ggplot(bikeshare8am) +
  geom_col(aes(y=total, x=weathersit, fill=as.factor(weathersit)))+
  facet_wrap(~workingday) +
  labs(y= "Weather Situation",
       x= "Total Bike Rentals",
       caption = "This graph shows how weather conditions (as the explanatory variable) affect total bike rentals (the response variable) during non-working days (left facet)
                  and working days (right facet). We can see that, overall, bike rentals are greater during working days despite weather conditions as people need to go to work,
       and may not have an easier, faster mode of transportation.") +
  scale_fill_discrete(name= "Weather Conditions",
                      labels=c("Clear,Few clouds, Partly  cloud",
                               "Mist + Cloudy, Mist+Broken clouds, Mist+Few clouds, Mist",
                               "Light  Snow, Light  Rain+Thunderstorm+Scattered clouds, Light Rain+Scattered clouds"))

