use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\Reproducibility_Package\Data_Files\sortedultimatemerge.dta"
drop if id == 1
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "Consumption") label(2 "International")) title("Histogram of International and Consumption Tax in Developing Countries", size(small)) xtitle(Percent of Revenue) yscale(range(0 0.15)) ylabel(0(0.05)0.15),
