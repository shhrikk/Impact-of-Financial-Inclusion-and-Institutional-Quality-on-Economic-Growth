doedit "C:\Users\dethe\Documents\miniproject\FINAL_PCA\command_file.do" 
log using "A:\iit kanpur\Semester 2\ECO 613 economic data analysis\mini project\Final Submission\3) Unit Root Test\Tracking_log_file_unit_root_test.smcl"
import excel "A:\iit kanpur\Semester 2\ECO 613 economic data analysis\mini project\Final Submission\3) Unit Root Test\unit_root.xlsx", sheet("final") firstrow clear
* making a country_id column for each country
egen country_id = group(Country)
* checking for strongly balanced data
xtset country_id Year
* Running final unit root test and putting the statistic value in excel sheet
xtunitroot llc d.FIINDEX, trend
xtunitroot ips d.FIINDEX, trend
xtunitroot llc d.INSTDEX, trend
xtunitroot ips d.INSTDEX, trend
xtunitroot llc d.LRGDP , trend
xtunitroot ips d.LRGDP , trend
xtunitroot llc d.GDPGR , trend
xtunitroot ips d.GDPGR , trend
xtunitroot llc d.LPCRGDP , trend
xtunitroot ips d.LPCRGDP , trend
* Unit root test for control variables
* INF column gives unit root statistic value (pvalue < alpha) without the need for first differencing
xtunitroot llc INF, lags(0)
xtunitroot ips INF, lags(0)
* Unit root test for other control variables require first differencing, then only p-value<alpha for both llc and ips test
xtunitroot llc d.TOP
xtunitroot ips d.TOP
xtunitroot llc d.UER
xtunitroot ips d.UER
xtunitroot llc d.LINV
xtunitroot ips d.LINV
xtunitroot llc d.TNRR
xtunitroot ips d.TNRR
log close
