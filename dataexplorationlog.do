
. use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-
> project-taxes-tariffs\course-project-taxes-tariffs\sortedultimatemerge.dta"

. drop if id = 2
=exp not allowed
r(101);

. drop id = 2
=exp not allowed
r(101);

. drop if id == 2
(4,714 observations deleted)

. mean
last estimates not found
r(301);

. mean id == 1
== invalid name
r(198);

. mean gdp

Mean estimation                   Number of obs   =      1,786

--------------------------------------------------------------
             |       Mean   Std. Err.     [95% Conf. Interval]
-------------+------------------------------------------------
         gdp |    33298.8   485.8746      32345.86    34251.74
--------------------------------------------------------------

. summary
command summary is unrecognized
r(199);

. summary gdp
command summary is unrecognized
r(199);

. summarize

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
        year |      2,041    2006.332    10.41372       1988       2022
 CountryName |          0
IndicatorN~e |          0
         gdp |      1,786     33298.8    20533.59   12020.02   133590.1
         vat |      1,100    11.61037    5.731912   .0329885   40.00499
-------------+---------------------------------------------------------
internatio~l |        741    3.835927    8.747825  -.1304207   58.70603
          id |      2,041           1           0          1          1

. clear

. use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-
> project-taxes-tariffs\course-project-taxes-tariffs\sortedultimatemerge.dta"

. drop if id == 1
(2,041 observations deleted)

. summarize

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
        year |      4,714    2004.423    9.907173       1988       2022
 CountryName |          0
IndicatorN~e |          0
         gdp |      4,714    2991.279    2907.206   22.85037   11998.18
         vat |      2,112    9.552635    4.883831   .0573357   32.11375
-------------+---------------------------------------------------------
internatio~l |      2,229    12.35789    11.68053  -15.84169   64.65984
          id |      4,714           2           0          2          2

. clear

. use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-
> project-taxes-tariffs\course-project-taxes-tariffs\sortedultimatemerge.dta"

. summarize

    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
        year |      6,755        2005    10.10025       1988       2022
 CountryName |          0
IndicatorN~e |          0
         gdp |      6,500    11318.85    17464.26   22.85037   133590.1
         vat |      3,212    10.25734    5.280108   .0329885   40.00499
-------------+---------------------------------------------------------
internatio~l |      2,970    10.23171    11.62153  -15.84169   64.65984
          id |      6,755    1.697853    .4592224          1          2

. clear

. use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-
> project-taxes-tariffs\course-project-taxes-tariffs\sortedultimatemerge.dta"

. drop if id == 2
(4,714 observations deleted)

. pwcorr, sig international vat
option international not allowed
r(198);

. rename international international
  (all newnames==oldnames)

. rename international int
int invalid varname
r(198);

. rename international inte

. pwcorr, sig inte vat
option inte not allowed
r(198);

. pwcorr sig, vat inte
variable sig not found
r(111);

. pwcorr inte vat

             |     inte      vat
-------------+------------------
        inte |   1.0000 
         vat |  -0.2509   1.0000 

. pwcorr inte vat, sig

             |     inte      vat
-------------+------------------
        inte |   1.0000 
             |
             |
         vat |  -0.2509   1.0000 
             |   0.0000
             |

. clear

. use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-
> project-taxes-tariffs\course-project-taxes-tariffs\sortedultimatemerge.dta"

. drop if id == 2
(4,714 observations deleted)

. pwcorr inte vat, sig

             | intern~l      vat
-------------+------------------
internatio~l |   1.0000 
             |
             |
         vat |  -0.2509   1.0000 
             |   0.0000
             |

. pwcorr international vat, sig

             | intern~l      vat
-------------+------------------
internatio~l |   1.0000 
             |
             |
         vat |  -0.2509   1.0000 
             |   0.0000
             |

. clear

. use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-
> project-taxes-tariffs\course-project-taxes-tariffs\sortedultimatemerge.dta"

. drop if id == 1
(2,041 observations deleted)

. pwcorr international vat, sig

             | intern~l      vat
-------------+------------------
internatio~l |   1.0000 
             |
             |
         vat |  -0.3421   1.0000 
             |   0.0000
             |

. clear

. use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-
> project-taxes-tariffs\course-project-taxes-tariffs\sortedultimatemerge.dta"

. pwcorr international vat, sig

             | intern~l      vat
-------------+------------------
internatio~l |   1.0000 
             |
             |
         vat |  -0.3250   1.0000 
             |   0.0000
             |

.  twoway (histogram vat, color(blue%50)) (histogram international, color(red%50
> ))

. sort vat

. sort international

. sort gdp

