use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\vatf.dta" 

merge 1:1 CountryName year using intf.dta

pwcorr international vat

 twoway (histogram vat, color(blue%50)) (histogram international, color(red%50))
 
 scatter international vat
 
  graph bar international vat
  
mean vat

mean international

