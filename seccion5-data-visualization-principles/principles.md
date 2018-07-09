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
