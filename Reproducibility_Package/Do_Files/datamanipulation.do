*Data Manipulation Do-File

*replace "kesarrge" with your name in file path directory each time you save a file

*using this website: download these 3 datasets:
*https://wits.worldbank.org/CountryProfile/en/Country/BY-COUNTRY/StartYear/1988/EndYear/2022/Indicator/GC-TAX-GSRV-VA-ZS which corresponds to consumption tax
*https://wits.worldbank.org/CountryProfile/en/Country/BY-COUNTRY/StartYear/1988/EndYear/2022/Indicator/GC-TAX-INTT-RV-ZS which corresponds to tarrifs
*https://wits.worldbank.org/CountryProfile/en/Country/BY-COUNTRY/StartYear/1988/EndYear/2022/Indicator/NY-GDP-PCAP-CD gdp per capita current US Dollars 

*convert these 3 files into excel sheets by clicking the download button on the top right of the table. It is labelled in light gray and and has an arrow facing downwards into a box.

*Save these excel files with their corresponding names e.g. Gdp data is saved as gdp.xlsx

*** we are importing the excel GDP dataset and reshaping it into a long dataset

cd "C:\Users\kesarrge\OneDrive - Syracuse University\ECN 310\course-project-taxes-tariffs\Reproducibility_Package"

*replace the user name "kesarrge" with your file path directory 

import excel "raw_data\GDPdataset.xlsx", sheet("Country-Timeseries")

*in order to combine all three datasets, into one large dataset, we must turn all of the years 1988-2022 into a variable so that stata can reshape the data. 
*Stata is not able to recognize a number such as 1988 as it's own variable, so years are imported as strings C-AK. 
*Thus, we must change C-AK, into yr1988, yr 1999, etc. for all three datasets, along with reshaping from wide to long to combine them 

*To start off, we are going to do this for the GDP dataset

local year = 1988

*sets the first start year as 1988, which is important because the codes from line 30-33 establish a loop which changes C-AK to the actual year it is in the excel sheet

foreach var of varlist C-AK {  // Adjust if more variables exist
    rename `var' yr`year'
    local year = `year' + 1
}

rename A CountryName
rename B IndicatorName

*The new loop only renamed C-AK leaving column A and B which must be renamed to CountryName and IndicatorName to make sense of the respective data in those columns 

drop in 1

*drops row 1 where all years are labelled as C-AK 

*now we will begin reshaping the data from wide to long 

gen id = _n
 
reshape long yr, i(id) j(year)
 
rename yr gdp

drop id

*drop id so stata does not confuse the id variable with other id variables during a dataset merge 

save "Data_Files\gdpreproducible" , replace 

*save the file

*we now have one reshaped dataset and will repeat the same procedures for consumption tax and tariffs (international data)

clear

*** we are now importing international tax's raw excel data (tariffs) and reshaping it into a long dataset

import excel "raw_data\internationaldataset", sheet("Country-Timeseries")

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

save "Data_Files\internationaltax", replace

clear

*** we are now importing consumption tax's raw excel data and reshaping it into a long dataset

import excel "raw_data\consumptiondataset", sheet("Country-Timeseries")

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

save "Data_Files\consumptiontaxreproducible", replace

clear

*once all three datasets have been reshaped, we can now combine the datasets and create the final dataset 
*First we will merge consumption tax with tariffs, save the dataset and merge it again with the gdp dataset in order to create the final dataset

*** merging consumptionreproducible.dta and internationaltax.dta datasets into one

use "Data_Files\consumptiontaxreproducible"

merge 1:1 CountryName year using internationaltax.dta

drop _merge 

save "Data_Files\merged", replace 

clear

*** merging merged.dta and gdpreproducible.dta into one dataset

use "Data_Files\merged"

describe using "Data_Files\gdpreproducible"

merge 1:1 CountryName year using "Data_Files\gdpreproducible"

sort gdp

drop _merge

*now that we have the final working dataset we are going to split the countries into developing and developed countries to run further analysis and provide more technical reasoning for our findings
*We decided a cutoff for gdp per capita should be $12,000 after researching various sources which are linked in the final project report 
*Our GDP per capita dataset is in current us dollars

replace id = 1 if gdp > 12000

replace id = 2 if gdp < 12000

drop if international < -5

*this drops an outlier which is a bad data entry from China's international tarriffs 

save "Data_Files\sortedultimatemerge", replace
