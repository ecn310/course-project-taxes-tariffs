
*added yr to each year on both of the data sheets that way stata registers years as a variable allowing for reshaping of the data sets from wide to long 
 import excel "C:\Users\ujbilgra\OneDrive - Syracuse University\VATdatasheet.xlsx", sheet("Country-Timeseries") firstrow


 gen id = _n
 
 . reshape long yr, i(id) j(year)
 
  rename yr vat

 save "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course
> -project-taxes-tariffs\vatreshapeddatafinal.dta"

  clear
 
import excel "C:\Users\ujbilgra\OneDrive - Syracuse University\internationaltaxdatasheet.xlsx", sheet("Country-Timeseries") firstrow

gen id = _n

reshape long yr, i(id) j(year)

rename yr international

. save "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course
> -project-taxes-tariffs\internationalreshapedfinal.dta"






