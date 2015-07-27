/***********************************************
/* FINAL CASE STUDY - HORSE RACING
/* Recommendations to a client on how to maximize handle
/* STEP 3.a: Data Preparation - finding out the deciles of purse_usa in 
/* RACE dataset to make appropriate class boundaries
/* -----------------------------------------------------------
/***********************************************/


LIBNAME WK17 '/folders/myshortcuts/myfolder/SSCode/20150724/Datasets';


/** Doing a UNIVARIATE Exploration on purse_usa **/
PROC UNIVARIATE
	DATA=WK17.RACE;
	VAR purse_usa;
	HISTOGRAM;
RUN;


/** Creating 200 groups in purse_usa **/
PROC RANK
	DATA=WK17.RACE (KEEP=purse_usa)
	OUT=WK17.PURSE_GROUPS
	GROUPS=200
	DESCENDING;
	VAR purse_usa;
	RANKS purse_usa_groups;
RUN;

/** Sorting by purse_usa_groups */
PROC SORT
	DATA=WK17.PURSE_GROUPS;
	BY purse_usa_groups;
RUN;

/** Finding out the Group boundaries for each decile to build the model **/
PROC MEANS N MIN MAX
	DATA=WK17.PURSE_GROUPS;
	VAR purse_usa;
	CLASS purse_usa_groups;
	TITLE1 "The purse_usa group min max to build the model and";
	TITLE2 "understand the frequencies in different price ranges";
	TITLE4 "The model we will build will be in the following groupings:";
	TITLE5 "<=10K (default-no explict dummy variable) , <=25K, <=30K , <=40K";
	TITLE6 "<=100K, >100K - 6 groups";
RUN;