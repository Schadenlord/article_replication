
clear
capture log close

global adate "2023-10-20" /* Update for today's date */

*Setting global directory for file code*
global dir "C:\Dropbox\Institutional Memory\"  /*name the path where you saved the replication data file and where you want results to be saved*/

/*new dataset*/
use "$dir\Data\replication data.dta"


xtset countrycode year /*declares what is t and what is i*/

gen lngdp = ln(gdppc)
tab year, gen(y) 

global control1 "l.netoda_gdp_cons l.resource_rent l.lngdp l.gdpg l.warDummy l.christian_int 1.legor_uk l.legor_fr"
global control2 "l.netoda_gdp_cons l.resource_rent l.lngdp l.gdpg l.warDummy l.christian_int 1.legor_uk l.legor_fr l.coup "
global control3 "l.netoda_gdp_cons l.resource_rent l.lngdp l.gdpg l.warDummy l.christian_int 1.legor_uk l.legor_fr l.coup l.gini_disp"

global control5 "l5.netoda_gdp_cons l5.resource_rent l5.lngdp l5.gdpg l5.warDummy l5.christian_int 1.legor_uk l5.legor_fr l5.coup l5.gini_disp"

gen sample_full = 0
replace sample_full =1 if l.gdpg !=. & l.lngdp !=. & l.netoda_gdp_cons!=. & efw_index_1_int!=. & warDummy !=. & l.alternate !=. & l.christian_int!=. & l.resource_rent !=. & 1.legor_uk !=. 


*********************************************************************************************
/*Table 3 - Main Results*/ 
reg  efw_index_1_int l.index25a $control1 y* if sample_full==1, vce(cluster country)
generate sample = e(sample)
estimates store reg1
reg  efw_index_1_int l.index125a $control1 y* if sample_full==1, vce(cluster country)
estimates store reg11

reg  efw_index_1 l.index25a $control1 y* if sample_full==1, vce(cluster country)
estimates store reg2
reg  efw_index_1 l.index125a $control1 y* if sample_full==1, vce(cluster country)
estimates store reg22

xml_tab  reg1 reg11 reg2 reg22  using "$dir\tables_$adate", replace keep(l.index25a l.index125a $control1) font("Garamond" 11) below stats(N r2) sheet(T3) cnames("efw_int" "efw_int" "efw" "efw")


/*Table2 - Summary statistics Table 2*/
sum efw_index_1_int efw_index_1 if sample == 1
sum  index25a index5a index75a index10a index125a index15a alternate if sample == 1
sum netoda_gdp_cons l.resource_rent gdppc gdpg  warDummy christian_int legor_uk legor_fr  coup gini_disp if sample == 1


/*Table 4 Additional controls- Coup and Gini */ 
/*Interpolated Results*/
quietly reg  efw_index_1_int l.index25a $control2  y* if sample_full==1, vce(cluster country)
estimates store reg1
generate samplet41 = e(sample)
sum efw_index_1_int if samplet41

quietly reg  efw_index_1_int l.index25a $control3 y* if sample_full==1, vce(cluster country)
estimates store reg2
generate samplet42=e(sample)
sum efw_index_1_int if samplet42

quietly reg  efw_index_1_int l.index125a $control2  y* if sample_full==1, vce(cluster country)
estimates store reg3
generate samplet43 = e(sample)
sum efw_index_1_int if samplet43

quietly reg  efw_index_1_int l.index125a $control3 y* if sample_full==1, vce(cluster country)
estimates store reg4
generate samplet44=e(sample)
sum efw_index_1_int if samplet44



xml_tab  reg1 reg3 reg2  reg4   using "$dir\tables_$adate", append keep(l.index25a l.index125a $control3) font("Garamond" 11) below stats(N r2) sheet(T4-gini-coup) cnames("efw_int" "efw_int" "efw_int")


/*Table 5 - pooled OLS - 5 period lag - columns 1 and 2 */ 
/*interpolated*/
quietly reg  efw_index_1_int l5.index25a $control5 y* if sample_full==1, vce(cluster country)
estimates store reg1
generate samplet51= e(sample)
sum efw_index_1_int if samplet51

quietly reg  efw_index_1_int l5.index125a $control5 y* if sample_full==1, vce(cluster country)
estimates store reg2


xml_tab reg1 reg2 using "$dir\tables_$adate", append keep(l5.index25a l5.index125a $control5) font("Garamond" 11) below stats(N r2) sheet(POL_5) cnames("efw_int" "efw_int")


/*5 year periods - columns 3 and 4 in table 5*/
gen five = 0
replace five = 1 if year == 1965
replace five = 1 if efw_index_1 != . & year<2001
replace five = 1 if year == 2005
replace five = 1 if year == 2010
replace five = 1 if year == 2015


/*limiting to 5 year intervals*/
/*pooled OLS - 5 period lag*/ 
quietly reg  efw_index_1_int l.index25a $control3 y* if sample_full==1 & five==1, vce(cluster country)
estimates store reg1
generate samplet53 = e(sample)
sum efw_index_1_int if samplet53

quietly reg  efw_index_1_int l.index125a $control3 y* if sample_full==1 & five==1, vce(cluster country)
estimates store reg2

xml_tab  reg1 reg2  using "$dir\tables_$adate", append keep(l.index25a l.index125a $control3) font("Garamond" 11) below stats(N r2) sheet(POL_5int) cnames("efw_int" "efw_int")



/*Table 6 sub-sample analysis*/ 

