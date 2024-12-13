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


