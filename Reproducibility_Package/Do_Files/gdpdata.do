*gdpdata.do

*** we are now importing international tax's raw excel data (tariffs) and reshaping it into a long dataset

*change this file path to your file path
cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package" 

*import the excel data
import excel "raw_data\GDPdataset.xlsx", sheet("Country-Timeseries")

*Set the first start year as 1988
local year = 1988

*establish a loop which changes columns C-AK to the actual year it is in the excel sheet
foreach var of varlist C-AK {  // Adjust if more variables exist
    rename `var' yr`year'
    local year = `year' + 1
}

*since we still have columns A and B, we have to rename them to CountryName and IndicatorName to understand the respective data
rename A CountryName
rename B IndicatorName

*drops row 1 where all years are labelled as C-AK
drop in 1

*generates id as a new variable which represents the current number of observations
gen id = _n

*transforming data from wide format into long format, 'yr' is the variable that will be unstacked, 'id' is the variable which will remain fixed, and then 'year' is a new variable which will store the origonal column names
reshape long yr, i(id) j(year)
 
 *renaming variable 'yr' to 'internationaltax'
rename yr gdp

*drop variable 'id' so stata does not confuse the id variable with other id variables during the dataset merge
drop id 

*save the file
save "Data_Files\gdpreproducible" , replace 