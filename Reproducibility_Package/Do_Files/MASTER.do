*gdpdata.do \\ importing excel GDP data and reshaping it into a long dataset

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Excel_Files"

import excel "GDPdataset.xlsx", sheet("Country-Timeseries")

local year = 1988

foreach var of varlist C-AK {  // Adjust if more variables exist
    rename `var' yr`year'
    local year = `year' + 1
}

rename A CountryName
rename B IndicatorName

drop in 1

gen id = _n
 
reshape long yr, i(id) j(year)
 
rename yr gdp

drop id

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files"

save "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files\gdpdata" , replace 

clear


*internationaltaxnew.do \\ importing excel international data and reshaping it into a long dataset

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Excel_Files"

import excel "internationaldataset", sheet("Country-Timeseries")


local year = 1988

foreach var of varlist C-AK {  // Adjust if more variables exist
    rename `var' yr`year'
    local year = `year' + 1
}

rename A CountryName
rename B IndicatorName

drop in 1

gen id = _n
 
reshape long yr, i(id) j(year)

rename yr international

drop id

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files"

save "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files\internationaltax", replace

clear
*consumptiontax.do

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Excel_Files"

import excel "consumptiondataset", sheet("Country-Timeseries")

local year = 1988

foreach var of varlist C-AK {  // Adjust if more variables exist
    rename `var' yr`year'
    local year = `year' + 1
}

rename A CountryName
rename B IndicatorName

drop in 1

gen id = _n
 
reshape long yr, i(id) j(year)

rename yr consumption

drop id

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files"

save "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files\consumptiontaxreproducible", replace

clear

*mergeddatasets.do

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files"

use consumptiontaxreproducible

merge 1:1 CountryName year using internationaltax

drop _merge 

save "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files\merged", replace 

clear

*sortedultimatemergere.do

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files"

use merged 

describe using gdpreproducible

merge 1:1 CountryName year using gdpreproducible

sort gdp

drop _merge

replace id = 1 if gdp > 12000

replace id = 2 if gdp < 12000

drop if international < -5


save "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files\sortedultimatemerge", replace

clear

*scatterplotconsvint.do

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files"

use sortedultimatemerge

twoway (scatter international consumption, title("Scatterplot of International Tax vs. Consumption Tax") legend(off) ytitle(International (Percent of Revenue)) xtitle(Consumption Tax (Percent of Revenue)) yscale(range(-5 60)) mcolor(forest_green) msize(medsmall) msymbol(triangle_hollow)) lfit international consumption

clear

*5year.do

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files"

use sortedultimatemerge

keep if year >= 1985 & year <= 1989
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), title("Histogram of GDP and Consumption") subtitle("from 1985-1989") legend(label(1 "Consumption") label(2 "GDP")) ytitle(frequency of observations)
clear

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files"

use sortedultimatemerge

keep if year >= 2017 & year <= 2022
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), title("Histogram of GDP and Consumption") subtitle("from 2017-2022") legend(label(1 "Consumption") label(2 "GDP")) ytitle(frequency of observations)

clear

*twowaydevelopedhistintcons.do

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files"

use sortedultimatemerge

drop if id == 2
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "Consumption") label(2 "International")) title("Histogram of International and Consumption Tax in Developed Countries", size(small)) xtitle(Percent of Revenue)

clear

*twowaydevelopinghistintcons.do

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files"

use sortedultimatemerge

drop if id == 1
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "Consumption") label(2 "International")) title("Histogram of International and Consumption Tax in Developing Countries", size(small)) xtitle(Percent of Revenue)

clear

*twowayhistintcons.do

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files"

use sortedultimatemerge

twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "Consumption") label(2 "International")) title("Histogram of International and Consumption Tax", size(small)) xtitle(Percent of Revenue)