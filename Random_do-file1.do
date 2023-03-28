************* Use ralloc procedure for randomization of Adults ******************************************
*********************************************************************************************************
*********************************************************************************************************

**************** Randomize the first 16 Adults of AC2 and AV1
ralloc block size treatment, nsubj(16) nt(2) osiz(1) ra(3) init(4) eq idvar(trtid) trtlab(veror chadox) sav(Adults_1) seed(567898)


**Generate column for treatment code
generate trtmt_alloc = "adult"

**Generate a string variable for treatment
decode treatment, generate (treatment2)

**Replace observations in trtmt_alloc viriable
replace trtmt_alloc = "AV1" if treatment2=="veror"
replace trtmt_alloc = "AC2" if block == 1 & treatment2 =="chadox" 
replace trtmt_alloc = "AC2" if block == 2 & treatment2 =="chadox" 
replace trtmt_alloc = "AC2" if block == 3 & treatment2 =="chadox" 
replace trtmt_alloc = "AC2" if block == 4 & treatment2 =="chadox" 
clear

**************** Randomize Adults for High dose --> 33 AC3 and 11 AV1
ralloc block size treatment, nsubj(44) nt(2) osiz(1) ra(3) init(4) eq idvar(trtid) trtlab(veror chadox) sav(Adults_2a) seed(988765)


**Generate column for treatment code
generate trtmt_alloc = "adult"

**Generate a string variable for treatment
decode treatment, generate (treatment2)

**Replace observations in trtmt_alloc variable
replace trtmt_alloc = "AV1" if treatment2=="veror"
replace trtmt_alloc = "AC3" if block == 1 & treatment2 == "chadox"
replace trtmt_alloc = "AC3" if block == 2 & treatment2 == "chadox"
replace trtmt_alloc = "AC3" if block == 3 & treatment2 == "chadox"
replace trtmt_alloc = "AC3" if block == 4 & treatment2 == "chadox"
replace trtmt_alloc = "AC3" if block == 5 & treatment2 == "chadox"
replace trtmt_alloc = "AC3" if block == 6 & treatment2 == "chadox"
replace trtmt_alloc = "AC3" if block == 7 & treatment2 == "chadox"
replace trtmt_alloc = "AC3" if block == 8 & treatment2 == "chadox"
replace trtmt_alloc = "AC3" if block == 9 & treatment2 == "chadox"
replace trtmt_alloc = "AC3" if block == 10 & treatment2 == "chadox"
replace trtmt_alloc = "AC3" if block == 11 & treatment2 == "chadox"
clear

******************* Append Adults_1 to Adults_2a
append using Adults_1 Adults_2a
drop treatment2
sav Adults_HighDose2


**Check for duplicates wrt trtid
duplicates report trtid

**Remove variable StratID
drop StratID

**Generate volunteer ID variable
gen volunteer_ID = ""

**Rearrange variables
order volunteer_ID trtid block size SeqInBlk treatment trtmt_alloc

**Generate variable for Immunology subset for the first 15 participants in AC3 and AV1
generate immuno_sbst = "N"

replace immuno_sbst = "Y" if trtmt_alloc == "AV1"

replace immuno_sbst = "Y" if trtmt_alloc == "AC3" & block ==1
replace immuno_sbst = "Y" if trtmt_alloc == "AC3" & block ==2
replace immuno_sbst = "Y" if trtmt_alloc == "AC3" & block ==3
replace immuno_sbst = "Y" if trtmt_alloc == "AC3" & block ==4
replace immuno_sbst = "Y" if trtmt_alloc == "AC3" & block ==5

** Rearrange variables
order volunteer_ID trtid treatment trtmt_alloc block size SeqInBlk immuno_sbst
clear 


**************** Randomize Adults for Low dose --> 42 AC3 and 11 AV1
ralloc block size treatment, nsubj(53) nt(5) osiz(1) eq idvar(trtid) trtlab(chadox chadox chadox chadox veror) sav(Adults_2b) seed(87654)

**Generate column for treatment code
generate trtmt_alloc = "adult"

**Generate a string variable for treatment
decode treatment, generate (treatment2)

**Replace observations in trtmt_alloc variable
replace trtmt_alloc = "AV1" if treatment2=="veror"
replace trtmt_alloc = "AC3" if treatment2 == "chadox"
clear


******************* Append Adults_1 with Adults_2b and Drop last 2 observations from dataframe to make a total of 69 number of subjects
append using Adults_1 Adults_2b 
drop in 70/7
sav Adults_LowDose

