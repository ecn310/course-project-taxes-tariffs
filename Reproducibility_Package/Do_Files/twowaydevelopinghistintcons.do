*twowaydevelopinghistintocons.do

*** Histogram of International and Consumption Tax in Developing Countries

*change this file path to match yours
cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package"

*use data from sortedultimatemerge.dta
use "Data_Files\sortedultimatemerge"

*we are dropping the countries that we classified as developed
drop if id == 1

*create the histogram
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "Consumption") label(2 "International")) title("Histogram of International and Consumption Tax in Developing Countries", size(small)) xtitle(Percent of Revenue)

*save the graph as a png 
graph export "research_outputs\twowaydevelopinghistintcons.png", as(png) name("Graph") replace