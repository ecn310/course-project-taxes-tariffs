use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\course-project-taxes-tariffs\sortedultimatemerge.dta"

drop if id == 1

scatter international vat

graph save "Graph" "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\course-project-taxes-tariffs\scatterdeveloping.png"

twoway (histogram vat, color(blue%50)) (histogram international, color(red%50))

graph save "Graph" "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\course-project-taxes-tariffs\twowayhistorgramdeveloping.png"


clear



use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\course-project-taxes-tariffs\sortedultimatemerge.dta"


drop if id == 2

twoway (histogram vat, color(blue%50)) (histogram international, color(red%50))

graph export "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\course-project-taxes-tariffs\twowaydeveloped.png", as(png) name("Graph")

scatter international vat

graph export "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-project-taxes-tariffs\course-project-taxes-tariffs\scatterdeveloping.png", as(png) name("Graph")