. drop if id == 2
(4,714 observations deleted)

. scatter international vat

. graph export "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHu
> b\course-project-taxes-tariffs\course-project-taxes-tariffs\developedhistogram
> .png", as(png) name("Graph")
(file C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-p
> roject-taxes-tariffs\course-project-taxes-tariffs\developedhistogram.png writt
> en in PNG format)

. twoway (histogram vat, color(blue%50)) (histogram international, color(red%50)
> )

. graph save "Graph" "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents
> \GitHub\course-project-taxes-tariffs\course-project-taxes-tariffs\twowayhistog
> raminternational.gph"
(file C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-p
> roject-taxes-tariffs\course-project-taxes-tariffs\twowayhistograminternational
> .gph saved)

. bar chart international vat
command bar is unrecognized
r(199);

. chart international vat
command chart is unrecognized
r(199);

. tsset year
repeated time values in sample
r(451);

. tsline close
time variable not set, use tsset varname ...
r(111);

. tsset gdp
time variable must contain only integer values
r(451);

. tsset year
repeated time values in sample
r(451);

. histogram year international vat
too many variables specified
r(103);

. histogram year vat
too many variables specified
r(103);

. histogram year
(bin=33, start=1988, width=1.030303)

. twoway (histogram year, color(blue%50)) (histogram international, color(red%50
> ))

. twoway (histogram vat, color(blue%50)) (histogram year, color(red%50))

. histogram montenegro
variable montenegro not found
r(111);

. gen var montenegro
=exp required
r(100);

. gen var == montenegro
== invalid name
r(198);

. histogram CountryName
string variables not allowed in varlist;
CountryName is a string variable
r(109);

. histogram CountryName montenegro
variable montenegro not found
r(111);

. histogram 1993
1993 invalid name
r(198);

. histogram year 1988
1988 invalid name
r(198);

. scatter montenegro
variable montenegro not found
r(111);

. scatter CountryName
too few variables specified
r(102);

. clear

. use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-
> project-taxes-tariffs\course-project-taxes-tariffs\sortedultimatemerge.dta"

. drop if id == 1
(2,041 observations deleted)

. scatter international vat

. graph save "Graph" "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents
> \GitHub\course-project-taxes-tariffs\course-project-taxes-tariffs\scatterdevel
> oping.gph"
(file C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-p
> roject-taxes-tariffs\course-project-taxes-tariffs\scatterdeveloping.gph saved)

.  twoway (histogram vat, color(blue%50)) (histogram international, color(red%50
> ))

. graph save "Graph" "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents
> \GitHub\course-project-taxes-tariffs\course-project-taxes-tariffs\twowayhistor
> gramdeveloping.gph"
(file C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-p
> roject-taxes-tariffs\course-project-taxes-tariffs\twowayhistorgramdeveloping.g
> ph saved)

. clear

. use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-
> project-taxes-tariffs\course-project-taxes-tariffs\sortedultimatemerge.dta"

. drop if id == 2
(4,714 observations deleted)

.  twoway (histogram vat, color(blue%50)) (histogram international, color(red%50
> ))

. graph export "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHu
> b\course-project-taxes-tariffs\course-project-taxes-tariffs\twowaydeveloped.pn
> g", as(png) name("Graph")
(file C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-p
> roject-taxes-tariffs\course-project-taxes-tariffs\twowaydeveloped.png written 
> in PNG format)

. undo
command undo is unrecognized
r(199);

. clear

. use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-
> project-taxes-tariffs\course-project-taxes-tariffs\sortedultimatemerge.dta"

. drop if id == 1
(2,041 observations deleted)

. scatter international vat

. graph export "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHu
> b\course-project-taxes-tariffs\course-project-taxes-tariffs\scatterdeveloping.
> png", as(png) name("Graph")
(file C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-p
> roject-taxes-tariffs\course-project-taxes-tariffs\scatterdeveloping.png writte
> n in PNG format)

. twoway (histogram vat, color(blue%50)) (histogram international, color(red%50)
> )

. graph export "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHu
> b\course-project-taxes-tariffs\course-project-taxes-tariffs\histogramdevelopin
> g.png", as(png) name("Graph")
(file C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-p
> roject-taxes-tariffs\course-project-taxes-tariffs\histogramdeveloping.png writ
> ten in PNG format)

. clear

. use "C:\Users\ujbilgra\OneDrive - Syracuse University\Documents\GitHub\course-
> project-taxes-tariffs\course-project-taxes-tariffs\sortedultimatemerge.dta"

. scatter international vat

. drop if id == 1
(2,041 observations deleted)

. scatter international vat

. 
