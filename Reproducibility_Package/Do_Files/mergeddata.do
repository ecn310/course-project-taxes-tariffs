*mergeddata.do

*** merging consumptionreproducible.dta and internationaltax.dta datasets into one

*change file path to yours
cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package"

*use the data from consumptiontaxreproducible.dta
use "Data_Files\consumptiontaxreproducible"

*merging the two datasets 1-on-1 using the key variables 'CountryName' and 'year.' The key variables are used to match observations between the current dataset(consumptiontaxreproducible.dta) and the additional dataset(internaltax.dta)
merge 1:1 CountryName year using "Data_Files\internationaltax.dta"

*dropping the variable _merge because it is unneccsary and will violate our future commands
drop _merge

*first creates a pairwise correlation between the variables international and consumption, then displays the p-value to show statisical significance
pwcorr international consumption, sig

*creates a twoway histogram comparing the variables consumption and international 
 twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50))
 
 *creates a scatterplot with the variables international and consumption
 scatter international consumption

*mean estimation of consumption
mean consumption

*mean estimation of international
mean international

*save file
save "Data_Files\merged", replace 