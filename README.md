# R
In the first problem, I observe simple linear models of creatinine clearance rates (a measure of kidney health) and age.
In the second, I observe sample of 1501 Mercedes S-Class S550 cars offered for sale in the U.S. viacars.com. I use ggplot to make a scatterplot of price versus  mileage (x), faceted by year.
Finally, I observe bike-sharing systems in Washington D.C. to visualize some simple relationships among the vast amount of data available.


On a separate R script (GreenBuildingsProblem.R), I observe conclusions drawn by an imaginary individual and interpret whether their course of action was a viable analysis. The premise was: A real-estate developer was interested in the possible economic impact of "going green" in their latest project: a new 15-story mixed-use building on East Cesar Chavez, just across I-35 from downtown. Will investing in a green building be worth it, from an economic perspective? The baseline construction costs are $100 million, with a 5% expected premium for green certification. 
  More on my course of action (i.e. - how I decided to solve this potential dilemma) is represented below:
  - Grouping by class and green rating, we see there are smaller differences in median for Class A and B, but not C. I was curious about the proportion of Class       A, B, and C buildings.
  - I count each building by class given they are green buildings. This yields that the majority of green buildings in this data set are Class A (~80%) and B           (~19%). The total green buildings count shows there are only 7 green buildings of Class C. Thus, I chose to focus on the other classes. I look at the difference      and see if the payout is later than, or earlier than 7.7 year (as the imaginary analyst suggested).
  - I calculate the differences between green and non-green median rent for each class building. 
    For Class A: $0.24 (Not much of a difference at all, and less than the $2.60 calculated by the imaginary analyst).
    For Class B: $1.20 (Still less than $2.60)
    For Class C: $9.89 (This is a huge difference from $2.60, but I chose to exclude this due to the small size of Class C green buildings, it is not a                 representative count).
  - Taking the new differences multiplied by the square feet, we get: 
      Class A: Marginal Revenue per Year = $60,000
      Class B: Marginal Revenue per Year = $300,000
      Class C: Marginal Revenue per Year = $2,472,500

  - These costs would be recuperated in (by dividing by $5,000,000, or the green premium): 
      Class A: 83.33 Years (Much longer than the imaginary analyst’s expected recuperation)
      Class B: 16.67 years (A little more than double the imaginary analyst’s expected recuperation)
      Class C: 2.02 Years (Much less than the imaginary analyst’s expected recuperation, but I conclude this irrelevant)

  - I find that a Class A building would take about 83 years to recuperate costs given $30,000 marginal revenue per year. A Class B building would take about 17     years to recuperate costs given $60,000 marginal revenue per year. For Class C (an irrelevant statistic, given the low number of green buildings in this         class), it would only take about 2 years to recuperate costs given $2,472,500 marginal revenue per year. The 30-year mark for receiving rent of the building     space is given as an intercept, and therefore the developer should only consider building a Class B building to see profit after about the 17th year. Class A     would take far too long to recuperate costs, and there is not sufficient data for Class C buildings to conclude.


Kudos to Dr. James Scott for the sets!
