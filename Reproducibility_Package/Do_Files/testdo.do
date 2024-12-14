*gdpdata.do

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

