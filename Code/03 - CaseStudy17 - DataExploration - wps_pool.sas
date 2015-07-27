/***********************************************
/* FINAL CASE STUDY - HORSE RACING
/* Recommendations to a client on how to maximize handle
/* STEP 2b: Data Exploration - Exploring relationships between differen variables and wps_pool
/* -----------------------------------------------------------
/***********************************************/


LIBNAME WK17 '/folders/myshortcuts/myfolder/SSCode/20150724/Datasets';



/** Creating groups of wps_pool **/
PROC RANK
	DATA=WK17.RACE
	OUT=WK17.RACE_WPS_POOL_GROUPS
	GROUPS=20;
	VAR wps_pool;
	RANKS wps_pool_groups;
RUN;

/** PROC SORT on wps_pool_groups **/
PROC SORT
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	BY wps_pool_groups;
RUN;




/** Exploring wps_pool_groups **/
PROC MEANS N MIN MAX
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	VAR wps_pool;
	CLASS wps_pool_groups;
	TITLE "Exploring wps_pool_groups";
RUN;


/** Exploring conditions_of_race * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES conditions_of_race * wps_pool_groups;
	TITLE1 "Exploring conditions_of_race * wps_pool_groups";
RUN;

/** Exploring age_restriction * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES age_restriction * wps_pool_groups;
	TITLE1 "Exploring age_restriction * wps_pool_groups";
RUN;


/** Exploring sex_restriction * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES sex_restriction * wps_pool_groups;
	TITLE1 "Exploring sex_restriction * wps_pool_groups";
RUN;



/** Exploring race_number * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES race_number * wps_pool_groups;
	TITLE1 "Exploring race_number * wps_pool_groups";
RUN;



/** Exploring stakes_indicator * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES stakes_indicator * wps_pool_groups;
	TITLE1 "Exploring stakes_indicator * wps_pool_groups";
RUN;


/** Exploring distance_id * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES distance_id * wps_pool_groups;
	TITLE1 "Exploring distance_id * wps_pool_groups";
RUN;

/** Exploring course_type * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES course_type * wps_pool_groups;
	TITLE1 "Exploring course_type * wps_pool_groups";
RUN;

/** PROC FREQ Tabulating surface * course_type **/
PROC FREQ
	DATA=WK17.RACE;
	TABLES surface * course_type;
	TITLE1 "PROC FREQ Tabulating surface * course_type";
	TITLE2 "They are the same - only one is required to develop the model";
RUN;


/** Exploring course_type * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES course_type * scheduled_surface;
	TITLE1 "Exploring course_type * wps_pool_groups";
RUN;



/** Exploring course_type * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES scheduled_surface;
	TITLE1 "Exploring course_type * wps_pool_groups";
RUN;


/** Exploring about_distance_indicator * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES about_distance_indicator * wps_pool_groups;
	TITLE1 "Exploring about_distance_indicator * wps_pool_groups";
RUN;


/** Exploring track_condition * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES track_condition * wps_pool_groups;
	TITLE1 "Exploring track_condition * wps_pool_groups";
RUN;


/** Exploring track_condition * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES weather * wps_pool_groups;
	TITLE1 "Exploring track_condition * wps_pool_groups";
RUN;



/** Exploring breed_type * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES breed_type * wps_pool_groups;
	TITLE1 "Exploring breed_type * wps_pool_groups";
RUN;





/** Exploring start_description * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES start_description * wps_pool_groups;
	TITLE1 "Exploring start_description * wps_pool_groups";
RUN;




/** Exploring minimum_claim_price * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES minimum_claim_price * wps_pool_groups;
	TITLE1 "Exploring minimum_claim_price * wps_pool_groups";
RUN;


/** Exploring maximum_claim_price * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES maximum_claim_price * wps_pool_groups;
	TITLE1 "Exploring maximum_claim_price * wps_pool_groups";
RUN;


/** Exploring grade * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES grade * wps_pool_groups;
	TITLE1 "Exploring grade * wps_pool_groups";
RUN;

number_of_runners

/** Exploring number_of_runners * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES number_of_runners * wps_pool_groups;
	TITLE1 "Exploring number_of_runners * wps_pool_groups";
RUN;



/** Exploring abbreviated_name * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES abbreviated_name * wps_pool_groups;
	TITLE1 "Exploring abbreviated_name * wps_pool_groups";
RUN;




/** Exploring track_sealed_indicator * wps_pool_groups **/
PROC FREQ
	DATA=WK17.RACE_WPS_POOL_GROUPS;
	TABLES track_sealed_indicator * wps_pool_groups;
	TITLE1 "Exploring track_sealed_indicator * wps_pool_groups";
RUN;