**Remove variables, rename
drop StratID
drop treatment
rename treatment2 treatment

**Generate volunteer ID variable
gen volunteer_ID = ""

** Rearrange variables
order volunteer_ID trtid treatment trtmt_alloc block size SeqInBlk









 

**Generate column for treatment allocation 
generate treatmt_alloc = "adult"

**Replace observations in treatmt_code variable 
replace treatmt_alloc = "AV1" if treatment_new=="veror"

replace treatmt_alloc = "AC2" if block == 1 & size==4 & treatment_new == "chadox"
replace treatmt_alloc = "AC2" if block == 2 & size==4 & treatment_new == "chadox"
replace treatmt_alloc = "AC2" if block == 3 & size==4 & treatment_new == "chadox"
replace treatmt_alloc = "AC2" if block == 4 & size==4 & treatment_new == "chadox"
replace treatmt_alloc = "AC3" if block == 1 & size==5 & treatment_new == "chadox"
replace treatmt_alloc = "AC3" if block == 2 & size==5 & treatment_new == "chadox"
replace treatmt_alloc = "AC3" if block == 3 & size==5 & treatment_new == "chadox"
replace treatmt_alloc = "AC3" if block == 4 & size==5 & treatment_new == "chadox"
replace treatmt_alloc = "AC3" if block == 5 & size==5 & treatment_new == "chadox"
replace treatmt_alloc = "AC3" if block == 6 & size==5 & treatment_new == "chadox"
replace treatmt_alloc = "AC3" if block == 7 & size==5 & treatment_new == "chadox"
replace treatmt_alloc = "AC3" if block == 8 & size==5 & treatment_new == "chadox"
replace treatmt_alloc = "AC3" if block == 9 & size==5 & treatment_new == "chadox"
replace treatmt_alloc = "AC3" if block == 10 & size==5 & treatment_new == "chadox"
replace treatmt_alloc = "AC3" if block == 11 & size==5 & treatment_new == "chadox"









** Generate variable for immunology subset for the first 15 participants in AC3 and AV1
generate immuno_sbst = "N"

replace immuno_sbst = "Y" if trtmt_alloc == "AV1"

replace immuno_sbst = "Y" if trtmt_alloc == "AC3" & block ==1 & size==5
replace immuno_sbst = "Y" if trtmt_alloc == "AC3" & block ==2 & size==5
replace immuno_sbst = "Y" if trtmt_alloc == "AC3" & block ==3 & size==5
replace immuno_sbst = "Y" if trtmt_alloc == "AC3" & block ==4 & size==5 & SeqInBlk ==4
replace immuno_sbst = "Y" if trtmt_alloc == "AC3" & block ==4 & size==5 & SeqInBlk ==2
replace immuno_sbst = "Y" if trtmt_alloc == "AC3" & block ==4 & size==5 & SeqInBlk ==3

** Rearrange variables
order volunteer_ID trtid treatment trtmt_alloc block size SeqInBlk immuno_sbst
clear



************* Use ralloc procedure for randomization of Paediatrics **************************************
**********************************************************************************************************
**********************************************************************************************************

***************************** Randomize the first 28 Paediatrics of PC2, PV1 and PV2
ralloc block size treatment, nsubj(28) nt(7) osiz(1) eq idvar(trtid) trtlab(A A A B B C C) sav(Paed_1) strat(1)


**Generate column for treatment code
generate trtmt_alloc = "paed"

**Generate a string variable for treatment
decode treatment, generate (treatment2)

**Replace observations in trtmt_alloc variable
replace trtmt_alloc = "PC2" if treatment2 == "A" 
replace trtmt_alloc = "PV1" if treatment2 == "B"
replace trtmt_alloc = "PV2" if treatment2 == "C"
clear
****************************** Randomize paediatrics for high dose --> 33 PC3 and 22 PV1 and 22 PV2
ralloc block size treatment, nsubj(77) nt(7) osiz(1) eq idvar(trtid) trtlab(A A A B B C C) sav(Paed_2a) strat(1)

**Generate column for treatment code
generate trtmt_alloc = "paed"

**Generate a string variable for treatment
decode treatment, generate (treatment2)

**Replace observations in trtmt_alloc variable
replace trtmt_alloc = "PC3" if block == 1 & treatment2 == "A"
replace trtmt_alloc = "PV1" if block == 1 & treatment2 == "B"
replace trtmt_alloc = "PV2" if block == 1 & treatment2 == "C"

