Section 3 introduces you to summarizing with dplyr.

After completing Section 3, you will:

understand the importance of summarizing data in exploratory data analysis.
be able to use the "summarize" verb in dplyr to facilitate summarizing data.
be able to use the "group_by" verb in dplyr to facilitate summarizing data.
be able to access values using the dot placeholder.
be able to use "arrange" to examine data after sorting.
There is 1 assignment that uses the DataCamp platform for you to practice your coding skills.

We encourage you to use R to interactively test out your answers and further your learning.

---

#### Section 3: Summarizing with dplyr   3.1 Summarizing with dplyr   dplyr

An important part of exploratory data analysis
is summarizing data.
We've already learned about the average and the standard deviation, two summary
statistics that provide all the necessary information needed
to summarize data that is normally distributed.
We also learned that better summaries can
be achieved by splitting data into groups before using
the normal approximation.
For example, in our heights dataset, we describe the height of men and women
separately.
In this section, we covered two new dplyr verbs
that make these computations easier, summarize and group_by.
We will also learn to access resulting values using
what we call the dot placeholder.
And finally, we will learn to use a range which
helps us examine data after sorting.
We get started by loading the tidyverse library.

    library(tidyverse)


Once the library is loaded, we're ready to use summarize.
The summarize function in dplyr provides a way
to compute summary statistics with intuitive and readable code.
We start with a simple example based on our heights dataset.

    data(heights)

In our first example, we're going to compute the average
and the standard deviation for males.
So we write this code.

    s <- heights %>% +
    filter(sex == "Male") %>% +
    summarize(average = mean(height), standard_deviation = sd(height))


We first filter to access only the male data.
And then we use the function summarize.
We say average equals the mean of heights and standard_deviation
equals sd of heights.
This gives us the average and the standard deviation.

In this code, we start with our original data table.
We filter to keep only males.
And then we produce a new summarize table
with just the average and the standard deviation of heights.
Note that we get to pick the names of the columns of the resulting table.

Because the resulting table stored in s is a data frame,
we can access the components with the accessor dollar sign,
which in this case will be numeric.

If we type s$average we get the average we just computed.
And if we type s$standard_deviation we get the standard deviation we just
computed.

As with most other dplyr functions, Summarize
is aware of the variable names and we can use them directly.
So when inside the call to summarize function, we write mean of heights.
We don't have to write the data object name.
And this accesses the column with that name.
And then it just computes the average of the respective numeric vector.
Note that we can compute any summary that operates on vectors
and returns a single value.
For example, we can write code that computes the median, the mean
and the max, like this.

    > heights %>% +
    filter(sex == "Male") %>% +
    summarize(median = median(height), minimum = min(height), maximun = max(height))


---

#### Section 3: Summarizing with dplyr   3.1 Summarizing with dplyr   The Dot Placeholder
In this video, we're going
to learn how to make dplyr functions return vectors as opposed to data
frames.
This can be useful sometimes.
We're going to use the US murder data as an example.
Remember our data table includes total murders and population
size for each state, and we have already used dplyr to add a murder rate column.

    > data(murders)
    > murders <- murders %>% mutate(murder_rate = total/population * 100000)
    > summarize(murders, mean(murder_rate))


However, note that the US murder rate is not
the average of the state murder rates.
If you do that, you get 2.78.
This is not the US murder rate, which is closer to 3.

This is because in this computation we're
counting the small states just the same as the large states,
and when we compute the average US murder rate,
it needs to take into account bigger states more than smaller states.
The US murder rate is proportional to the total US murders
divided by the total US population.

So the correct computation is as follows.
We can use Summarize, and now we compute the sum of the total murders,
and we divide by the sum of population, and this gives us the correct US murder
rate, which is 3.03.

    > us_murder_rate <- murders %>% summarize(rate = sum(total) / sum(population) * 100000)
    > us_murder_rate
          rate
    1 3.034555

Now the US murder rate object defined above represents just one number.
So suppose we want to use a function that requires just a numeric value,
we can't use the US murder rate object because it's a data frame.

    > class(us_murder_rate)
    [1] "data.frame"

