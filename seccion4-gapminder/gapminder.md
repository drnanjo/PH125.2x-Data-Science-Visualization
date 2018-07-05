### Section 4 Overview

In Section 4, you will look at a case study involving data from the Gapminder Foundation about trends in world health and economics. 

After completing Section 4, you will:

* understand how Hans Rosling and the Gapminder Foundation use effective data visualization to convey data-based trends.
* be able to apply the ggplot2 techniques from the previous section to answer questions using data.
* understand how fixed scales across plots can ease comparisons.
* be able to modify graphs to improve data visualization.

There are 2 assignments that use the DataCamp platform for you to practice your coding skills.

We encourage you to use R to interactively test out your answers and further your learning.


---

#### Section 4: Gapminder   4.1 Introduction to Gapminder   Case Study: Trends in World Health and Economics
In this section, we will
demonstrate how relatively simple ggplot and dplyr
code can create insightful and aesthetically pleasing
plots that help us better understand trends in world health and economics.
We will use many of the techniques we have
learned about data visualization, exploratory data analysis,
and summarization.
We later augment the code somewhat to perfect the plots,
and describe some general principles to guide data visualization.
We're going to be using data from Gapminder.

    gapminder.org

Hans Rosling was the co-founder of the Gapminder Foundation, an organization
dedicated to educating the public by using data
to dispel common myths about the so-called developing world.
The organization uses data to show how actual trends in health and economics
contradict the narratives that emanate from sensationalist media
coverage of catastrophes, tragedies, and other unfortunate events.


As stated in the Gapminder Foundation's website,

> Journalists and lobbyists tell dramatic stories.
That's their job.
They tell stories about extraordinary events and unusual people.
The piles of dramatic stories pile up in people's minds
into an overdramatic worldview and strong negative stress feelings.


> The world is getting worse.

> It's we versus them.

> Other people are strange.

> The population just keeps growing.

> And nobody cares.


Hans Rosling conveyed actual database trends, in a dramatic way of his own,
using effective data visualization.
This section is based on these talks that
exemplify this approach to education.
"New Insights on Poverty" and "The Best Stats You've Ever Seen"
are the title of these talks.

Specifically, in this section, we set out
to answer the following two questions.

* First, is it a fair characterization of today's world
to say that it is divided into a Western rich nations,
and the developing world in Africa, Asia, and Latin America?

* Second, has income inequality across countries
worsened during the last 40 years?


We're going to use data and our code to answer these questions.


---

#### Section 4: Gapminder   4.1 Introduction to Gapminder   Gapminder Dataset

To learn about world health and economics,
we will be using the Gapminder data set provided in the DS Labs library.
This dataset was put together for you, and it
was created using a number of spreadsheets
available from the Gapminder Foundation.
You can access the table using this code.

> library(dslabs)
> data(gapminder)
> head(gapminder)
              country year infant_mortality life_expectancy fertility
1             Albania 1960           115.40           62.87      6.19
2             Algeria 1960           148.20           47.50      7.65
3              Angola 1960           208.00           35.98      7.32
4 Antigua and Barbuda 1960               NA           62.97      4.43
5           Argentina 1960            59.87           65.39      3.11
6             Armenia 1960               NA           66.86      4.55
  population          gdp continent          region
1    1636054           NA    Europe Southern Europe
2   11124892  13828152297    Africa Northern Africa
3    5270844           NA    Africa   Middle Africa
4      54681           NA  Americas       Caribbean
5   20619075 108322326649  Americas   South America
6    1867396           NA      Asia    Western Asia



and we can see that the data includes country, year, and several health
outcomes and economics outcomes.

As done in the New Insights on Poverty video,
we start by testing our knowledge regarding differences in child
mortality across different countries.
To get us started, we're going to take a quiz created
by Hans Rosling in his video New Insights on Poverty,
and we're going to start by testing our knowledge regarding differences
in child mortality across different countries.
So here's a quiz.

* For each of the pairs of countries here, which country
do you think had the highest child mortality in 2015?

* And also, which pairs do you think are most similar?
```
1. Sri Lanka* or Turkey
2. Poland* or South Korea
3. Malaysia or Russia*
4. Pakistan or Vietman*
5. Thailand* of South Africa
```

When answering these questions without data,
the non-European countries are typically picked
as having higher mortality rates, Sri Lanka over Turkey,
South Korea over Poland, and Malaysia over Russia.
It is also common to assume that countries considered
to be part of the developing world, Pakistan, Vietnam, Thailand, and South
Africa, have similarly high mortality rates.

Now let's answer these questions with data.
For example, for this first comparison, we
can write this simple dplyr code to see that Turkey has a higher mortality
rate than Sri Lanka.

    > gapminder %>% 
    +     filter(year == 2015 & country %in% c("Sri Lanka", "Turkey")) %>%
    +     select(country, infant_mortality)
        country infant_mortality
    1 Sri Lanka              8.4
    2    Turkey             11.6

We can use the same code to answer each of the five questions,
and we see that Sri Lanka has a lower mortality rate than Turkey,
South Korea has a lower mortality rate than Poland,
Malaysia has a lower mortality rate than Russia,
and Pakistan is very different from Vietnam,
and South Africa is very different from Thailand.
From here, we see that these comparisons, the European countries
have higher rates.
We also see that the countries from the developing world
can have very different rates.
It turns out that most people do worse than if they were just
guessing, which implies that we're more than ignorant, we're misinformed.