replace trtmt_alloc = "PC3" if block == 2 & treatment2 == "A"
replace trtmt_alloc = "PV1" if block == 2 & treatment2 == "B"
replace trtmt_alloc = "PV2" if block == 2 & treatment2 == "C"

replace trtmt_alloc = "PC3" if block == 3 & treatment2 == "A"
replace trtmt_alloc = "PV1" if block == 3 & treatment2 == "B"
replace trtmt_alloc = "PV2" if block == 3 & treatment2 == "C"

replace trtmt_alloc = "PC3" if block == 4 & treatment2 == "A"
replace trtmt_alloc = "PV1" if block == 4 & treatment2 == "B"
replace trtmt_alloc = "PV2" if block == 4 & treatment2 == "C"

replace trtmt_alloc = "PC3" if block == 5 & treatment2 == "A"
replace trtmt_alloc = "PV1" if block == 5 & treatment2 == "B"
replace trtmt_alloc = "PV2" if block == 5 & treatment2 == "C"

replace trtmt_alloc = "PC3" if block == 6 & treatment2 == "A"
replace trtmt_alloc = "PV1" if block == 6 & treatment2 == "B"
replace trtmt_alloc = "PV2" if block == 6 & treatment2 == "C"

replace trtmt_alloc = "PC3" if block == 7 & treatment2 == "A"
replace trtmt_alloc = "PV1" if block == 7 & treatment2 == "B"
replace trtmt_alloc = "PV2" if block == 7 & treatment2 == "C"

replace trtmt_alloc = "PC3" if block == 8 & treatment2 == "A"
replace trtmt_alloc = "PV1" if block == 8 & treatment2 == "B"
replace trtmt_alloc = "PV2" if block == 8 & treatment2 == "C"

replace trtmt_alloc = "PC3" if block == 9 & treatment2 == "A"
replace trtmt_alloc = "PV1" if block == 9 & treatment2 == "B"
replace trtmt_alloc = "PV2" if block == 9 & treatment2 == "C"

replace trtmt_alloc = "PC3" if block == 10 & treatment2 == "A"
replace trtmt_alloc = "PV1" if block == 10 & treatment2 == "B"
replace trtmt_alloc = "PV2" if block == 10 & treatment2 == "C"

replace trtmt_alloc = "PC3" if block == 11 & treatment2 == "A"
replace trtmt_alloc = "PV1" if block == 11 & treatment2 == "B"
replace trtmt_alloc = "PV2" if block == 11 & treatment2 == "C"
clear

******************* Append Paed_1 to Paed_2a
append using Paed_1 Paed_2a
sav Paed_HighDose

**Drop last two observations
drop
clear

**Remove variable StratID and treatment
drop StratID
drop treatment2

**Generate volunteer ID variable
gen volunteer_ID = ""


**Generate variable for Immunology subset for the first 15 participants in PC3 and PV1
generate immuno_sbst = "N"

replace immuno_sbst = "Y" if trtmt_alloc == "PC3" & block ==1
replace immuno_sbst = "Y" if trtmt_alloc == "PC3" & block ==2
replace immuno_sbst = "Y" if trtmt_alloc == "PC3" & block ==3
replace immuno_sbst = "Y" if trtmt_alloc == "PC3" & block ==4 
replace immuno_sbst = "Y" if trtmt_alloc == "PC3" & block ==5 

replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==1 & SeqInBlk ==3
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==1 & SeqInBlk ==7
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==2 & SeqInBlk ==1
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==2 & SeqInBlk ==4
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==3 & SeqInBlk ==6 & trtid =="52" 
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==3 & SeqInBlk ==7
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==4 & SeqInBlk ==5
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==4 & SeqInBlk ==6
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==1 & SeqInBlk ==1
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==1 & SeqInBlk ==4
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==2 & SeqInBlk ==6
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==2 & SeqInBlk ==7
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==3 & SeqInBlk ==6 & trtid =="099" 
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==3 & SeqInBlk ==5
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==4 & SeqInBlk ==1

order volunteer_ID trtid treatment trtmt_alloc block size SeqInBlk immuno_sbst
clear

****************************** Randomize paediatrics for low dose --> 42 PC3 and 22 PV1 and 22 PV2
ralloc block size treatment, nsubj(86) nt(4) osiz(1) eq idvar(trtid) trtlab(A A B C) sav(Paed_2b) strat(1)