Most of dplyr functions, including Summarize, always return data frames.
So this might be problematic because, again,
if we want to use the result with a function that requires a numeric value,
we won't be able to do it.
Here we show a useful trick to access value
stored in data that is being piped using the pipe character

The best way to understand what we mean by this is to look at code.
Note, that if we write this piece of code, we get a numeric 3.03.

    > us_murder_rate %>% .$rate
    [1] 3.034555


This returns the value in the rate column of the US murders rate table
making it equivalent to typing US murders rate dollar sign rate.
To understand this line, you just need to think of the dot
as a placeholder for the data that is being passed through the pipe.
Because this data object is a data frame,
we can access it's column using dot dollar sign and then the column name.

To get a number from the original data table with one line of code,
we can type this.

    > us_murder_rate <- murders %>% summarize(rate = sum(total) / sum(population) * 100000) %>% .$rate
    > class(us_murder_rate)
    [1] "numeric"


---

#### Section 3: Summarizing with dplyr   3.1 Summarizing with dplyr   Group By

A very common operation and data exploration
is to first split data into groups and then compute summaries for each group.
For example, we may want to compute the average and standard deviation for men
and women heights separately.
The group underscore by function helps us do this.
Let's look at an example.
If we take heights and we pipe it into the group
by function that is using sex to group it by, we see this table.

    > heights %>% group_by(sex)
    # A tibble: 1,050 x 2
    # Groups:   sex [2]
       sex    height
       <fct>   <dbl>
     1 Male       75
     2 Male       70
     3 Male       68
     4 Male       74
     5 Male       61
     6 Female     65
     7 Female     66
     8 Female     62
     9 Female     66
    10 Male       67
    # ... with 1,040 more rows

Although not immediately obvious from its appearance,
this is now a special data frame called a "group data frame."
And dplyr functions, in particular summarize,
will behave differently when acting on this object.

Conceptually, you can think of this table
as many tables with the same columns but not necessarily the same rows that
are stacked together into one object.

So note what happens when we summarize the data after grouping it?
We write this piece of code where we first group by sex,
and then we summarize asking that we get the mean and the standard deviation.
The result is a table that has the average and the standard deviation
for females and males separately.

    > heights %>% group_by(sex) %>% summarize(average = mean(height), standard_deviation = sd(height))
    # A tibble: 2 x 3
      sex    average standard_deviation
      <fct>    <dbl>              <dbl>
    1 Female    64.9               3.76
    2 Male      69.3               3.61

For another example, let's compute the median murder rate
in the four regions of the country.
We can write this code that looks a lot like the previous one.
We type murders.
We group it by region.
And then we summarize it, asking to get back the median murder rate.

    > murders %>% group_by(region) %>% summarize(median_rate = median(murder_rate))
    # A tibble: 4 x 2
      region        median_rate
      <fct>               <dbl>
    1 Northeast            1.80
    2 South                3.40
    3 North Central        1.97
    4 West                 1.29

---

#### Section 3: Summarizing with dplyr   3.1 Summarizing with dplyr   Sorting Data Tables

 When examining a data set,
it is often convenient to sort the table by different columns.
We know about the order and sort functions.
But for ordering entire tables, the function, arrange in dplyr,
is very useful.
For example, here, we order the states by their population size.
All we have to do is type murders, and then pipe it to the arrange function.
And tell it to sort it by population.


    > murders %>% arrange(population) %>% head()
                     state abb        region population total murder_rate
    1              Wyoming  WY          West     563626     5   0.8871131
    2 District of Columbia  DC         South     601723    99  16.4527532
    3              Vermont  VT     Northeast     625741     2   0.3196211
    4         North Dakota  ND North Central     672591     4   0.5947151
    5               Alaska  AK          West     710231    19   2.6751860
    6         South Dakota  SD North Central     814180     8   0.9825837

