
*** Scatterplot of International Tax vs. Consumption Tax

use "Data_Files\sortedultimatemerge.dta"

twoway (scatter international consumption, title("Scatterplot of International Tax vs. Consumption Tax") legend(off) ytitle(International (Percent of Revenue)) xtitle(Consumption Tax (Percent of Revenue)) yscale(range(-5 60)) mcolor(forest_green) msize(medsmall) msymbol(triangle_hollow)) lfit international consumption

save "Data_Files\twowayscatter.png", replace

*save the graph as a png 

clear

*** Histogram of International and Consumption Tax in Developed Countries

use "Data_Files\sortedultimatemerge"

drop if id == 2
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "Consumption") label(2 "International")) title("Histogram of International and Consumption Tax in Developed Countries", size(small)) xtitle(Percent of Revenue)

save "Data_Files\twowayhistdevelopedintcons.png", replace

*save the graph as a png 
  
clear

*** Histogram of International and Consumption Tax in Developing Countries

use "Data_Files\sortedultimatemerge"

drop if id == 1
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "Consumption") label(2 "International")) title("Histogram of International and Consumption Tax in Developing Countries", size(small)) xtitle(Percent of Revenue)

save "Data_Files\twowayhistdevelopingintcons.png", replace

*save the graph as a png 
  
clear

*** histogram of consumption tax and international tax

use "Data_Files\sortedultimatemerge"

twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "Consumption") label(2 "International")) title("Histogram of International and Consumption Tax", size(small)) xtitle(Percent of Revenue)

save "Data_Files\twowayhistintcons.png", replace

*save the graph as a png 
  
