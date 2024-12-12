use "C:\Users\dthoma26\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\Reproducibility_Package\Data_Files\sortedultimatemerge.dta"
drop if id == 2
twoway (histogram consumption, color(blue%50)) (histogram international, color(red%50)), legend(label(1 "consumption") label(2 "international")) title("Histogram of international and consumption tax in developing countries", size(small)) xtitle(percent of revenue)