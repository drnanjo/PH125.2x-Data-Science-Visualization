"Exercise 1. Distributions - 1
You may have noticed that numerical data is often summarized with the average value. For example, the quality of a high school is sometimes summarized with one number: the average score on a standardized test. Occasionally, a second number is reported: the standard deviation. So, for example, you might read a report stating that scores were 680 plus or minus 50 (the standard deviation). The report has summarized an entire vector of scores with with just two numbers. Is this appropriate? Is there any important piece of information that we are missing by only looking at this summary rather than the entire list? We are going to learn when these 2 numbers are enough and when we need more elaborate summaries and plots to describe the data.

Our first data visualization building block is learning to summarize lists of factors or numeric vectors. The most basic statistical summary of a list of objects or numbers is its distribution. Once a vector has been summarized as distribution, there are several data visualization techniques to effectively relay this information. In later assessments we will practice to write code for data visualization. Here we start with some multiple choice questions to test your understanding of distributions and related basic plots.

In the murders dataset, the region is a categorical variable and on the right you can see its distribution. To the closet 5%, what proportion of the states are in the North Central region?"

index <- murders$region=="North Central"
r1 <- murders$region[index]

length(r1)/length(murders)
#[1] 2.4

"Exercise 2. Distributions - 2
In the murders dataset, the region is a categorical variable and to the right is its distribution.

Which of the following is true:

The graph is a histogram.
The graph shows only four numbers with a bar plot.
Categories are not numbers so it does not make sense to graph the distribution.
The colors, not the height of the bars, describe the distribution.

"

"Exercise 3. Empirical Cumulative Distribution Function (eCDF)
The plot shows the eCDF for male heights:

Based on the plot, what percentage of males are shorter than 75 inches?

100%
95%
80%
72 inches
"

"Exercise 4. eCDF Male Heights
The plot shows the eCDF for male heights:

To the closest inch, what height m has the property that 1/2 of the male students are taller than m and 1/2 are shorter?

61 inches
64 inches
69 inches
74 inches
"

"Exercise 5. eCDF of Murder Rates
Here is an eCDF of the murder rates across states.

Knowing that there are 51 states (counting DC) and based on this plot, how many states have murder rates larger than 10 per 100,000 people?

1
5
10
50
"

"Exercise 6. eCDF of Murder Rates - 2
Here is an eCDF of the murder rates across states:

Based on the eCDF above, which of the following statements are true:

About half the states have murder rates above 7 per 100,000 and the other half below.
Most states have murder rates below 2 per 100,000.
All the states have murder rates above 2 per 100,000.
With the exception of 4 states, the murder rates are below 5 per 100,000.
"

"Exercise 7. Histograms
Here is a histogram of male heights in our heights dataset:

Based on this plot, how many males are between 62.5 and 65.5?

5
24
44
100
"

"Exercise 8. Histograms - 2
Here is a histogram of male heights in our heights dataset:

About what percentage are shorter than 60 inches?

1%
10%
25%
50%
"

"Exercise 9. Density plots
Based on this density plot, about what proportion of US states have populations larger than 10 million?

0.02
0.15
0.50
0.55
"

"Exercise 10. Density plots - 2
Here are three density plots. Is it possible that they are from the same dataset? Which of the following statements is true:

It is impossible that they are from the same dataset.
They are from the same dataset, but different due to code errors.
They are the same dataset, but the first and second undersmooth and the third oversmooths.
They are the same dataset, but the first is not in the log scale, the second undersmooths and the third oversmooths.
"

########

"Exercise 1. Proportions
Histograms and density plots provide excellent summaries of a distribution. But can we summarize even further? We often see the average and standard deviation used as summary statistics: a two number summary! To understand what these summaries are and why they are so widely used, we need to understand the normal distribution.

The normal distribution, also known as the bell curve and as the Gaussian distribution, is one of the most famous mathematical concepts in history. A reason for this is that approximately normal distributions occur in many situations. Examples include gambling winnings, heights, weights, blood pressure, standardized test scores, and experimental measurement errors. Often data visualization is needed to confirm that our data follows a normal distribution.

Here we focus on how the normal distribution helps us summarize data and can be useful in practice.

One way the normal distribution is useful is that it can be used to approximate the distribution of a list of numbers without having access to the entire list. We will demonstrate this with the heights dataset.

Load the height data set and create a vector x with just the male heights:
"


library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]
mean(x>69 & x<=72)

"Exercise 2. Averages and Standard Deviations
Suppose all you know about the height data from the previous exercise is the average and the standard deviation and that its distribution is approximated by the normal distribution. We can compute the average and standard deviation like this:

