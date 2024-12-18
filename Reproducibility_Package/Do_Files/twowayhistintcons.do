*twowayhistintcons.do

*** histogram of consumption tax and international tax

*change this file path to match yours
cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package"

*use data from sortedultimatemerge.dta
use "Data_Files\sortedultimatemerge"

*create the histogram
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "Consumption") label(2 "International")) title("Histogram of International and Consumption Tax", size(small)) xtitle(Percent of Revenue)

*save the graph as a png 
graph export "research_outputs\twowayhistintcons.png", as(png) name("Graph") replace