---
title:  "Time Series Forecasting -- Power Demand in Ontario (I)"
mathjax: true
layout: post
tags: [ML, math]
---

***

## Short Summary:

- A time series data set of Ontario power demand is analyzed by Fourier Transformation 
-- a *method of physicists*.

- Periodic patterns of human activities, for example the daily high demand during 
rush hours and the weekly low demand during weekend, and the annual demand fluctuation
due to four seasons, are clearly shown by Fourier Transformation.

- However, to obtain more details of the demand curve and to conduct forecasting for
future hourly demand, machine learning is needed.

***

The code for the analysis in this post is 
[here](https://github.com/caseypie/TSF_Ontario_power).

Finding a topic for machine learning application, at least in the beginning, 
is not easy to me. Basically, it's like forcing  me to shift away from my beloved 
[field theory in biopolymers](https://aip.scitation.org/doi/abs/10.1063/1.5139661) 
and to seriously look into "real-world" topics out of my ivory tower. It took me a 
while to realize what kind of data-wise topics will interest me and how I may be able 
to use ML to do something with them. 

I have been interested in power supply/consumption for a while -- perhaps since my
primary school years in the late 1990s/early 2000s, when Taiwan was in a fierce debate
about nuclear power plants. In Ontario, nuclear power plants provide about 60% of annual
power consumption, which in my opinion is a much better power source than coal and fossil
fuel and natural gas, especially if you care about climate change. Hydro is an exception,
but it is very rarely competent to dominate power supply, except in Canada (what a lucky
country) and some North European countries. 

I should stop talking about power sources (and complaining how toxic and unreliable of 
the current battery technology required for the idea of "intermittent" power supply
proposed by "renewable" energy industry). Those are out of the scope of this post.

Anyway, I feel applying ML to power supply/consumtion data may be interesting to me, 
so I started looking for useful data. Naturally I looked for Ontario data because I live
in Toronto, and I came across the 
[Data Directory of Independent Electricity System Operator (IESO)](http://www.ieso.ca/Power-Data/Data-Directory). 
I picked up the 
[Hourly Zonal Demand Report since May 2003](http://reports.ieso.ca/public/DemandZonal/) as my research target. 
I use **Python Pandas and Scikit-learn**.

## Data Cleaning

I collected the csv files including data from 2003/05/01 to 2020/01/25. The first thing 
of course is to merge all annual csv files together into a large Pandas DataFram, which 
looks like:

![Zonal Data](/images/TSF_Ontario_power/el_all.png)

in which I added *Year*, *Month*, and *Day* columns fetched from the *Date* column. 

As shown in the table above, there are 10 power demand/supply zones in Ontario, the regions of which are shown in the 
[IESO Zonal Map](http://www.ieso.ca/localContent/zonal.map/index.html)
Some zones, for example the Northwest and Northeast, has resources generally exceed 
their demands; they export electricity to zones of big cities, for example Toronto
and Ottawa.

As I am more interested in the time series data of power demand than power supply 
(which is relatively quite stable except for wind turbines and solar cell systems), 
I first focused on the two big cities, *Ottawa* and *Toronto*. 
Then, here is the other consideration: 
the Ontario power grid is not an isolated system, but instead also connecting to 
nearby provinces/states: Manitoba, Minnesota, Quebec, New York, and Michigan,
as shown in the 
[Ontario power grid connection map](http://www.theimo.com/imoweb/pubs/marketops/AreaInterface_Defn_10zones.pdf).
The zones with external interconnections not only satisfy their demands by power
plants in Ontario; they also import electricity from the nearby provinces/states.
On the other hand, they also support the demands of nearby regions when necessary.
As Ottawa is just on the borderline of Ontario and Quebec, its power supply is 
rather complicated due to the connection with Quebec power grid.
Thus, I decided to just focus on the power demand in Toronto, which does not have 
any external interconnection and should have a relatively simple demand-supply 
relationship.

Using *Toronto* as an example, the hourly curve of the ~16.75 years looks like:

![Toronto 05-2003--01-2020](/images/TSF_Ontario_power/Toronto_ori.png)

where we can see a huge drop close to 0, which happend on 2003/08/14: the
[Northeast blackout of 2003](https://en.wikipedia.org/wiki/Northeast_blackout_of_2003). 
The other two dropdowns are on 2016/05/29 and 2016/10/31: because of unknown reasons, 
IESO does not have zonal data for the two days; except for *Ontario Demand*, everything 
is 0.
Considering that the blackout and the data missing cannot be dealt by time series
forecasting (of course!), I removed the dropdown data and filled in numbers by 
[pd.DataFrame.interpolate()](https://pandas.pydata.org/pandas-docs/version/0.24.2/reference/api/pandas.DataFrame.interpolate.html).


## Periodicity or "Seasonality"

Before doing fancy ML implementation, I'd like to try some analysis that a physicist 
would do for time-dependent data. It is not quite hard to notice that the curve of 
Ontario Demand, as well as of all 10 zones in the data, are periodic. Thus, I did 
[Fast Fourier Transformation](https://docs.scipy.org/doc/numpy/reference/routines.fft.html) 
on the time series.
The *Toronto* data above was then transformed to its frequence distribution:

![Toronto frequency](/images/TSF_Ontario_power/Toronto_freqs.png)

We notice that the peaks in the distribution are not sharp but instead have width, 
which is quite normal; we cannot expect the power demand of Toronto is some pure
sinusoidal curve. Taken the peak widths into account, the periods (in untis of days) 
with the top 10 highest peaks of the 10 zones are:

![Peak Periods](/images/TSF_Ontario_power/peak_periods.png)

There are periods making clear sense: 1 day, 7 days (1 week), and 359.647 days (~1 year).
Some periods, for example 0.5 days, 3.5 days, 185.273 days (~0.5 years), and 122.28 days
(~1/3 years), can either be the higher harmonics of the common frequences or more subtle
periods. 
For example, the 0.5-day period may result from the two rush hours in one day; 
the 185-day period may indicate the two season switches (April and October, say) in a
year. Without more information about the power consumption structure, e.g. the portions 
of residential and business usages, it is hard to tell where each period is from. 
Interestingly, subtracting the sinusoidal waves of all the 10 periods leads to the
following curve:

![Toronto curve filtered](/images/TSF_Ontario_power/Toronto_curve_filtered.png)

which still has significant peaks (during winters), indicating that the de-periodicity 
via Fast Fourier Transformation is not ideal. We notice that the shapes of the annual
peaks are all different, which means that, though via maked eye the existence of the 
peaks are obvious, their amplitudes and shapes change every year, and thus FFT cannot
filter them out.

Nevertheless, this FFT gives us some ideas about the distribution of the time series,
which may benefit the ML analysis and forecasting later.







