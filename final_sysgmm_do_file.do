log using "A:\iit kanpur\Semester 2\ECO 613 economic data analysis\mini project\Final Submission\4) 2-step System GMM\final_sysgmm.smcl"
import excel "A:\iit kanpur\Semester 2\ECO 613 economic data analysis\mini project\Final Submission\4) 2-step System GMM\sysgmm_diff.xlsx", sheet("Sheet1") firstrow clear
xtset country_id Year
xtabond2 LPCRGDP L.LPCRGDP FIINDEX INSTDEX FIINDEXINSTDEX INF TOP UER LINV TNRR DUMMY_GFC, gmm(L.LPCRGDP,collapse) iv(INF TOP UER LINV TNRR, equation(level)) nodiffsargan robust twostep noconstant orthogonal small
xtabond2 LRGDP L.LRGDP FIINDEX INSTDEX FIINDEXINSTDEX INF TOP UER LINV TNRR DUMMY_GFC, gmm(L.LRGDP ,collapse) iv(INF TOP UER LINV TNRR, equation(level)) nodiffsargan robust twostep noconstant orthogonal small
xtabond2 GDPGR L.GDPGR FIINDEX INSTDEX FIINDEXINSTDEX INF TOP UER LINV TNRR DUMMY_GFC, gmm(L.GDPGR ,collapse) iv(INF TOP UER LINV TNRR, equation(level)) nodiffsargan robust twostep noconstant orthogonal small
log close
