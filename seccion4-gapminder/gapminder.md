### Section 4 Overview

In Section 4, you will look at a case study involving data from the Gapminder Foundation about trends in world health and economics. 

After completing Section 4, you will:

* understand how Hans Rosling and the Gapminder Foundation use effective data visualization to convey data-based trends.
* be able to apply the ggplot2 techniques from the previous section to answer questions using data.
* understand how fixed scales across plots can ease comparisons.
* be able to modify graphs to improve data visualization.

There are 2 assignments that use the DataCamp platform for you to practice your coding skills.

We encourage you to use R to interactively test out your answers and further your learning.


---

#### Section 4: Gapminder   4.1 Introduction to Gapminder   Case Study: Trends in World Health and Economics
In this section, we will
demonstrate how relatively simple ggplot and dplyr
code can create insightful and aesthetically pleasing
plots that help us better understand trends in world health and economics.
We will use many of the techniques we have
learned about data visualization, exploratory data analysis,
and summarization.
We later augment the code somewhat to perfect the plots,
and describe some general principles to guide data visualization.
We're going to be using data from Gapminder.

    gapminder.org

Hans Rosling was the co-founder of the Gapminder Foundation, an organization
dedicated to educating the public by using data
to dispel common myths about the so-called developing world.
The organization uses data to show how actual trends in health and economics
contradict the narratives that emanate from sensationalist media
coverage of catastrophes, tragedies, and other unfortunate events.


As stated in the Gapminder Foundation's website,

> Journalists and lobbyists tell dramatic stories.
That's their job.
They tell stories about extraordinary events and unusual people.
The piles of dramatic stories pile up in people's minds
into an overdramatic worldview and strong negative stress feelings.


> The world is getting worse.

> It's we versus them.

> Other people are strange.

> The population just keeps growing.

> And nobody cares.


Hans Rosling conveyed actual database trends, in a dramatic way of his own,
using effective data visualization.
This section is based on these talks that
exemplify this approach to education.
"New Insights on Poverty" and "The Best Stats You've Ever Seen"
are the title of these talks.

Specifically, in this section, we set out
to answer the following two questions.

* First, is it a fair characterization of today's world
to say that it is divided into a Western rich nations,
and the developing world in Africa, Asia, and Latin America?

* Second, has income inequality across countries
worsened during the last 40 years?


We're going to use data and our code to answer these questions.


---

#### Section 4: Gapminder   4.1 Introduction to Gapminder   Gapminder Dataset

