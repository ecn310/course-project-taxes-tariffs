use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\Reproducibility_Package\Data_Files\consumptiontaxreproducible.dta" 

merge 1:1 CountryName year using "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\Reproducibility_Package\Data_Files\internationaltax.dta"

pwcorr international consumption, sig

 twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50))
 
 scatter international consumption
 
mean consumption

mean international
