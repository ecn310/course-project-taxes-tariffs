*scatterplotconsvsint.do

*** Scatterplot of International Tax vs. Consumption Tax

*change this file path to match yours
cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package"

*use data from sortedultimatemerge.dta
use "Data_Files\sortedultimatemerge.dta"

*create the histogram
twoway (scatter international consumption, title("Scatterplot of International Tax vs. Consumption Tax") legend(off) ytitle(International (Percent of Revenue)) xtitle(Consumption Tax (Percent of Revenue)) yscale(range(-5 60)) mcolor(forest_green) msize(medsmall) msymbol(triangle_hollow)) lfit international consumption

*save the graph as a png 
graph export "research_outputs\Scatterplotintvscons.png", as(png) name("Graph") replace