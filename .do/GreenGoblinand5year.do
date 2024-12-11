use "C:\Users\dthoma26\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\sortedultimatemerge.dta"
twoway (scatter gdp vat, title("Scatterplot of Gdp and Vat") mcolor(forest_green) msize(medsmall) msymbol(triangle_hollow))
clear
use "C:\Users\dthoma26\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\sortedultimatemerge.dta"
keep if year >= 1985 & year <= 1989
twoway (histogram vat, color(blue%50)) (histogram international, color(red%50)), title("Histogram of GDP and VAT") subtitle("from 1985-1989") legend(label(1 "VAT") label(2 "GDP")) ytitle(frequency of observations)
clear
use "C:\Users\dthoma26\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\sortedultimatemerge.dta"
keep if year >= 2017 & year <= 2022
twoway (histogram vat, color(blue%50)) (histogram international, color(red%50)), title("Histogram of GDP and VAT") subtitle("from 2017-2022") legend(label(1 "VAT") label(2 "GDP")) ytitle(frequency of observations)