Note that we get to decide which column to sort by.
To see the states ordered by murder rate instead of population,
we write almost the exact same code.

    > murders %>% arrange(murder_rate) %>% head()
              state abb        region population total murder_rate
    1       Vermont  VT     Northeast     625741     2   0.3196211
    2 New Hampshire  NH     Northeast    1316470     5   0.3798036
    3        Hawaii  HI          West    1360301     7   0.5145920
    4  North Dakota  ND North Central     672591     4   0.5947151
    5          Iowa  IA North Central    3046355    21   0.6893484
    6         Idaho  ID          West    1567582    12   0.7655102

Except now instead of population, we type murder rate.
And we can see the 6 states with the lowest murder rates:


Note that the default behavior is to sort in ascending order.
In dplyr, the function `desc`
which stands for descending-- transforms a vector to be in descending order.
So, if we instead type the following code,
we get the states ordered by murder rate from highest to lowest.

    > murders %>% arrange(desc(murder_rate)) %>% head()
                     state abb        region population total murder_rate
    1 District of Columbia  DC         South     601723    99   16.452753
    2            Louisiana  LA         South    4533372   351    7.742581
    3             Missouri  MO North Central    5988927   321    5.359892
    4             Maryland  MD         South    5773552   293    5.074866
    5       South Carolina  SC         South    4625364   207    4.475323
    6             Delaware  DE         South     897934    38    4.231937

We can also do nested sorting.
Let's say we're ordering by a column, and there's ties.
We can break the ties with the second column, or a third or a fourth.

In this example, we order by region.
Then within each region, we order by murder rate.

    > murders %>% arrange(region, murder_rate) %>% head()
              state abb    region population total murder_rate
    1       Vermont  VT Northeast     625741     2   0.3196211
    2 New Hampshire  NH Northeast    1316470     5   0.3798036
    3         Maine  ME Northeast    1328361    11   0.8280881
    4  Rhode Island  RI Northeast    1052567    16   1.5200933
    5 Massachusetts  MA Northeast    6547629   118   1.8021791
    6      New York  NY Northeast   19378102   517   2.6679599

Another useful function is the top_n function.
In the code we just seen, we have used the function head
to avoid having the page fill with the entire data table.
It shows us the first 6 rows.

Now, if we want to see a larger proportion of the data--
say the top 10--
we can use the top_n function.

    > murders %>% top_n(10, murder_rate)
                      state abb        region population total murder_rate
    1               Arizona  AZ          West    6392017   232    3.629527
    2              Delaware  DE         South     897934    38    4.231937
    3  District of Columbia  DC         South     601723    99   16.452753
    4               Georgia  GA         South    9920000   376    3.790323
    5             Louisiana  LA         South    4533372   351    7.742581
    6              Maryland  MD         South    5773552   293    5.074866
    7              Michigan  MI North Central    9883640   413    4.178622
    8           Mississippi  MS         South    2967297   120    4.044085
    9              Missouri  MO North Central    5988927   321    5.359892
    10       South Carolina  SC         South    4625364   207    4.475323

However, they are not ordered.
If we want to order, we have to use the arrange function.
So here's how we do it.
We type murders.
We pipe it into a range, which we then use murder rate to order the data.
And then we pipe it into top_n.

    > murders %>% arrange(desc(murder_rate)) %>% top_n(10)
    Selecting by murder_rate
                      state abb        region population total murder_rate
    1  District of Columbia  DC         South     601723    99   16.452753
    2             Louisiana  LA         South    4533372   351    7.742581
    3              Missouri  MO North Central    5988927   321    5.359892
    4              Maryland  MD         South    5773552   293    5.074866
    5        South Carolina  SC         South    4625364   207    4.475323
    6              Delaware  DE         South     897934    38    4.231937
    7              Michigan  MI North Central    9883640   413    4.178622
    8           Mississippi  MS         South    2967297   120    4.044085
    9               Georgia  GA         South    9920000   376    3.790323
    10              Arizona  AZ          West    6392017   232    3.629527

---

#### Section 3: Summarizing with dplyr   3.1 Summarizing with dplyr   Assessment: Summarizing with dplyr

