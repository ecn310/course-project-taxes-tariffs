*twowaydevelopedhistintcons.do

*change file path to yours
cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package"

*use data from sortedultimatemerge.dta
use "Data_Files\sortedultimatemerge.dta"

*we are dropping the countries that we classified as developing
drop if id == 2

*create the twoway histogram
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "Consumption") label(2 "International")) title("Histogram of International and Consumption tax in Developed Countries", size(small)) xtitle(Percent of Revenue)

*save the graph as png file
graph export "research_outputs\twowayhistdevelopedintcons.png", as(png) name("Graph") replace
