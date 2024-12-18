*DATAANALYSIS.do

*change this file path to match yours
cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package"

*** Scatterplot of International Tax vs. Consumption Tax

*use data from sortedultimatemerge.dta
use "Data_Files\sortedultimatemerge.dta"

*create the histogram
twoway (scatter international consumption, title("Scatterplot of International Tax vs. Consumption Tax") legend(off) ytitle(International (Percent of Revenue)) xtitle(Consumption Tax (Percent of Revenue)) yscale(range(-5 60)) mcolor(forest_green) msize(medsmall) msymbol(triangle_hollow)) lfit international consumption

*save the graph as a png 
save "research_outputs\twowayscatter.png", replace

clear

*** Histogram of International and Consumption Tax in Developed Countries

*use data from sortedultimatemerge.dta
use "Data_Files\sortedultimatemerge"

*we are dropping the countries that we classified as developing
drop if id == 2

*create the histogram
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "Consumption") label(2 "International")) title("Histogram of International and Consumption Tax in Developed Countries", size(small)) xtitle(Percent of Revenue)

*save the graph as a png 
save "research_outputs\twowayhistdevelopedintcons.png", replace
  
clear

*** Histogram of International and Consumption Tax in Developing Countries

*use data from sortedultimatemerge.dta
use "Data_Files\sortedultimatemerge"

*we are dropping the countries that we classified as developed
drop if id == 1

*create the histogram
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "Consumption") label(2 "International")) title("Histogram of International and Consumption Tax in Developing Countries", size(small)) xtitle(Percent of Revenue)

*save the graph as a png 
save "research_outputs\twowayhistdevelopingintcons.png", replace
  
clear

*** histogram of consumption tax and international tax

*use data from sortedultimatemerge.dta
use "Data_Files\sortedultimatemerge"

*create the histogram
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "Consumption") label(2 "International")) title("Histogram of International and Consumption Tax", size(small)) xtitle(Percent of Revenue)

*save the graph as a png 
save "research_outputs\twowayhistintcons.png", replace

clear

*creating two different "two sample T-tests" to test if the difference in means for the developed and developing countries' data are statistically significant with regards to the variables consumption and international

*use data from sortedultimatemerge.dta
use "Data_Files\sortedultimatemerge.dta"

*create a two-sample t test with equal variances
ttest international, by(id)

*create a two-sample t test with equal variances
ttest consumption, by(id)

