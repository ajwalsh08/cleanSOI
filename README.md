cleanSOI
========

Contains R code for filtering IRS SOI County-to-County Migration Data for one specific county (returns 4 csv files). 

If you clone the repo to your desktop, it'll include the csv files for migration in 2010-2011, and you should be able to run the script straightaway. To download data for other years <a href="http://www.irs.gov/uac/SOI-Tax-Stats-County-to-County-Migration-Data-Files">go here.</a> Just make sure you adjust the code appropriately.

The R code creates a function called "migration" that you can run on a county-state pair. For example, if you enter into R:

+ migration("Jefferson", "AL")

you'll get four new files: two that show county-to-county migration, and two that summarize by state.

I'm working on using a list and a for loop to get data for a list of counties. (Multiple states would probably be too complicated.)
