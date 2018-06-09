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

