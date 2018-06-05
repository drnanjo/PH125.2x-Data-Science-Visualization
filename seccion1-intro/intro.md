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

