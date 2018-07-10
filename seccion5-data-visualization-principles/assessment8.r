"Exercise 1: Customizing plots - Pie charts
Pie charts are appropriate:

Possible Answers
When we want to display percentages.
When ggplot2 is not available.
When I am in a bakery.
Never. Barplots and tables are always better. *
"

"Exercise 2. Customizing plots - What's wrong?
What is the problem with this plot?

Possible Answers
The values are wrong. The final vote was 306 to 232.
The axis does not start at 0. Judging by the length, it appears Trump received 3 times as many votes when in fact it was about 30% more. *
The colors should be the same.
Percentages should be shown as a pie chart.
"

"Exercise 3: Customizing plots - What's wrong 2?.
Take a look at the following two plots. They show the same information: rates of measles by state in the United States for 1928.


Possible Answers
Both plots provide the same information, so they are equally good.
The plot on the left is better because it orders the states alphabetically.
The plot on the right is better because it orders the states by disease rate so we can quickly see the states with highest and lowest rates. *
Both plots should be pie charts instead.
"

"Exercise 4: Customizing plots - watch and learn
To make the plot on the right in the previous exercise, we had to reorder the levels of the states' variables.

Redefine the state object so that the levels are re-ordered by rate.
Print the new object state and its levels so you can see that the vector is now re-ordered by the levels."

library(dplyr)
library(ggplot2)
library(dslabs)
dat <- us_contagious_diseases %>%
filter(year == 1967 & disease=="Measles" & !is.na(population)) %>% mutate(rate = count / population * 10000 * 52 / weeks_reporting)
state <- dat$state 
rate <- dat$count/(dat$population/10000)*(52/dat$weeks_reporting)

state <- reorder(state, rate)
print(state)
print(levels(state))


"Exercise 5: Customizing plots - redefining
Now we are going to customize this plot a little more by creating a rate variable and reordering by that variable instead.

Add a single line of code to the definition of the dat table that uses mutate to reorder the states by the rate variable.
The sample code provided will then create a bar plot using the newly defined dat."

library(dplyr)
library(dslabs)
library(gridExtra)
data(us_contagious_diseases)
dat <- us_contagious_diseases %>% filter(year == 1967 & disease=="Measles" & count>0 & !is.na(population)) %>%
  mutate(rate = count / population * 10000 * 52 / weeks_reporting) %>% mutate( state = reorder(state, rate, FUN = mean))
  
dat %>% ggplot(aes(state, rate)) +
  geom_bar(stat="identity") +
  coord_flip()
  
  
  