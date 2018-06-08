## Section 1 Overview

Section 1 introduces you to Data Visualization and Distributions.

After completing Section 1, you will:

* understand the importance of data visualization for communicating data-driven findings.
* be able to use distributions to summarize data.
* be able to use the average and the standard deviation to understand the normal distribution.
* be able to assess how well a normal distribution fits the data using a quantile-quantile plot.
* be able to interpret data from a boxplot.
* There are 4 assignments that use the DataCamp platform for you to practice your coding skills.

We encourage you to use R to interactively test out your answers and further your learning.

---

#### Section 1: Introduction to Data Visualization and Distributions  > 1.1 Introduction to Data Visualization  > Introduction to Data Visualization

[Introduction to Data Visualization](https://youtu.be/nBDQJ4moaNY)

Exploratory Data Analysis

John Tukey, considered the father of exploratory data analysis once said:

> The greatest value of a picture is when it forces us to notice what we never expected to see.

Exploratory data analysis is perhaps the most important part of data analysis, yet 
it is often overlooked.

One example comes from **GAPminder** and the talks, **New Insights on Poverty**
and **the Best Stats You've Ever Seen**, here Hans Roslingsforced us to notice 
the unexpected with a series of plots related to world health and economics.

Is also important to note that **mistakes**, **biases**, **systematic errors** 
and **other unexpected problems** often lead to data should be handled with care.

Failure to discover these problems often leads to flawed analyzes
and false discoveries.

We will use the **ggplot2** package to code.



> RAFAEL IRIZARRY: Looking at the numbers and character strings at the
> final dataset is really useful. To convince yourself, print and stare
> at the US murders data table. You can do this with this code. What do
> you learn from staring at this table? How quickly can you determine
> which states have the largest populations? Which states have the
> smallest? How large is a typical state? Is there a relationship
> between population size and total murders? How do the murder rates
> vary across regions of the country? For most human brains, it is quite
> difficult to extract this information just from looking at the
> numbers. In contrast, the answer to all of these questions are readily
> available from examining this plot. We are reminded of the saying, "A
> picture is worth a thousand words." Data visualization provides a
> powerful way to communicate a data driven finding. In some cases, the
> visualization is so convincing that no follow up analysis is required.
> The growing availability of informative data sets and software tools
> has lead to increased reliance on data of visualization across many
> industries, academia, and government. A visible example are news
> organizations that are increasingly embracing data journalism and
> including effective info-graphics and charts as part of their
> reporting. A particularly effective example is a Wall Street Journal
> article showing data related to the impact of vaccines on battling
> infectious diseases. One of the graphs shows measles cases by US state
> through the years with a vertical line demonstrating when the vaccine
> was introduced. Another striking example comes from the New York
> Times. This article showed data on scores from the New York City
> regents exam. These scores are collected for several reasons,
> including to determine if a student graduates from high school. In New
> York City, you need a 65 to pass. The distribution of the test scores
> forces us to notice something somewhat problematic. The most common
> test score is the minimum passing grade. With very few just below that
> value. This unexpected result is consistent with students close to
> passing having their scores bumped up. This is an example of how data
> visualization can lead to discoveries which would otherwise be missed
> if we simply subject that data to a battery of data analysis, tools,
> or procedures. Data visualization is the strongest tool of what we
> call exploratory data analysis. John Tukey, considered the father of
> exploratory data analysis once said, the greatest value of a picture
> is when it forces us to notice what we never expected to see. We note
> that many widely used data analysis tools were initiated by
> discoveries made with exploratory data analysis. Exploratory data
> analysis is perhaps the most important part of data analysis, yet it
> is often overlooked. Data visualization is also now pervasive and
> philanthropic in educational organizations. One example comes from
> GAPminder and the talks, New Insights on Poverty and the Best Stats
> You&#39;ve Ever Seen, Hans Roslings forced us to notice the unexpected
> with a series of plots related to world health and economics. In his
> videos, he used animated graphs to show us how the world was changing,
> and how old narratives are no longer true. It is also important to
> note that mistakes, biases, systematic errors, and other unexpected
> problems often lead to data that should be handled with care. Failure
> to discover these problems often leads to flawed analyzes and false
> discoveries. As an example, consider that measurement devices
> sometimes fail and that most data analysis procedures are not designed
> to detect these yet. These data analysis procedures will still give
> you an answer. The fact that it can be hard or impossible to notice an
> error just from the reporter results makes data visualization
> particularly important. In this course, we will learn the basics of
> data visualization and exploratory data analysis. We will use
> motivating examples. We will use the ggplot2 package to code. To learn
> the basics, we will start with a somewhat artificial example, heights
> reported by students. Then we will cover two of the examples we
> mentioned, world health and economics, and infectious diseases trends
> in the United States. Note that there&#39;s much more to data
> visualization that will be covered here. But you will get a very good
> introduction to the topic.

---

#### Section 1: Introduction to Data Visualization and Distributions >  1.1 Introduction to Data Visualization >  Installing R and RStudio

For this course, you do not need to install R because we're using DataCamp for 
all of the assignments. You will learn about how to use DataCamp's platform soon. 
However, for those who want to try code on your own computer, include links to 
instructions for installing and RStudio below. If you do not want to install R 
at this moment please proceed to the next section.

**Installing R**
If you want to install R to work on your own computer, you can download it freely 
from the Comprehensive R Archive Network (CRAN). Note that CRAN makes several 
versions of R available:  versions for multiple operating systems and releases 
older than the current one. You want to read the CRAN instructions to assure you 
download the correct version. If you need further help, you can try the following 
resources:

Installing R on Windows
Installing R on Mac
Installing R on Ubuntu

**Installing RStudio**

RStudio is an integrated development environment (IDE). We highly recommend 
installing and using RStudio to edit and test your code. You can install RStudio 
through the RStudio website. Their [cheatsheet](https://www.rstudio.com/wp-content/uploads/2016/01/rstudio-IDE-cheatsheet.pdf)
is a great resource. You need to install R first.


---

#### Section 1: Introduction to Data Visualization and Distributions >  1.1 Introduction to Data Visualization >  Introduction to Distributions

### Introduction to Distributions

[Introduction to Distributions](https://youtu.be/MQlovC1SP0k)

**Average Score**

> 650

**Standard Deviation**

> 650 +- 50

Note that the report has summarized an entire vector of scores
with just two numbers.

It turns out that in some cases, these two numbers
are pretty much all we need to understand the data.
Data visualization techniques will help us determine when
this two-number summary is appropriate.

These same techniques will serve as alternatives for when
these two numbers are not enough.

Our first data visualization building block is learning to 
summarize list of factors or numeric vectors.

The most basic statistical summary of a list of objects or 
numbers is its **distribution**.


> RAFAEL IRIZARRY: You may have noticed that numerical data is often
> summarized with an average value. For example, the quality of a high
> school is sometimes summarized with one number-- the average score in
> a standardized test. Occasionally, a second number is reported as
> well-- the standard deviation. So, for example, you might read a
> report stating that scores at this high school were 680 plus or minus
> 50. The last number is the standard deviation. Note that the report has summarized an entire vector of scores with just two numbers. Is
> this appropriate? Is there any important piece of information we're
> missing by only looking at this summary rather than the entire list?
> It turns out that in some cases, these two numbers are pretty much all
> we need to understand the data. Data visualization techniques will
> help us determine when this two-number summary is appropriate. These
> same techniques will serve as alternatives for when these two numbers
> are not enough. Our first data visualization building block is
> learning to summarize lists of factors or numeric vectors. The most
> basic statistical summary of a list of objects or numbers is its
> distribution. Once a vector has been summarized as a distribution,
> there are several data visualization techniques to effectively relay
> this information.

---

#### Section 1: Introduction to Data Visualization and Distributions >  1.1 Introduction to Data Visualization >  Data Types

[Data Types](https://youtu.be/0lgyJaM6_PI)

We will be working with two types of variables:
* categoricals (Variables that are defined by a small number of groups)
* and numericals.

Each can be divided into two further groups.
**Categoricals** can be divided into:
* ordinals (can be ordered)
* and non-ordinals.

And **numerical** variables can be divided into:
* discrete 
* or continuous (those that can take any value such as heights).

Some **categorical** data can be ordered, for example, spiciness can be mild, medium, or hot.
Even if they are not numbers per se, they can still be ordered.
In statistics textbooks they sometimes refer to these as **ordinal data**.

The other data type are **numericals**. Examples that we have seen or will see 
are population sizes, murder rates, and heights.

Counts such as population sizes are discrete because they have to be round numbers.

Note that discrete numeric data can be considered ordinal.
An example are heights rounded to the nearest inch.

Although this is technically true, we usually reserve the term **"ordinal data"** for variables
belonging to a small number of different groups with each group having many members.
In contrast, when we have many groups with few cases in each group,
we typically refer to this as **discrete numerical variables**.


So for example, the number of packs of cigarettes a person smokes a day
rounded to the closest pack --so 0, 1, or 2-- would be considered ordinal.
While the number of cigarettes that we smoke --0, 1, 2, 3 up to maybe 36--
would be considered a numerical variable.




> RAFAEL IRIZARRY: An important first step in deciding how to visualize
> data is to know what type of data it is. We will be working with two
> types of variables-- categoricals and numericals. Each can be divided
> into two further groups. Categoricals can be divided into ordinals and
> non-ordinals. And numerical variables can be divided into discrete or
> continuous. Variables that are defined by a small number of groups we
> call categorical data. Two simple examples are sex, male or female, or
> regions of the states that we looked at in the first of course--
> Northeast, South, North Central, West. Some categorical data can be
> ordered. For example, spiciness can be mild, medium, or hot. Even if
> they are not numbers per se, they can still be ordered. In statistics
> textbooks they sometimes refer to these as ordinal data. The other
> data type are numericals. Examples that we have seen or will see are
> population sizes, murder rates, and heights. We can further divide
> numerical data into continuous and indiscreet. Continuous variables
> are those that can take any value such as heights if measured with
> enough precision. For example, a pair of twins maybe 68.12 inches and
> 68.11 inches respectively. Counts such as population sizes are discrete because they have to be round numbers. Note that discrete
> numeric data can be considered ordinal. An example are heights rounded
> to the nearest inch. Although this is technically true, we usually
> reserve the term "ordinal data" for variables belonging to a small
> number of different groups with each group having many members. In
> contrast, when we have many groups with few cases in each group, we
> typically refer to this as discrete numerical variables. So for
> example, the number of packs of cigarettes a person smokes a day
> rounded to the closest pack-- so 0, 1, or 2-- would be considered
> ordinal. While the number of cigarettes that we smoke-- 0, 1, 2, 3 up
> to maybe 36-- would be considered a numerical variable. But indeed,
> these examples can be considered both when it comes to data
> visualization. Now that we've learned about the different data types,
> we're ready to learn about data visualization techniques.


---

#### Section 1: Introduction to Data Visualization and Distributions >  1.1 Introduction to Data Visualization  > Introduction to DataCamp

### DataCamp

You are about the take the first assessment. In this course we will be using the 
DataCamp platform for all assessments. DataCamp provides an R console and and a 
script editor right here on your browser.  This is why installing R is not required 
for this course. Here we give a brief DataCamp tutorial. If you are already familiar 
with DataCamp you can skip this section and proceed to the next section

To start an DataCamp assessment, you will click on the button that says Click 
here to start the assessment, which looks like this: picture of start the assessment 
button. You will see button like this one in the next section: Assessment 1.1: Data Types.

The DataCamp interface has four panels. They are:

* The Information Panel: General information about the assessment.
* The Instructions Panel: Exercise instructions. The multiple choice questions appear here when applicable.
* The Editor: Here is where you type and edit your answers in the form of an R script. Example code also appears here. The editor also includes reminders of the instructions.  Note that # denotes comments. These are not run as code, instead, they tell others what your code is about! 
* R console: This is where R commands get executed. You can send commands from the editor to the console but you can also type in commands directly to test out code.

There are two ways to send commands from the editor to the console:

1) If you hit the  Submit Answer button, the entire code in the editor gets executed 
and your answer is evaluated. Remember, after you click Submit Answer in an assessment, 
your code will be evaluated. If you do not take the hint, you get unlimited tries.

2) If your cursor is on the editor and you hit command-return on a Mac or control-return 
on Windows, that line gets executed in the console. You do not submit an answer when 
you do this. This is a good way to test your script before you submit.

Tip: DataCamp suggests useful keyboard shortcuts after most exercises.

---

#### Section 1: Introduction to Data Visualization and Distributions >  1.1 Introduction to Data Visualization  > Assessment: Data Types

The button below will open a link to DataCamp, a learn-to-code company that is 
serving up all of the assignments for Data Science: Visualization. This first 
assignment reviews different data types.

Once you've opened the new window, you will see instructions to the left and the 
editor to the right, where you can type R code to solve the exercises. Remember 
the # denotes comments that are not run as code. You can also execute R commands 
in the console (below the editor). If you want to experiment with R code, type 
directly into the console. When you are ready to be graded, type into the editor 
and hit the 'Submit Answer' button.



---

#### Section 1: Introduction to Data Visualization and Distributions >  1.2 Introduction to Distributions  > Describe Heights to ET

[Describe Heights to ET](https://youtu.be/crIyZUrabeI)

Pretend that we have to describe the heights of our classmates
to ET, an extraterrestrial that has never seen humans.

To do this, we asked students to report their heights in inches.
We asked them to provide sex information because we
know there are two different groups of heights, males and females.
We collect the data and save it in a data frame.

To simplify the explanation at first, we focus on male heights.
The most basic statistical summary of a list of objects or numbers
is its **distribution**.

The simplest way to think of a distribution
is as a compact description of a list with many elements.

For example, with categorical data, the distribution
simply describes the proportions of each unique category.
For example, the sex represented in the heights data set
can be summarized by the proportions of each of the two categories,
female and male.

This two category **frequency table** is the simplest form
of a distribution we can form.

When there are more categories, then a simple bar plot
describes the distribution.

Although this particular plot, a graphical representation of a frequency
table, does not provide much more insights than the table itself,
it is a first example of how we convert a vector
into a visualization that succinctly summarizes
all the information in that vector.

When the data is numerical, the task is much more challenging.
Well, in general, when data is not categorical,
reporting the frequency of each unique entry
is not an effective summary since most entries are unique.


Statistics textbooks teach us that a more useful way
to define a distribution for numerical data
is to define a function that reports the proportion of the data
below a value A for all possible values of A.

This function is called a **Cumulative Distribution Function** or **CDF**.

```
F(a) = Pr(x <= a)

Pr, meaning proportion or probability,
and then in parentheses the event that we require, x less than a.
```

Here's a plot of the function f for the height data.
**Like the frequency table does for categorical data,
the CDF defines the distribution for numerical data**.


![image](https://user-images.githubusercontent.com/16638078/41053789-83e76dbc-698a-11e8-92f2-8a3360059077.png)

We also see that 84% of our students have heights below 72 inches.

![image](https://user-images.githubusercontent.com/16638078/41053940-fa4f3c96-698a-11e8-8f6b-af69d519d782.png)


In fact, we can report the proportion of values between any two heights,
say a and b, by computing f of e, and then subtracting f of a.

```
F(b) - F(a)
```

Final note, because CDFs can be determined mathematically,
as opposed to using data as we do here, the word empirical
is added to distinguish, and we use the term empirical CDF or ECDF.

Although the CDF provides all the information we need and it is widely
discussed in statistics textbooks, the plot
is actually not very popular in practice.

The main reason is that it does not easily
convey characteristics of interest, such as,
at what value is the distribution centered,
is the distribution symmetric, what range contains 95% of the data.
We can decipher all this from the plot, but it's not that easy.


**Histograms** are much preferred because they greatly
facilitate answering such questions.
Histograms sacrifice just a bit of information
to produce plots that are much easier to interpret.

The simplest way to make a histogram is to divide a span of our data
into non-overlapping bins of the same size.

Then for each bin, we count the number of values that fall in that interval.
The histogram plots these counts as bars with the base of the bar the interval.

![image](https://user-images.githubusercontent.com/16638078/41054130-835f9666-698b-11e8-9376-2685d94b0e4f.png)


So why is it an approximation?
What information do we lose?
Note that all values in each interval are treated as the same
when computing the bin heights.
So for example, the histogram does not distinguish
between 64, 64.1, and 64.2 inches.
Given that these differences are almost unnoticeable to the eye,
in this particular case, the practical implications are negligible.

---

#### Section 1: Introduction to Data Visualization and Distributions   1.2 Introduction to Distributions   Smooth Density Plots


Smooth Density Plots

Smooth density plots are similar to histograms,
but are aesthetically more appealing.

Note that we no longer have sharp edges at the interval boundaries
and that many of the local peaks have been removed.
Also notice that the scale of the y-axis changed from counts to something
new called **density**.

To understand the smooth densities, we have
to understand estimates, a topic we don't cover until later.
However, we provide a heuristic explanation
to help you understand the basics, and so you
can use this useful data visualization tool and learn how to interpret it.

The main new concept you have to understand
is that we assume that our list of observed values of observed heights
comes from a much, much larger list of unobserved values.

Because we're assuming that we have a million values measured very precisely,
we can make a histogram with very, very small bits.
This is going to help us understand what smooth densities are.
The assumption is that if we do this, consecutive bins will be similar.
This is what we mean by smooth.
We don't have big jumps from bin to bin.

To make the curve not depend on the hypothetical size
of the hypothetical list, we compute the curve on the **frequency scale**
rather than the **count scale**.

Because it is a small sample, we get unsmooth variation in these heights.
To smooth the histogram what we're going to do
is we're going to start by keeping the heights of the histogram bar shown here
with little points.
We keep these points.
And now we draw a smooth curve that goes through the top
of these histograms bars.

Before we continue, note that smooth is a relative term.
We can actually control the smoothness of the curve that
defines a smooth density through an option in the function, the GG plot
option that computes the smooth density.

![image](https://user-images.githubusercontent.com/16638078/41055061-3964da1e-698e-11e8-9c53-b486bb2b9f1c.png)


We need to make this choice with care, as a result of visualization
can change our interpretation of the data.
We should select a degree of smoothness that we
can defend as being representative of the underlying data.

Always keep in mind that while the histogram is an assumption
free summary, the smooth density is based on assumptions and choices
that you make as a data analyst.

Finally, to be able to interpret density plots,
we need to understand the units of the y-axis.
We point out that interpreting the y-axis of a smooth density plot
is not straightforward.
It is scaled so that the area under the density curve adds up to 1.

![image](https://user-images.githubusercontent.com/16638078/41055216-a43976a6-698e-11e8-8b8a-2a43d4846c17.png)


So if you imagine, you form a bin with a base that is 1 unit long.
The y-axis value tells us the proportion of values in that bin.
But this is only true if the bin is of size 1.
For other size intervals, the best way to determine the proportion of data
in that interval is by computing the proportion of the total area contained
in that interval.
Here's an example, if we take the proportion of values between 65 and 68,
it'll equal the proportion of the graph that is in that blue region
that we're showing you right there.
The proportion of this area is about 0.31, meaning that about 31%
of our values are between 65 and 68 inches.

![image](https://user-images.githubusercontent.com/16638078/41055297-d5adb134-698e-11e8-89af-17ecf4b4d1f8.png)


As a final note, we point out that an advantage
of smooth densities over histograms is that it makes it easier
to compare to distribution.
This is in large part because the jagged edges of the histogram add clutter,
so when we're comparing two histograms, it makes it a little bit hard to see.
Here's an example of what it looks like when you use density plots.
With the right argument, GG plot automatically
shades the intersecting regions with different colors.
So it makes it very easy to get an idea of what the two distributions are.

![image](https://user-images.githubusercontent.com/16638078/41055397-2bc8cf04-698f-11e8-9dcd-a19065c954ed.png)


---

#### Section 1: Introduction to Data Visualization and Distributions >  1.2 Introduction to Distributions  > Normal Distribution


We often see the average and the standard deviation
used as a summary statistic for a list of numbers, a two number summary.
To understand what these summaries are and why they are so widely used,
we need to understand the **normal distribution**.
The normal distribution, also known as the **bell curve**
and as the **Gaussian distribution**, is one of the most famous
mathematical concepts in history.

A reason for this is that approximately normal distributions
occur in many situations.
Examples include, gambling winnings, heights, weights, blood pressure,
standardized test scores, and experimental measurement error.

Here we focus on how the normal distribution helps us summarize data.
Rather than using data, the normal distribution
is defined with a mathematical formula.

![image](https://user-images.githubusercontent.com/16638078/41120090-83497002-6a62-11e8-9f63-d87db2f93747.png)


 note that it is completely defined by just 2 parameters, m and s.

These two parameters, m and s, are referred to as the average, also
call the mean, that's why we use the letter m,
and the standard deviation of the distribution respectively.

The distribution is symmetric, centered at the average,
and most values, about 95%, are within two standard deviations
from the average.

![image](https://user-images.githubusercontent.com/16638078/41120228-e172f676-6a62-11e8-9e48-692cd2177346.png)


Here's what the distribution looks like when the average is zero
and the standard deviation is one.

The fact that the distribution is defined by just two parameters
implies that if a dataset is approximated by a normal distribution,
all information needed to describe this distribution
can be encoded in just two numbers, the average and the standard deviation,

For a list of numbers contained in a vector that we'll call x,
the average is simply defined as a sum of x divided by the length of x.

    > average <- sum(x) / length(x)

And the Standard deviation is defined with the following formula

    > SD <- sqrt( sum( (x-average)^2 ) / length(x) )

It's the square root of the sum of the differences between the values
and the mean squared divided by the length.
You can think of this as the average distance
between the values and their average.

```
index <- heights$sex=="Male"
x <- heights$height[index]
```
We can use prebuilt functions to calculate average and standard deviation

```
average <- mean(x)
SD <- sd(x)
c(average1=average, SD1=SD)
```

So here is a plot of the smooth density of our male heights.
We're making no assumptions here, other than assuming it's somewhat smooth.

![image](https://user-images.githubusercontent.com/16638078/41120772-8c0d56ac-6a64-11e8-8711-d1f6cd6c6a47.png)

And then overlaid with a black curve is the normal distribution
that has average 69.44, and standard deviation 3.27.

![image](https://user-images.githubusercontent.com/16638078/41120828-b8a1ad3a-6a64-11e8-9aab-7c723b52183c.png)


Note how close those two are.
This is telling us that **the normal distribution approximate
the distribution of our male heights**.

Before we continue, let's introduce the concept of **standard units**.

For data that is approximately normal, it
is convenient to think in terms of standard units.
The standard unit of value tells us how many standard deviations away
from the average this value is.

    z = (x - average) / SD

To understand why standard units are useful,
notice that if we convert normally distributed data into standard units,
we can quickly know if for example, a person is about average height, that
would mean z equals 0.
A person that is tall would be z equals 2.
A person that is short would be z equals negative 2.
And extremely rare occurrences, say a 7 footer or something like that,
would have a z bigger than 3.

In R, we can quickly obtain standard units using the function scale.
Type in this code.

    > z <- scale(x)

To see how many men are within two standard deviations from the average,

    > mean(abs(z) < 2)
    [1] 0.950565

If we can assume that the data is approximately normal,
at least for this interval, we can predict the proportion
without actually looking at the data.
We simply know that 95% of the data for normally
distributed data is between negative 2 and 2.
Now to further confirm that in fact the approximation is a good one,
we need to look at other intervals.
And for this, we will use **quantile plots**.

---

#### Section 1: Introduction to Data Visualization and Distributions   1.2 Introduction to Distributions   Assessment: Distributions

#### Section 1: Introduction to Data Visualization and Distributions   1.3 Quantiles, Percentiles, and Boxplots   Quantile-Quantile Plots

### Quantile-Quantile Plots

In a previous video, we described
how, if a distribution is well approximated
by the normal distribution, we can have a very useful and short summary.
But to check if, in fact, it is a good approximation,
we can use **quantile-quantile plots**, or **q-q plots**.

We start by defining a series of proportion, for example, p equals 0.05,
0.10, 0.15, up to 0.95.

```
p = 0.05
p = 0.1
p = 0.15
...
p = 0.95
```

Once this is defined for each p, we determine the value q,
so that the proportion of the values in the data below q is p.

**The q's are referred to as the quantiles.**

To give a quick example, for the male heights
data that we showed in previous videos, we have that 50% of the data
is below 69.5 inches.


    > mean(x <= 69.5)
    [1] 0.5042373

So this means that if p equals 0.5, then the q associated with that p is 69.5.

    if p = 0.5,
    then q = 69.5
   
Now, we can make this computation for a series of p's.
If the quantiles for the data match the quantiles for the normal distribution,
then it must be because the data is approximated by a normal distribution.

    > p <- seq(0.05, 0.95, 0.05)

To obtain the quantiles for the data, we can use the quantile function
in r like this.

    > observed_quantiles <- quantile(x,p)

To obtain the theoretical normal distribution quantiles
with the corresponding average and standard deviation,
we use the qnorm function, like this.

    > theoretical_quantiles <- qnorm( p, mean = mean(x), sd = sd(x) )


To see if they match or not, we can plot them against each other,
and then draw an identity line to see if the points fall on the line.

    > plot(theoretical_quantiles, observed_quantiles)
    > abline(0,1)

![image](https://user-images.githubusercontent.com/16638078/41176462-7575c45e-6b2e-11e8-9e1f-84c03aa6b2d4.png)


Note that the points fall almost on the line,
meaning that the normal approximation is a pretty good approximation.


Now, one final note.
This code becomes slightly simpler if we use standard units.
If we use standard units, we don't have to define
the mean and the standard deviation in the function qnorm.
So the code simplifies and looks like this.

    > observed_quantiles <- quantile(z, p)
    > theoretical_quantiles <- qnorm(p)
    > plot(theoretical_quantiles, observed_quantiles)
    > abline(0,1)

Now, using the histogram, the density plots, and the q-q plots,
we have become convinced that the male height data is well approximated
with a normal distribution.
So in this case, we can report back to ET a very succinct summary.
Male heights **follow a normal distribution*,
with an *average of 69.44 inches**, and a **standard deviation of 3.27 inches**.
With this information, ET will have everything
he needs to know to describe, and know what to expect,
when he meets our male students.



---

#### Section 1: Introduction to Data Visualization and Distributions   1.3 Quantiles, Percentiles, and Boxplots   Percentiles

### Percentiles

[Percentiles](https://youtu.be/1FMwm2PSG34)

**Percentiles** are special cases of quantiles that are commonly used.
The percentiles are the quantiles you obtain
when you define p as 0.01, 0.02, up to 0.99, 1%, 2%, 3%, et cetera.
This is why we call them percentiles.

We call, for example, the case of p equals 0.25 the 25th percentiles.
This gives us the number for which 25% other data is below.

**The most famous percentile is the 50th**, also known as the **median*.
Note that for the normal distribution, the median and the average
are the same.
But this is not generally the case.

Another special case that receives a name are the **quartiles**,
which are obtained when we set p to be 0.25, 0.50, and 0.75.


---

#### Section 1: Introduction to Data Visualization and Distributions   1.3 Quantiles, Percentiles, and Boxplots   Boxplots

