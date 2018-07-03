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



If we read the documentation,
we know that each geometry function has many arguments other than aes and data.
They tend to be specific to the function.
For example, in the plot we wish to make,
the points are larger than the default ones.
In the help file, we see that size is an aesthetic
and we can change it using this code.
We simply put size equals 3 outside the call to aes.

    > p + geom_point(aes(population/10^6, total), size = 3) + 
    +     geom_text(aes(population/10^6, total, label = abb))

Unfortunately, now that the points are larger,
we can't read the labels anymore.
If we read the help file for geom text however,
we see that there's an argument nudge underscore x, which lets
us move the label just a little bit.
So we can add that argument to the call to geom text.
Notice that now we're adding an argument nudge x equals 1.

    > p + geom_point(aes(population/10^6, total), size = 3) + 
    +     geom_text(aes(population/10^6, total, label = abb), nudge_x = 1)

We can actually make the code we've just shown more efficient.
Note that in the previous lines of code, we
have been mapping population and total to the points
twice, once for each geometry.

We can avoid this by adding what is called a global aesthetic mapping.

Remember that the function ggplot contains an argument that permits
us to define the aesthetic mappings.
We can see it by typing args ggplot.

    > args(ggplot)
    function (data = NULL, mapping = aes(), ..., environment = parent.frame()) 
    NULL

If we define a mapping in ggplot, then all the geometries
that are added as layers will default to this mapping.
So we're going to redefine p, this time defining
a mapping inside the ggplot function.


    > p <- murders %>% ggplot(aes(population/10^6, total, label = abb)) 

Also note that we kept size and nudge x in the geom point
and geom text functions respectively.

    > p + geom_point(size = 3) + geom_text(nudge_x = 1)


Now, if we need to override the global mappings, we can do this.
The local mappings override the global ones.

    > p + geom_point(size = 3) + geom_text(aes(x=10, y=800, label="Hello there!"))

If we type this code and we redefine a mapping inside the call the geom
text, now when we see the plot that is produced,
the labels are no longer there.
Only the label assigned by that new local aesthetic mappings.



---

#### section 2: Introduction to ggplot2   2.2 Customizing Plots   Scales, Labels, and Colors

 our desired scales are in the log scale.
This is not the default, so this change needs
to be added through a scales layer.
A quick look at the documentation reveals
the `scale_x_continuous` function

We can use this to edit the behavior of scales.
We simply tell ggplot to use the log10 transformation for both the
x and y-axis.

```R
> p + geom_point(size = 3) +
geom_text(nudge_x = 0.1) +
scale_x_continuous(trans = "log10") +
scale_y_continuous(trans = "log10")
```

Note that because we're in the log scale now, the nudge must be made smaller.


The log transformation is so common, that ggplot
provides specialized functions.
So we can make the previous code slightly more
efficient by using the scale_x_log10 layer and the scale_y_log10 layer
to make the scales be in the log scale.

```R
> p + geom_point(size = 3) +
geom_text(nudge_x = 0.075) +
scale_x_log10() +
scale_y_log10()
```

Now that we have a scatterplot with the appropriate scales,
we're ready to add some labels and titles.
We can read the documentation which reveals that to change labels and add
a title, we use the following function.
* `xlab` can add a label to the x-axis.
* `ylab` adds one to the y-axis.
* And `ggtitle` adds a title.

```
> p + geom_point(size = 3) + 
geom_text(nudge_x = 0.075) + 
scale_x_log10() +
scale_y_log10() +
xlab("populations in millions (log scale)") +
ylab("Total number of murders (log scale)") +
ggtitle("US Gun Murders in US 2010")


```

Note that we can change the color of the points using the call
argument in the geom point function.

```
p <- murders %>% ggplot(aes(population/10^6, total, label=abb)) +
geom_text(nudge_x = 0.075) +
scale_x_log10() +
scale_y_log10() +
xlab("Population in millions (log scale)") + 
xlab("Total number of murders (log scale)") + 
ggtitle("US Gun Murders in US 2010")

```