library(dslabs)
data(heights)
x <- heights$height[heights$sex=="Male"]
avg <- mean(x)
stdev <- sd(x)
Suppose you only have avg and stdev below, but no access to x, can you approximate the proportion of the data that is between 69 and 72 inches?

Use the normal approximation to estimate the proportion the proportion of the data that is between 69 and 72 inches.
Note that you can't use x in your code, only avg and stdev. Also note that R has a function that may prove very helpful here - check out the pnorm function (and remember that you can get help by using ?pnorm)."

library(dslabs)
data(heights)
x <- heights$height[heights$sex=="Male"]
avg <- mean(x)
stdev <- sd(x)

pnorm(72, avg, stdev) - pnorm(69, avg, stdev)


"Exercise 3. Approximations
Notice that the approximation calculated in the second question is very close to the exact calculation in the first question. The normal distribution was a useful approximation for this case.

However, the approximation is not always useful. An example is for the more extreme values, often called the "tails" of the distribution. Let's look at an example. We can compute the proportion of heights between 79 and 81.

library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]
mean(x > 79 & x <= 81)

Use normal approximation to estimate the proportion of heights between 79 and 81 inches and save it in an object called approx.
Report how many times bigger the actual proportion is compared to the approximation."

library(dslabs)
data(heights)
x <- heights$height[heights$sex == "Male"]
exact <- mean(x > 79 & x <= 81)
exact

avg <- mean(x)
stdev <- sd(x)
approx <- pnorm(81, avg, stdev) - pnorm(79, avg, stdev)
approx

# ratio
exact / approx

## http://seankross.com/notes/dpqr/

"Exercise 4. Seven footers and the NBA
Someone asks you what percent of seven footers are in the National Basketball Association (NBA). Can you provide an estimate? Let's try using the normal approximation to answer this question.

First, we will estimate the proportion of adult men that are 7 feet tall or taller.

Assume that the distribution of adult men in the world as normally distributed with an average of 69 inches and a standard deviation of 3 inches.

Using this approximation, estimate the proportion of adult men that are 7 feet tall or taller, referred to as seven footers. Print out your estimate; don't store it in an object.

"

1 - pnorm(84, 69, 3)

"Exercise 5. Estimating the number seven footers
Now we have an approximation for the proportion, call it p, of men that are 7 feet tall or taller.

We know that there are about 1 billion men between the ages of 18 and 40 in the world, the age range for the NBA.

Can we use the normal distribution to estimate how many of these 1 billion men are at least seven feet tall?


Use your answer to the previous exercise to estimate the proportion of men that are seven feet tall or taller in the world and store that value as p.
Then round the number of 18-40 year old men who are seven feet tall or taller to the nearest integer. (Do not store this value in an object.)"

p <- 1 - pnorm(84, 69, 3)
p

round(1000000000 * p)

"Exercise 6. How many seven footers are in the NBA?
There are about 10 National Basketball Association (NBA) players that are 7 feet tall or higher.

Use your answer to exercise 4 to estimate the proportion of men that are seven feet tall or taller in the world and store that value as p.
Use your answer to the previous exercise (exercise 5) to round the number of 18-40 year old men who are seven feet tall or taller to the nearest integer and store that value as N.
Then calculate the proportion of the world's 18 to 40 year old seven footers that are in the NBA. (Do not store this value in an object.)
"

p <- (1 - pnorm(84, 69, 3))
p
N <- round(1000000000 * p)
10 / N


"Exercise 7. Lebron James' height
In the previous exerceise we estimated the proportion of seven footers in the NBA using this simple code:

p <- 1 - pnorm(7*12, 69, 3)
N <- round(p * 10^9)
10/N
Repeat the calculations performed in the previous question for Lebron James' height: 6 feet 8 inches. There are about 150 players, instead of 10, that are at least that tall in the NBA.

Report the estimated proportion of people at least Lebron's height that are in the NBA.
"
## Change the solution to previous answer
p <- 1 - pnorm(80, 69, 3)
N <- round(p * 10^9)
150/N


"Exercise 8. Interpretation
In answering the previous questions, we found that it is not at all rare for a seven footer to become an NBA player.

What would be a fair critique of our calculations?

Practice and talent are what make a great basketball player, not height.
The normal approximation is not appropriate for heights.
As seen in exercise 3, the normal approximation tends to underestimate the extreme values. It's possible that there are more seven footers than we predicted.
As seen in exercise 3, the normal approximation tends to overestimate the extreme values. It's possible that there are less seven footers than we predicted.

"


