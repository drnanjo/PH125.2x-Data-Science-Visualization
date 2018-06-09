#### Section 2: Introduction to ggplot2   Section 2 Overview   Section 2 Overview

### Section 2 Overview

In Section 2, you will learn how to create data visualizations in R using **ggplot2**.

After completing Section 2, you will:

* be able to use ggplot2 to create data visualizations in R.
* be able to explain what the data component of a graph is.
* be able to identify the geometry component of a graph and know when to use which type of geometry.
* be able to explain what the aesthetic mapping component of a graph is.
* be able to understand the scale component of a graph and select an appropriate scale component to use.

There are 2 assignments that use the DataCamp platform for you to practice your coding skills.

Note that it can be hard to memorize all of the functions and arguments used by ggplot2, so we recommend 
that you have a [cheat sheet](https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf) 
handy to help you remember the necessary commands.

We encourage you to use R to interactively test out your answers and further your learning.

---

#### Section 2: Introduction to ggplot2   2.1 Basics of ggplot2   ggplot

Throughout the series,
we will be using the ggplot2 package.
We can load it, along with dplyr, and other useful packages,
by loading the tidyverse library.

    > library(tidyverse)

Know that many other approaches are available for creating plots in R.
In fact, the plotting capabilities that come with a basic installation of R
are already quite useful.
We have seen examples of these already, with functions like plot, hist, and box
plot.

There are also other packages for creating graphics,
such as **grid** and **lattice**.
We chose to use ggplot2, in this series, because it breaks plots
into components in a way that permits beginners
to create relatively complex and aesthetically pleasing
plots using syntax that is intuitive and relatively easy to remember.

One reason ggplot2 is generally more intuitive
for beginners is that it uses a ***grammar of graphics***, the gg and ggplot.
This is analogous to the way learning grammar can help a beginner construct
hundreds of different sentences by learning just a handful of verbs,
nouns, and adjectives, without having to memorize each specific sentence.
Similarly, by learning a handful of ggplot building blocks,
and its grammar, you will be able to create hundreds of different plots.

One limitation is that ggplot is assigned
to work exclusively with data tables.
In these data tables, rows have to be observations and columns
have to be variables.

Note that you can also load ggplot alone using the command `library(ggplot2)`, 
instead of loading the entire tidyverse


---

#### Section 2: Introduction to ggplot2   2.1 Basics of ggplot2   Graph Components

### Graph Components

[Graph Components](https://youtu.be/gdqy64U-0ds)


As an example, we're going
to construct a graph that summarizes the US murders data set.
You can load a data set using this code.
We're going to create a graph that looks like this.

![image](https://user-images.githubusercontent.com/16638078/41186968-690d00a2-6b6e-11e8-8b1a-dd4787bd81f0.png)


In this graph, we can clearly see how much states vary across population size
and the total number of murders.
Not surprisingly, we also see a clear relationship
between murder totals and population size.
A state falling on the dashed straight line
has the same murder rate as the US average.
The four geographic regions are denoted with color
and they depict, among other things, that most southern states
have murder rates above the average.

The first step in learning ggplot2 is to be
able to break a graph into components.

So let's break down this plot while we introduce
some of the ggplot terminology.
The main three components that we have to be aware of are--
one, that the US murders data table is being summarized.
We refer to this as the **data component**.



Second, the plot is a scatter plot.
This is referred to as the **geometry component**.
Other possible geometries are bar plot, histograms, smooth densities,
q-q plots, and blocks plots.



Third are what we call the **mappings**.
The x-axis values are used to display population size.
The y-axis values are used to display the total number of murders.
Text is used to identify the states.
And colors are used to denote the four different regions.
This is referred to as the **aesthetic mapping component**.

How we define the mapping depends on what geometry we use.


Other components of the plot worth mentioning
are-- one, that the range of the x-axis and the y-axis
appear to be defined by the range of the data.

That they are both on log scales.
And we refer to this as a **scale component**.

We also see that there are labels, a title, a legend.
And we use a style that looks like the style used by The Economist magazine.
We will now construct the plot piece by piece.


---

#### Section 2: Introduction to ggplot2   2.1 Basics of ggplot2   Creating a New Plot