Now we can make all the points blue by simply adding a color argument.


```
p + geom_point(size = 3, color = "blue")
```

We want the colors to be associated with their geographical region.
A nice default behavior of ggplot lets us do this.
If we assign a categorical variable to the color argument,
it automatically assigns a different color to each category.
And it also adds a legend.

```
p + geom_point(aes(color=region), size = 3)
```

We also see another useful default behavior of ggplot.
It has automatically added a legend that maps colors to region.


```
r <- murders %>% +
summarize(rate = sum(total) + sum(population) * 10^6) %>% .$rate
```

We want to add a line that represents the average murder
rate for the entire country.


To compute the average rate for the entire country,
we can use some of the dplyr skills we've learned.


    r <- murders %>% + summarize(rate = sum(total) / sum(population) * 10^6) %>% .$rate

To add a line, we use the geom abline function.
ggplot uses ab in the name to remind us that we're supplying the intercept
a the slope b.

The default line for geom abline has slope 1 and intercept 0.
So we only have to define the intercept.


```
p + geom_point(aes(col=region), size=3) + 
geom_abline(intercept=log10(r))
```


To recreate the original plot we want to make,
we have to change the line type from solid to dashed,
change the color from black to grey, and also,
we need to draw the line before the points.


```
> p <- p + 
geom_abbline(intercept=log10(r), lty=2, color="darkgrey") +
geom_point(aes(col=region), size=3)
```

that ggplot is very flexible, and there's almost always
a way to achieve what you want.
For example, there's a small change we need
to make for our plot to match our original goal.
And it's to capitalize the word region in the legend.


To do this, we discover that the function scale_color_discrete
lets us do this.

    > p <- p + scale_color_discrete(name="Region")
    
    
---

#### Section 2: Introduction to ggplot2   2.2 Customizing Plots   Add-on Packages

The power of ggplot2 is further
augmented thanks to the availability of add on packages.
The remaining changes required to put the finishing touches on our plot
requires the ggthemes and ggrepel packages.


Let's start by changing the themes.
The style of a ggplot graph can be changed using the theme function.
Several themes are included as part of the ggplt2 package.
In fact, for most of the plots in this series,
we're using a theme that we define, and it's included in the DS Labs package,
and you can get it by typing 

    ds_theme_set()

Many other themes can be added using the package ggthemes.
Among those are the `theme_economist` that we use to make our original plot.

After installing the package, you can change the style by adding a layer.
We've already saved the plot in the p object, so now all we need to do
is load the ggthemes library and then add
a layer that is defined by the theme_economist.

```
> library(ggthemes)
> p + theme_economist()
```

You can see how some of the other themes look by simply changing the function.
For example, you might try the theme fivethirtyeight function
to get a theme that looks like the fivethirtyeight web page.

```
> library(ggthemes)
> p + theme_fivethirtyeight()
```

The final difference between the plot we have now and our final goal
has to do with the positions of the labels.
Note, that in our plot some of the labels fall on top of each other
making it hard to read.


The add-on package ggrepel includes a geometry
that adds labels ensuring that they don't fall on top of each other.
So all we need to do is change the geom_text layer
with a `geom_text_repel` layer after loading the ggrepel package.

So now, let's put it all together from scratch.

```
> install.packages("ggplot2")
> install.packages("magrittr")
> install.packages("ggthemes")
> install.packages("ggrepel")

> library(ggthemes)
> library(ggrepel)
> ### first define the slope of the line
> r <- murders %>% + summarize(rate = sum(total) / sum(population) * 10^6) %>% .$rate
> ### now make the plot
> murders %>% ggplot(aes(population/10^6, total, label=abb)) +
  geom_abline(intercept = log10(r), lty = 2, color = "darkgrey") +
  geom_point(aes(col=region), size = 3) +
  geom_text_repel() +
  scale_x_log10() + 
  scale_y_log10() +
  xlab("Populations in millions (log scale)") +
  ylab("Total number of murders (log scale)") +
  ggtitle("US Gun Murders is US 2010") + 
  scale_color_discrete(name = "Region") +
  theme_economist()

```

