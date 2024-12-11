import excel "C:\Users\ujbilgra\OneDrive - Syracuse University\Stata Data\VATdatasheet.xlsx", sheet("Country-Timeseries")

codebook

tabulate C

clear

import excel "C:\Users\ujbilgra\OneDrive - Syracuse University\Stata Data\internationaltaxdatasheet.xlsx", sheet("Country-Timeseries") firstrow allstring

codebook

tabulate D

tabulate E

tabulate CountryName