---

####  Section 4: Gapminder   4.1 Introduction to Gapminder   Life Expectancy and Fertility Rates

 Our misconceptions stem from the preconceived notion
that the world is divided into two groups, the Western World, composed
of Western Europe and North America, which
is characterized by long lifespans and small families versus the developing
world, Africa, Asia, and Latin America, characterized
by short lifespans and large families.
But does the data support this dichotomous view of the world?

The necessary data to answer this question
is also available in our gapminder table.
Using our newly-learned data visualization skills,
we will be able to answer this question.
The first plot we make to see what data have to say about this worldview
is a scatterplot of life expectancy versus fertility rates.
Fertility rates are defined as the average number of children per woman.
We will start by looking at data from about 50 years
ago when, perhaps, this worldview was cemented in our minds.
We just type the simple code and we see this plot.

    ds_theme_set()
    filter(gapminder, year == 1962) %>% ggplot(aes(fertility, life_expectancy)) + geom_point()

Note that most points do, in fact, fall into two distinct categories, one
with life expectancies around 70 years and three or less children per family
and the other with life expectancies lower than 65 years
and with more than five children per family.

Now, to confirm that indeed these countries are from the regions
we expect, we can use color to represent continent.
So we change the code slightly by adding the color argument,
assigning continent to it

    filter(gapminder, year == 1962) %>% ggplot(aes(fertility, life_expectancy, color = continent)) + geom_point()

Because continent is a character, it will automatically
assign color to each continent.
Here's the plot.
So indeed, in 1962, the West versus developing worldview
was grounded in some reality, but is this still the case 50 years later?
To answer to this question, we're going to learn about faceting.

---

#### Section 4: Gapminder   4.2 Using the Gapminder Dataset   Faceting

We could easily applaud the 2012
data in the same way we did for 1962.
But for comparison, side by side plots are preferable.
In ggplot, we can achieve this by faceting variables.
We stratify the data by some variable and make the same plot for each strata.

Here we are faceting by the year.
To achieve this, we use a function 

    facet_grid

This is added as a layer which automatically separates the plots.
The function lets you facet by up to two variables
using columns to represent one variable and rows to represent the other.
The function expects the rows and column variables separated by a tilde.


We're going to facet by continent and year.
So continent will be in the rows, and year will be in the columns.

> filter(gapminder, year %in% c(1962, 2012)) %>% ggplot(aes(fertility, life_expectancy, col=continent)) + geom_point() + facet_grid( continent ~ year )

We can see how the data has been stratified.
We have 1962 on the left, 2012 on the right,
and the 5 continents in each row.

However, this is just an example and more than what we want,
which is simply to compare in 1962 and 2012.
In this case, there's just one variable.
So what we do is we use the dot to let the facet function
know that we're not using two variables but just one.
The code looks like this.

> filter(gapminder, year %in% c(1962, 2012)) %>% ggplot(aes(fertility, life_expectancy, col=continent)) + geom_point() + facet_grid( . ~ year )

We simply type facet_grid dot-- meaning we're not using a variable
for the rows--
tilde year which now tells it make two columns--
1962 and 2012.
And here is the plot.
After we split the plot like this, it clearly
shows that the majority of countries have moved from the developing world
cluster to the Western world one.
They went from having large families and short lifespans
to having smaller families and longer lifespans.
In 2012, the Western versus developing world view no longer makes sense.
This is particularly clear when we compare Europe to Asia.

Asia includes several countries that have made great improvements
in the last 40 to 50 years.

To explore how this transformation happened through the years,
we can make the plot for several years.
For example, we can add 1970, 1980, 1990, and 2000 to the plot.
Now, if we do this, we will not want all the plots on the same row.
This is the default behavior of 

    facet_grid()

If we do this, the plots will become too thin,
and we won't be able to see the data.

Instead, we might want to have the plots across different rows and columns.
For this, we can use the 

    facet_wrap()

function which permits us to do this.
It automatically wraps the series of plots
so that most displays has viewable dimensions.

    > years <- c(1962, 1980, 1990, 2000, 2012)
    > continents <- c("Europe", "Asia")
    > gapminder %>% filter(year %in% years & continent %in% continents) %>% ggplot(aes(fertility, life_expectancy, col=continent)) + geom_point() + facet_grid( ~ year )

And then at the end, we `facet_wrap` instead of `facet_grid`.
And now, the plot looks like this.
Now, we're only showing Asia and Europe, but the function clearly
shows us how the Asian countries have made great improvements
throughout the years.

Now, note that the default choice for the range of the axes
is an important one.
When not using facet, this range is determined
by the data shown in the plot.
When using facet, the range is determined
by the data shown in **all plots**.
And therefore, it's kept fixed across the plots.
This makes comparisons across plots much easier.

For example, in the plot we just saw, the life expectancy has increased,
and the fertility has decreased across most countries.
We see this because the cloud of points moves up and to the left.
This is not the case if we adjust the scales to each year separately.

In this case, we have to pay special attention
to the range to notice that the plot on the right has larger life expectancy.

Therefore, by keeping the scales the same,
we were able to quickly see how many of the countries
outside of the Western world have improved
during the last 40 to 50 years.

---

#### Section 4: Gapminder   4.2 Using the Gapminder Dataset   Time Series Plots
