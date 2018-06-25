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


### Creating a New Plot

[Creating a New Plot](https://youtu.be/jd271tVwIm0)

In this video, we will cover how to associate data
with graph objects, geometries, and mappings.
The first step in creating a ggplot graph is to define a ggplot object.
We do this with a function ggplot, which initializes the graph.

If we read the data file for this function,
we see that the first argument is used to specify what
data is associated with the object.
This is the data component.

So to initiate an object:

    > ggplot(data = murders)

This associates the data set with the plotting object.

We can also pipe the data:

    > murders %>% ggplot()

We can define an object and store the plot:

    > p <- ggplot(data = murders)

If we look at the class of p, we see that it's a ggplot object.

    > class(p)
    [1] "gg" "ggplot"

To render the plot associated with this object, we simply print the object p.

    > print(p)
    > p

---

#### Section 2: Introduction to ggplot2   2.1 Basics of ggplot2   Assessment: Robust Summaries with Outliers


---

#### Section 2: Introduction to ggplot2   2.2 Customizing Plots   Layers


 In ggplot, we create graphs by adding layers.
We add them component by component.
Layers can define geometries, compute summary statistics,
define what scales to use, and even change styles.
To add layers, we use a symbol plus.

    +

In general, a line of code in ggplot will look like this.

    DATA %>% ggplot() + LAYER 1 + LAYER 2 + ... +  LAYER N

We'll have data, we pipe it into the ggplot command, and then we add layers.


We want to make a scatterplot.

Taking a quick look at the documentation,
we see that the function used to create plots with this geometry is 

    geom_point

For geom point to know what to do, we need to provide data and a mapping.


We have already connected an object with the mergers data table.
And if we add, as a layer, geom point, we will default to using this data.

`Aes` will be one of the functions that you will most use.
We refer to this connection as the aesthetic mappings.

There's where the name comes from, aes.
the outcome of this function is often used
as the argument of a geometry function.

The following example produces a scatterplot
of total learners versus population in millions.
We pipe the mergers data set into ggplot,
and then we add a layer with a geom point function.

    > murders %>% ggplot() + geom_point(aes(x = population/10^6, y = total))

Also note that in ggplot we can add layers to previously defined objects.

    > p <- ggplot(data = murders)
    > p + geom_point(aes(population/10^6, total))

Note also that the scales and labels are defined
by default when adding this layer.
Finally, notice that we use the variable names from the object component,
population and total, to label the axes.

Note that aes recognizes the variable names from the data object.
Keep in mind that this behavior is quite specific to aes.
With most functions, if you try to access
the values of population or total for example, outside of aes,
you will receive an error.

A second layer in the plot we wish to make
involves adding a label to each point.
This will help us identify which point goes with which state.


    geom_label
    geom_text

Because each state, each point, has a label,
we need an aesthetic mapping to make this connection.


By reading the help file, we learn that we
supply the mapping between point and label
through the label argument of aes.
So the code looks like this.

    > p + geom_point(aes(population/10^6, total)) + 
      geom_text(aes(population/10^6, total, label = abb))


We add the points with geom point, and now we're
going to add the text with geom text.
The aesthetic mapping is the same, but now we add the label,
and we're going to add the state abbreviations, which
is stored in the abb variable.


---

#### Section 2: Introduction to ggplot2   2.2 Customizing Plots   Tinkering

