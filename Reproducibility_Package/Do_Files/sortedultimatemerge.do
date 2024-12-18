*sortedultimatemerge.do

*** merging merged.dta and gdpreproducible.dta into one dataset

*change file path to yours
cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package"

*use the data from merged.dta
use "Data_Files\merged"

*display information about variables using the external dataset gdpreproducible.dta
describe using "Data_Files\gdpreproducible"

*merging the two datasets 1-on-1 using the key variables 'CountryName' and 'year.' The key variables are used to match observations between the current dataset(merged.dta) and the additional dataset(gdpreproducible.dta)
merge 1:1 CountryName year using "Data_Files\gdpreproducible.dta"

*sorts the variable gdp in ascending order
sort gdp

*dropping the variable _merge because it is unneccsary and will violate our future commands
drop _merge

*generates id as a new variable which represents the current number of observations
gen id = _n

*now that we have the final working dataset we are going to split the countries into developing and developed countries to run further analysis and provide more technical reasoning for our findings
*We decided a cutoff for gdp per capita should be $12,000 after researching various sources which are linked in the final project report 
*Our GDP per capita dataset is in current us dollars

replace id = 1 if gdp > 12000

replace id = 2 if gdp < 12000

*drop an outlier which is a bad data entry from China's international tarriffs 
drop if international < -5

*save data
save "Data_Files\sortedultimatemerge", replace