**Generate column for treatment code
generate trtmt_alloc = "paed" 

**Generate a string variable for treatment
decode treatment, generate(treatment2)

**Replace observations in trtmt_alloc variable
replace trtmt_alloc = "PC3" if treatment2 == "A"
replace trtmt_alloc = "PV1" if treatment2 == "B"
replace trtmt_alloc = "PV2" if treatment2 == "C"
clear

********************** Append Paed_1 Paed_2b
append using Paed_1 Paed_2b
sav Paed_LowDose

** Drop last 2 observations
drop in 113
drop in 115

**Remove variable StratID and treatment
drop StratID
drop treatment
rename treatment2 treatment

**Generate volunteer ID variable
gen volunteer_ID = ""

** Rearrange variables
order volunteer_ID trtid treatment2 trtmt_alloc block size SeqInBlk 

**Generate variable for Immunology subset for the first 15 participants in PC3 and PV1
generate immuno_sbst = "N"

replace immuno_sbst = "Y" if trtmt_alloc == "PC3" & block ==1 & size==4
replace immuno_sbst = "Y" if trtmt_alloc == "PC3" & block ==2 & size==4
replace immuno_sbst = "Y" if trtmt_alloc == "PC3" & block ==3 & size==4
replace immuno_sbst = "Y" if trtmt_alloc == "PC3" & block ==4 & size==4
replace immuno_sbst = "Y" if trtmt_alloc == "PC3" & block ==5 & size==4
replace immuno_sbst = "Y" if trtmt_alloc == "PC3" & block ==6 & size==4
replace immuno_sbst = "Y" if trtmt_alloc == "PC3" & block ==7 & size==4
replace immuno_sbst = "Y" if trtmt_alloc == "PC3" & block ==8 & size==4 & SeqInBlk==2

replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==1 & size==7
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==2 & size==7
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==3 & size==7
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==4 & size==7
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==1 & size==4
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==2 & size==4
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==3 & size==4
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==4 & size==4
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==5 & size==4
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==6 & size==4
replace immuno_sbst = "Y" if trtmt_alloc == "PV1" & block ==7 & size==4

sav Paed_LowDose


***************** Append Adult_HighDose and Paed_HighDose *********************
*******************************************************************************

clear
append using Adults_HighDose2 Paed_HighDose
sav HighDose

**Inspect the dataset
codebook trtmt_alloc
codebook immuno_sbst
duplicates report trtid


**** Generate column for treatment_no based on trtid variable/column
local len = 3
gen var1 = 10^(3-length(trtid))
gen var2 = real(trtid) * var1
gen treatment_no = string(var2, "%03.0f")
gen treatment_no2 = treatment_no + "A"
 

*** Drop extra variables 
drop trtid treatment block size SeqInBlk var1 var2 treatment_no 
drop volunteer_ID

*** Add blank variables
gen SN = ""
gen SCR_NO = ""
gen Pharm_Init = ""
gen DATE = ""
gen VERIF_Init = ""
gen DATE2 = ""


*** Order columns
order SN SCR_NO treatment_~2 trtmt_alloc immuno_sbst Pharm_Init DATE VERIF_Init DATE2



***************** Append Adult_LowDose and Paed_LowDose *********************
*******************************************************************************
clear
append using Adults_LowDose Paed_LowDose
sav LowDose

**** Generate column for treatment_no based on trtid variable/column
local len = 3
gen var1 = 10^(3-length(trtid))
gen var2 = real(trtid) * var1
gen treatment_no = string(var2, "%03.0f")
gen treatment_no2 = treatment_no + "A"
 
*** Drop extra variables and reorder columns
drop trtid treatment block size SeqInBlk var1 var2 treatment_no
drop volunteer_ID 

*** Add blank variables
gen SN = ""
gen SCR_NO = ""
gen Pharm_Init = ""
gen DATE = ""
gen VERIF_Init = ""
gen DATE2 = ""

order SN SCR_NO treatment_~2 trtmt_alloc immuno_sbst Pharm_Init DATE VERIF_Init DATE2
clear
***************** Create sub-lists for Coordinator

********** Coordinator_HigDose
keep SN SCR_NO treatment_~2 Pharm_Init DATE VERIF_Init DATE2
clear 

********** Coordinator_LowDose 
keep SN SCR_NO treatment_~2 Pharm_Init DATE VERIF_Init DATE2








