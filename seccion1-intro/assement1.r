"Exercise 1. Variable names

The type of data we are working with will often influence the data visualization technique we use. We will be working with two types of variables: categorical and numeric. Each can be divided into two other groups: categorical can be ordinal or not, whereas numerical variables can be discrete or continuous.
We will review data types using some of the examples provided in the dslabs package. For example, the heights dataset."

library(dslabs)
data(heights)
names(heights)

"Exercise 3. Numerical values

Keep in mind that discrete numeric data can be considered ordinal. Although this is technically true, we usually reserve the term ordinal data for variables belonging to a small number of different groups, with each group having many members.
The height variable could be ordinal if, for example, we report a small number of values such as short, medium, and tall. Let's explore how many unique values are used by the heights varialbe.
Use the unique and length functions to determine how many unique heights were reported."

x <- heights$height
length(unique(x))

"Exercise 4. Tables

One of the useful outputs of data visualization is that we can learn about the distribution of variables. For categorical data we can construct this distribution by simply computing the frequency of each unique value. This can be done with the function table
Use the table function to compute the frequencies of each unique height value. Because we are using the resulting frequency table in a later exercise we want you to save the results into an object and call it tab."

x <- heights$height
tab <- table(x)

"Exercise 5. Indicator variables

To see why treating the reported heights as an ordinal value is not useful in practice we note how many values are reported only once.
In the previous exercise we computed the variable tab which reports the number of times each unique value appears. For values reported only once tab will be 1. Use logicals and the function sum to count the number of times this happens."

tab <- table(heights$height)
sum(tab==1)

