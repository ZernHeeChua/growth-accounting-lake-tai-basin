//VERSION: PWT 11.0; Feenstra, Inklaar, and Timmer (2015)//

drop if year <= 1994
keep if countrycode == "CHN"
keep countrycode country year pop hc cgdpo rnna

***************
//OUTPUT (Y)//
***************

gen TH_nomY_亿元 = 上海_nomY + 苏州_nomY + 无锡_nomY +常州_nomY + 湖州_nomY + 嘉兴_nomY  // Before summing, input the nominal GDP for each of the six prefectures or municipalities on one's own

gen convrate = CHN_nomY*100/cgdpo

gen TH_cgdpo_milint2021 = TH_nomY_亿元*100/convrate
gen TH_y_milint2021 = TH_cgdpo_milint2021/TH_pop_mil
gen yratio_act = TH_y_milint2021[_n]/20195.7

***************
//CAPITAL (K)//
***************

gen TH_nomI_亿元 = 上海_nomI + 苏州_nomI + 无锡_nomI +常州_nomI + 湖州_nomI + 嘉兴_nomI

gen TH_I_milint2021 = TH_nomI_亿元*100/convrate

gen TH_K_milint2021 = cond(_n == 1, 766250, TH_K_milint2021[_n-1]*(1-0.099) + TH_I_milint2021[_n])  // This step uses the Perpetual Inventory Method over 28 years, so a justifiable estimation of initial capital stock (estimated from PWT 11.0) is permissible. Assume depreciation rate = 0.05, and calculated separately are  the average population growth rate = 0.0373 and the rate of technological progress = 0.0117. This yields 0.099.

gen TH_k_milint2021 = TH_K_milint2021/TH_pop_mil 
gen kratio = TH_k_milint2021[_n]/48743.7

*********
//GRAPH//
*********

gen plot = year if year == 1995 | year == 2000 | year == 2005 | year == 2010 | year == 2015 | year == 2020 | year == 2023 

gen yratio_pred = kratio^0.42 // Capital share of income is taken to be whole of China's at 0.42 (Ashraf and Weil, 2024).

twoway (scatter yratio_act yratio_pred, mlabel(plot) mlabcolor(navy) mfcolor(%20) mlcolor(navy)) (lfit yratio_act yratio_pred, lcolor(purple) lwidth(medthick)) (function x = x, range(1 3) lpattern(dash) lcolor(navy)), ytitle("Actual income per capita relative to 1995") ylabel(1.0(0.5)3.0, nogrid) xtitle("Predicted income per capita relative to 1995") xlabel(1.0(0.5)3.0, nogrid) legend(off) 
