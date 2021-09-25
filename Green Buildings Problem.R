library(tidyverse)
library(mosaic)

### Building would be 250,000 square feet ###
### Baseline construction would be $100 million with 5% premium for green certification


### Removed low occupancy buildings because might have "something weird going on with them." 
Notweird = greenbuildings %>% 
  filter(leasing_rate >10)

### Next, they looked at green buildings and non-green buildings separately and checked median rent for both.
NotWeirdRent_for_Green_and_non_Green = Notweird %>% 
  group_by(green_rating) %>% 
  summarize(med_rent = median(Rent),
            avg_rent = mean(Rent))

med_rent_difference = 27.6-25.03

### So, about $2.57/sq ft. more for buildings that had a green rating.

### This difference was multiplied by the square feet to get the marginal revenue per year for green buildings.

med_rent_difference*250000


### Although a little off (probably because 2.57 was rounded to 2.60), the yearly marginal revenue is $650,000.
ClassRentBuildings = Notweird %>%
  group_by(class_a, class_b) %>% 
  summarize(avg_rent = mean(Rent),
            med_rent = mean(Rent))


head(ClassRentBuildings) 


### Now my code, everything above is from the problem given. ###

### Rent increases by $1 when size increases by 2640.793 square feet, see below:
lm1 = lm(Rent~size, data=Notweird)
plot(Rent~size, data =Notweird)
abline(lm1, col="green")
coef(lm1)



### What is the proportion of class a and class b buildings?
GreenClassCount = Notweird %>% 
  group_by(green_rating, Class) %>% 
  summarize(count=n())

ggplot(GreenClassCount) +
  geom_col(aes(y=count, x= Class))+
  labs(x= "Class", y= "Number of Buildings", caption = "0 = Non-Green, 1= Green")+
  facet_wrap(~green_rating)


ggplot(GreenClassCount) +
  geom_col(aes(y=count, x= green_rating))+
  facet_wrap(~class_b)

Notweird = transform(Notweird, newvar=paste
                     (class_a, class_b, sep=""))
Notweird = Notweird %>% mutate(Class=ifelse(
  newvar =='10', 'Class A', ifelse(
    newvar =='01', 'Class B', 'Class C')))


### So total green buildings from above shows there are only 7 green buildings of class c. Therefore,
### class c summary statistics are not representative. We then focus on class a and b buildings that are green,
### and compare the median rates of each class (and whether green or not) to see the difference and if the payout
### will be seen later than, or earlier than 7.7 years as the stats guru mentioned.

### The number of class_a buildings given green is:
546/(7+131+546)

### For class_b, this is:
131/(7+131+546)

### Since the vast majority of green buildings in this data set are class a (~80%) and b (~19%), I am going to focus on these.
### I will determine whether a class a or b building is profitable. (I.E. - which type of building should be built)


### The question and my median rent for class a/b implies that higher class means higher rent, what about for those that are green buildings or not?
ClassRentGreen_and_non_Green = Notweird %>% 
  group_by(class_a, class_b, green_rating) %>% 
  summarize(med_rent = median(Rent),
            avg_rent = mean(Rent))

head(ClassRentGreen_and_non_Green)

### The difference for median green and non green for class a is
28.44-28.2

### The difference for median green and non green for class b is
25.2-24

### The difference for median green and non green for class c is
32-22.11

ggplot(Med_Diff_Rent_W4) +
  geom_point(aes(size=1.0,x=Color, y=Median, color=Color))+
  geom_hline(yintercept = 2.6)+
  labs(title= "Median Differences by Class for Green Buildings",
       y="Median Difference (for Rent)",
       x="Class")

caption ="For classes A and B, we see here that the median differences are lower than 2.6 (as the stats guru concluded). Class C was added but 
       not accounted for given its weak representation. The stats guru's results of a 2.6 median difference for median market rent is given by the horizontal intercept at 2.6")

### Taking the new differences multiplied by the square feet, we get that class A marginal revenue per year = $60,000
### Class B marginal revenue per year = $300,000
### Class C MR/Year = $2,472,500
### These costs would be recuperated in: A(83 years), B(16.7 years), C(2.02 years)

ggplot(Recuperate_Costs) +
  geom_point(aes(size=1.0,x=MR, y=Recup, color=Color)) +
  geom_hline(yintercept = 30)+
  labs(title= "How Long Will it Take to Recuperate Green Costs 
       for Each Type of Class Building?",
       x="Marginal Revenue Per Year",
       y="Years")


caption = "From this graph, we see that the a Class A building would take about 83 years to recuperate costs given $30,000 marginal revenue per year.
       A Class B building would take about 17 years to recuperate costs given $60,000 marginal revenue per year. For Class C (an irrelevant statsic
            given the low amount of green buildings in this class), it would only take about 2 years to recuperate costs given $2,472,500 marginal revenue per year.
       The 30 year mark for the rent of the building is given as an intercept, and therefore the developer should only consider building a Class B building. Class A would
       take far too long to recuperate costs, and there is not sufficient data for Class C buildings to come to a conclusion.")
