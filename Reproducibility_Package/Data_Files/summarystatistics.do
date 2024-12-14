ssc install estout, replace
esttab using "table.tex", cells("count mean sd min max")
	estpost summarize international gdp consumption

