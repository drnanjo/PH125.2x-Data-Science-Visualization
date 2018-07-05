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
