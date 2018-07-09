### Section 5 Overview

Section 5 covers some general principles that can serve as guides for effective data visualization.

After completing Section 5, you will:

* understand basic principles of effective data visualization.
* understand the importance of keeping your goal in mind when deciding on a visualization approach.
* understand principles for encoding data, including position, aligned lengths, angles, area, brightness, and color hue.
* know when to include the number zero in visualizations.
* be able to use techniques to ease comparisons, such as using common axes, putting visual cues to be compared adjacent to one another, and using color effectively.

There are 3 assignments that use the DataCamp platform for you to practice your coding skills.

We encourage you to use R to interactively test out your answers and further your learning.

---

#### Section 5: Data Visualization Principles   5.1 Data Visualization Principles, Part 1   Introduction to Data Visualization Principles

We have already provided some rules
to follow as we created plots for our examples.
Here we aim to provide some general principles
we can use as guidelines for effective data visualization.
Much of this part of the course is based on a talk
by **Karl Broman** entitled 

    "Creating Effective Figures and Tables"

and from class notes from **Peter Aldhous** titled

    "Introduction to Data Visualization."

In many of our examples, we follow Karl's approach.
We show some examples of plot styles we should
avoid, explain how to improve them, and then use these
as motivation for a list of principles.
We compare and contrast plots that follow these principles to those that
don't.
The principles are mostly based on research
related to how humans detect patterns and make visual comparisons.
The preferred approaches are those that best
fit the way our brain processes visual information.
When deciding on a visualization approach
it is also important to keep our goal in mind.
We may be comparing a viewable number of quantities,
describing distributions for categories or numeric values,
comparing the data from two groups, or describing
the relationship between two variables.
As a final note, we also know that for a data scientist
it is important to adapt and optimize graphs to the audience.
For example, an exploratory plot made for ourselves
will be different than a chart intended to communicate
a finding to a general audience.


---

#### Section 5: Data Visualization Principles   5.1 Data Visualization Principles, Part 1   Encoding Data Using Visual Cues

We start by describing some principles for encoding data.
There are several approaches to our disposal,
including 

* position, 
* aligned lengths, 
* angles, 
* area, 
* brightness,
* and color hue.

In our first example, to illustrate how some of these strategies compare,
let's suppose we want to report the results from two
hypothetical polls, asking what browser you use,
what's your browser preference.
And the polls were taken in 2000, and then in 2015.
Here, for each year, we are simply comparing
four quantities, four percentages.

A widely used graphical representation of percentages, popularized
by Microsoft Excel, is the pie chart.
Here's a pie chart for our data.
There's two pie charts, one for 2000, one for 2015.
Here, we're representing quantities with both areas and angles,
since both the angle and area of each pie slice
is proportional to the quantity it represents.
This turns out to be a suboptimal choice,
since, as demonstrated by perception studies,
humans are not good at precisely quantifying angles,
and are even worse when only area is available.
This makes the donut chart, which only uses area, even worse
than the pie chart.
To see how hard it is to quantify angles and area,
note that the rankings and all the percentages in the plots
that we just saw changed from 2000 to 2015.
Can you determine the actual percentages and rank the browser's popularity?
Can you see how the percentages changed from 2000 to 2015?
It's not easy to tell from the plot.

In this case, simply showing the numbers is not only clear,
but it would save us on print costs, if making a paper version of our results.
If we write out the percentages, we quickly
see which browser is more popular, and how they changed from 2000 to 2015.
If we insist on a plot, the preferred way to plot these quantities
is to use length and positions, since humans are
much better at judging linear measures.
The bar plot uses this approach by using bars of length proportional
to the quantity of interest.
By adding a horizontal line at strategically chosen values,
in this case at every multiple of 10, we ease the quantifying
through the position of the top of the bars.
Compare these two plots.

Notice how much easier it is to see the differences in the bar plot.
In fact, we can now determine the actual percentages
by following a horizontal line to the y-axis.
If for some reason you need to make a pie chart,
do include the percentages as numbers to avoid having
to infer them from the angles or area.

In summary, position and length are the preferred way
to display quantities over angles, which are preferred over area.
Brightness and color are even harder to quantify than angles and area.
But, as we will see later, they are sometimes
useful when more than two dimensions are being displayed.


---

#### Section 5: Data Visualization Principles   5.1 Data Visualization Principles, Part 1   Know When to Include Zero

When using bar plots, it is dishonest
not to start the bars at 0.
This is because by using a bar plot, we are
implying the length is proportional to the quantities being displayed.
By avoiding 0, relatively small differences
can be made to look much bigger than they actually are.

This approach is often used by politicians or media organizations
trying to exaggerate the difference.
Here is an illustrative example.
This is a bar plot made by Fox News showing southwest border
apprehensions in 2011, 2012, and 2013.
Look how much bigger the 2013 bar looks compared to the 2011.
From this plot, it appears that apprehensions have almost
tripled, when in fact, if you look at the numbers.
They have only increased by about 16%.
Starting the graph at 0 illustrates this clearly.
This is what it looks like if the plot includes 0.

Here's another example, again from Fox News it's showing us
what would happen if Bush tax cuts expires for the top tax
rate it's comparing January 1, 2013, to the time in which this was broadcast.
We look at the bar plots, it looks like the January 1, 2013
is about 5 times bigger than the now bar plot.
Here's what it looks like with the appropriate plot, a much different
story.

When using position rather than length, then it's not necessary to include 0.
This is particularly the case when we want
to compare differences between groups relative to the variability seen
within the groups.
Here's an illustrative example showing country average life expectancies,
stratified into continents, in 2012.
In the plot on the left, which includes 0, the space between 0 and 43
adds no information, and makes it harder to appreciate
the between and within variability.
For this reason, on the plot on the right,
we restrict the range to include the points.

---

#### Section 5: Data Visualization Principles   5.1 Data Visualization Principles, Part 1   Do Not Distort Quantities

Our next principle is do not distort quantities.
Here's an example.
During President Barack Obama's 2011 State Of The Union address,
the following chart was used to compare the US GDP
to the GDP of four competing nations.
Note that judging by the area of the circles,
the US appears to have an economy over 5 times larger than China,
and over 30 times larger than France.

However, when looking at the actual numbers,
one sees that this is not the case.
The actual ratios are 2.6, and 5.8 times bigger than China and France
respectively.

The reason for this distortion is that the radius, rather than the area,
was made to be proportional to the quantity, which
implies that the proportions between the areas is squared.
So 2.6 turns into 6.5, and 5.8, turns into 34.1.
Here's a comparison of the circles we get
if we make the values proportional to the radius, that's on the left, and so
the area, that's on the right.

Not surprisingly, ggplot defaults to using area rather than the radius.
Of course, in this case, we really should not be using area at all,
since we can use position and length.
Here's the bar plot comparing the GDPs.

---

#### Section 5: Data Visualization Principles   5.1 Data Visualization Principles, Part 1   Order by a Meaningful Value