/*creating the sample for countries who have been in sample for more than 10 years*/
gen sample_11 = sample_full
replace sample_11 = 0 if country == "Bahrain"
replace sample_11 = 0 if country == "Guinea"
replace sample_11 = 0 if country == "Cambodia"
replace sample_11 = 0 if country == "Lebanon"
replace sample_11 = 0 if country == "Bhutan"
replace sample_11 = 0 if country == "Liberia"
replace sample_11 = 0 if country == "Myanmar"
replace sample_11 = 0 if country == "Qatar"
replace sample_11 = 0 if country == "Azerbaijan"
replace sample_11 = 0 if country == "Gambia"
replace sample_11 = 0 if country == "Saudi Arabia"
replace sample_11 = 0 if country == "Suriname"
replace sample_11 = 0 if country == "Tajikistan"
replace sample_11 = 0 if country == "Timor-Leste"
replace sample_11 = 0 if country == "Congo, Rep."
replace sample_11 = 0 if country == "Kuwait"
replace sample_11 = 0 if country == "Chad"
replace sample_11 = 0 if country == "Congo, Dem. Rep."
replace sample_11 = 0 if country == "Montenegro"


/*creating the sample for countries who have been in sample for more than 20 years*/
gen sample_21 = sample_full
replace sample_21 = 0 if country == "Gabon"
replace sample_21 = 0 if country == "Togo"
replace sample_21 = 0 if country == "Angola"
replace sample_21 = 0 if country == "Bosnia and Herzegovina"
replace sample_21 = 0 if country == "Burkina Faso"
replace sample_21 = 0 if country == "Ethiopia"
replace sample_21 = 0 if country == "Kazakhstan"
replace sample_21 = 0 if country == "Kyrgyz Republic"
replace sample_21 = 0 if country == "Lesotho"
replace sample_21 = 0 if country == "Mauritania"
replace sample_21 = 0 if country == "Moldova"
replace sample_21 = 0 if country == "Oman"
replace sample_21 = 0 if country == "Armenia"
replace sample_21 = 0 if country == "Haiti"
replace sample_21 = 0 if country == "Mongolia"
replace sample_21 = 0 if country == "Benin"
replace sample_21 = 0 if country == "Georgia"
replace sample_21 = 0 if country == "Mozambique"
replace sample_21 = 0 if country == "Vietnam"
replace sample_21 = 0 if country == "Papua New Guinea"
replace sample_21 = 0 if country == "Guyana"
replace sample_21 = 0 if country == "Canada"
replace sample_21 = 0 if country == "Guinea-Bissau"
replace sample_21 = 0 if country == "Albania"
replace sample_21 = 0 if country == "Cameroon"
replace sample_21 = 0 if country == "Croatia"
replace sample_21 = 0 if country == "Estonia"
replace sample_21 = 0 if country == "Israel"
replace sample_21 = 0 if country == "Latvia"
replace sample_21 = 0 if country == "Lithuania"
replace sample_21 = 0 if country == "Slovenia"


gen sample_00 = 0
replace sample_00 = 1 if year>1999


local xmldo "append"
foreach var in 11 21 00 {

/*interpolated*/
quietly reg  efw_index_1_int l.index25a $control3 y* if sample_`var'==1, vce(cluster country)
estimates store reg1
generate samplet6`var'int = e(sample)
sum efw_index_1_int if samplet6`var'int

quietly reg  efw_index_1_int l.index125a $control3 y* if sample_`var'==1, vce(cluster country)
estimates store reg2

xml_tab  reg1 reg2 using "$dir\tables_$adate", `xmldo' keep(l.index25a l.index125a $control3) font("Garamond" 11) below stats(N r2) sheet(`var') cnames("efw_int" "efw_int")
local xmldo "append"

}

/*Table 7 -  comparisons of all - discount rates*/

quietly reg  efw_index_1_int l.alternate $control3  y* if sample_full==1, vce(cluster country)
estimates store reg1

quietly reg  efw_index_1_int l.index25a $control3  y* if sample_full==1, vce(cluster country)
estimates store reg2

quietly reg  efw_index_1_int l.index5a $control3  y* if sample_full==1, vce(cluster country)
estimates store reg3

quietly reg  efw_index_1_int l.index75a $control3  y* if sample_full==1, vce(cluster country)
estimates store reg4

quietly reg  efw_index_1_int l.index10a $control3  y* if sample_full==1, vce(cluster country)
estimates store reg5

quietly reg  efw_index_1_int l.index125a $control3  y* if sample_full==1, vce(cluster country)
estimates store reg6

quietly reg  efw_index_1_int l.index15a $control3  y* if sample_full==1, vce(cluster country)
generate sampleindex = e(sample)
estimates store reg7
sum efw_index_1_int if sampleindex == 1

xml_tab   reg2 reg3 reg4 reg5 reg6 reg7 reg1 using "$dir\tables_$adate", append keep(l.alternate l.index25a l.index5a l.index75a l.index10a l.index125a l.index15a $control3) font("Garamond" 11) below stats(N r2) sheet(disc) cnames( "2.5%" "5%" "7.5%" "10%" "12.5%" "15%" "alt")



/*Creating graphs*/
label var index25a "2.5% depreciation"
label var index125a "12.5% deprectiation"
label var alternate "alternate"

twoway	(tsline	index25a if	country	== "Chile" &  year>1969) (tsline index125a if country == "Chile" & year>1969) (tsline alternate if country == "Chile" & year>1969),	ytitle(`"Regime	Memory"') title(`"Chile"')
twoway	(tsline	index25a if	country	== "France" &  year>1969) (tsline index125a if country == "France" & year>1969) (tsline alternate if country == "France" & year>1969),	ytitle(`"Regime	Memory"') title(`"France"')


*********************************************************************************************