---


#### Section 2: Introduction to ggplot2   2.2 Customizing Plots   Other Examples

 Now that we've learned the basics of ggplot
we can try to make some of the summary plots we have previously described.
Let's start with the histogram.
Let's start to make the histogram for the male heights.
So in a first step, we need to filter the heights to only include the males.
We do this using the filter function.


```R
> heights %>% filter(sex=="Male)
```
Now that we have a data set, the next step is deciding what geometry we need.
If you guessed geom_histogram you guessed right.

```R
> geom_histogram()
```

So the code could look something like this.
We're going to do it in two steps.
First, we're going to define a graph object
p, that has the data piped into the ggplot function
and defines the aesthetic mapping that tells us that heights is what
we're going to make a histogram of.

```R
> p <- heights %>%  
  filter(heights$sex == "Male") %>% 
  ggplot(aes(x = height))

> p + geom_histogram()

```

Now when we do this, we notice that we get a warning or a message
saying that the bin width was not picked, and it was picked for us.
So what we can do now is add the bin width that we want.

```R
> p + geom_histogram(banwidth = 1)
```

Finally, as an example of the flexibility of ggplot,
we'll change the color just for aesthetic reasons and add a title.
We do this using the following code.


```R
> p + geom_histogram(bandwidth = 1, fill = "blue", col = "black") +
  xlab("Male heights in inches") +
  ggtitle("Histogram")
```

Now we can create some densities using another geometry.
The geometry in this case is called 

```R
geom_density()
```

We've already defined a plot object p, so we can,
instead of adding a histogram layer, we add a geom_density layer.
And we get the following plot.


```R
> p + geom_density()
```

For a Q-Q plot we use the geom_qq geometry.

```R
> p + geom_qq()
```

```R
> p + heights %>% filter(sex == "Male") %>%
  ggplot(aes(sample = height))
> p + geom_qq()
```

By default, the Q-Q plot is compared to the normal distribution with average
zero and standard deviation one.

To change this, again, from the help file,
we learn that we need to use the dparams argument.
So now what we do is we define an object params
that will have the mean and standard deviation of our data.
We use some dplyr functions to do this, and now we
add the geometry by assigning this new object that we
created to the dparams argument.

```R
> params <- heights %>% +
  filter(sex == "Male") %>% +
  summarize(mean = mean(height), sd = sd(height))

> p + geom_qq(dparams = params)
```

We can then add identity lines to see how
well the normal approximation works.

```R
> p + geom_qq(dparams = params) +
  geom_abline()
```

Another option here is to first scale the data so that we have them
in standard units and plot it against the standard normal distribution.
This saves us the step of having to compute
the mean and standard deviation.

```R
> heights %>% filter(sex=="Male") %>% +
  ggplot(aes(sample = scale(height))) +
  geom_qq() +
  geom_abline()
```

One way to do that is to use the grid extra package, which has a function
called grid.arrange that lets us show different plot
objects next to each other.

```R
> p <- heights %>% filter(sex == "Male) %>% ggplot(aes(x = height))
> p1 <- p + geom_histogram(binwidth = 1, fill = "blue", col = "black")
> p2 <- p + geom_histogram(binwidth = 2, fill = "blue", col = "black")
> p3 <- p + geom_histogram(binwidth = 3, fill = "blue", col = "black")
```

So in this case, we're creating three different histograms.
And we're saving them to the objects p1, p2, p3.
Then to show them next to each other we use
the grid.arrange function like this.

```R
> library(gridExtra)
> grid.arrange(p1, p2, p3, ncol = 3)
```

























