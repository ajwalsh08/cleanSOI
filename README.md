cleanSOI
========

Contains R code for filtering IRS SOI County-to-County Migration Data for one specific county (returns 2 .csv files). 

Download a .csv file for all county-to-county migration in the U.S. for a given pair of tax years here:

http://www.irs.gov/uac/SOI-Tax-Stats-County-to-County-Migration-Data-Files

You'll need to download an inflow and an outflow sheet for a given year pair. Then make sure the R code is pointed to where your files are located.

The R code creates a function called "migration" that you can run on a county-state pair. For example, if you enter into R:

+ migration("Jefferson", "AL")

You would get two new .csv files that would include inflow and outflow ONLY as it pertains to Jefferson County, Alabama.
