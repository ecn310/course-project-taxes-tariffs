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

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files"

save "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files\gpddata" , replace 


*internationaltaxnew.do \\ importing excel international data and reshaping it into a long dataset

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Excel_Files"

import excel "intaxedited", sheet("Country-Timeseries")


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

rename yr internationaltax

drop id

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files"

save "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package\Data_Files\internationaltax", replace



*data.do

import excel "C:\Users\ujbilgra\OneDrive - Syracuse University\Stata Data\VATdatasheet.xlsx", sheet("Country-Timeseries")

codebook

tabulate C

clear

import excel "C:\Users\ujbilgra\OneDrive - Syracuse University\Stata Data\internationaltaxdatasheet.xlsx", sheet("Country-Timeseries") firstrow allstring

codebook

tabulate D

tabulate E

tabulate CountryName

*mergeddatasets.do

use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\vatf.dta" 

merge 1:1 CountryName year using intf.dta

pwcorr international vat

 twoway (histogram vat, color(blue%50)) (histogram international, color(red%50))
 
 scatter international vat
 
  graph bar international vat
  
mean vat

mean international

*sortedultimatemergere.do

use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\merged.dta"

describe using gdp.dta

merge 1:1 CountryName year using gdp.dta

drop _merge

sort gdp

gen id = .

replace id = 1 if gdp > 12000

replace id = 2 if gdp < 12000

drop if international < -5

save "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\sortedultimatemergeredo.dta"

*datapnggeneration.do

use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\course-project-taxes-tariffs\sortedultimatemerge.dta"

drop if id == 1

scatter international vat

graph save "Graph" "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\course-project-taxes-tariffs\scatterdeveloping.png"

twoway (histogram vat, color(blue%50)) (histogram international, color(red%50))

graph save "Graph" "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\course-project-taxes-tariffs\twowayhistorgramdeveloping.png"

clear

use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\course-project-taxes-tariffs\sortedultimatemerge.dta"

drop if id == 2

twoway (histogram vat, color(blue%50)) (histogram international, color(red%50))

graph export "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\course-project-taxes-tariffs\twowaydeveloped.png", as(png) name("Graph")

scatter international vat

graph export "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\course-project-taxes-tariffs\scatterdeveloping.png", as(png) name("Graph")

*scatterplotconsvint.do

use "C:\Users\dthoma26\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\Reproducibility_Package\Data_Files\sortedultimatemerge.dta"
twoway (scatter international consumption, title("Scatterplot of International Tax vs. Consumption Tax") legend(off) ytitle(International (Percent of Revenue)) xtitle(Consumption Tax (Percent of Revenue)) yscale(range(-5 60)) mcolor(forest_green) msize(medsmall) msymbol(triangle_hollow)) lfit international consumption

*5year.do

use "C:\Users\dthoma26\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\sortedultimatemerge.dta"
keep if year >= 1985 & year <= 1989
twoway (histogram vat, color(blue%50)) (histogram international, color(red%50)), title("Histogram of GDP and VAT") subtitle("from 1985-1989") legend(label(1 "VAT") label(2 "GDP")) ytitle(frequency of observations)
clear
use "C:\Users\dthoma26\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\sortedultimatemerge.dta"
keep if year >= 2017 & year <= 2022
twoway (histogram vat, color(blue%50)) (histogram international, color(red%50)), title("Histogram of GDP and VAT") subtitle("from 2017-2022") legend(label(1 "VAT") label(2 "GDP")) ytitle(frequency of observations)

*twowaydevelopedhistintcons.do

use "C:\Users\dthoma26\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\Reproducibility_Package\Data_Files\sortedultimatemerge.dta"
drop if id == 2
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "consumption") label(2 "international")) title("Histogram of international and consumption tax in developed countries", size(small)) xtitle(percent of revenue)

*twowaydevelopinghistintcons.do

use "C:\Users\dthoma26\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\Reproducibility_Package\Data_Files\sortedultimatemerge.dta"
drop if id == 1
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "consumption") label(2 "international")) title("Histogram of international and consumption tax in developing countries", size(small)) xtitle(percent of revenue)

*twowayhistintcons.do

use "C:\Users\dthoma26\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\Reproducibility_Package\Data_Files\sortedultimatemerge.dta"
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "consumption") label(2 "international")) title("Histogram of international and consumption tax", size(small)) xtitle(percent of revenue)