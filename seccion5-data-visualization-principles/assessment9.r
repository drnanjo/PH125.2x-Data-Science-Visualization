"Exercise 1: Showing the data and customizing plots
Say we are interested in comparing gun homicide rates across regions of the US. We see this plot:

library(dplyr)
library(ggplot2)
library(dslabs)
data("murders")
murders %>% mutate(rate = total/population*100000) %>%
  group_by(region) %>%
  summarize(avg = mean(rate)) %>%
  mutate(region = factor(region)) %>%
  ggplot(aes(region, avg)) +
  geom_bar(stat="identity") +
  ylab("Murder Rate Average")
and decide to move to a state in the western region. What is the main problem with this interpretaion?


Possible Answers
* The categories are ordered alphabetically.
* The graph does not show standard errors.
* It does not show all the data. We do not see the variability within a region and it's possible 
  that the safest states are not in the West. *
* The Northeast has the lowest average.
"

"Exercise 2: Making a box plot
To further investigate whether moving to the western region is a wise decision, let's make a box 
plot of murder rates by region, showing all points.

* Make a box plot of the murder rates by region.
* Order the regions by their median murder rate.
* Show all of the points on the box plot."

library(dplyr)
library(ggplot2)
library(dslabs)
data("murders")
murders %>% mutate(rate = total/population*100000) %>% 
            mutate(region = reorder(region, rate)) %>%
            ggplot() + 
            geom_boxplot(aes(region, rate)) + 
            geom_point(aes(region, rate))
            