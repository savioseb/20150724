/***********************************************
/* FINAL CASE STUDY - HORSE RACING
/* Recommendations to a client on how to maximize handle
/* STEP 4: Preparing Development and Training Datasets
/* -----------------------------------------------------------
/***********************************************/


LIBNAME WK17 '/folders/myshortcuts/myfolder/SSCode/20150724/Datasets';


/** Splitting the Data into Development and Validation Samples **/
DATA WK17.DEVELOPMENT_SAMPLE WK17.VALIDATION_SAMPLE ;

	SET WK17.RACE_EXOTIC_PAYOFF_MERGE;
	
	IF RANUNI(100) < 0.7 
		THEN 
			OUTPUT WK17.DEVELOPMENT_SAMPLE; 
		ELSE 
			OUTPUT WK17.VALIDATION_SAMPLE;
RUN;



/** Also Creating Development and Validation Datasets for each track 
- to create separate models for each track **/



/** CRC Track: Splitting the Data into Development and Validation Samples **/
DATA WK17.CRC_DEVELOPMENT_SAMPLE WK17.CRC_VALIDATION_SAMPLE ;

	SET WK17.RACE_EXOTIC_PAYOFF_MERGE;
	WHERE track_id = "CRC";
	
	IF RANUNI(100) < 0.7 
		THEN 
			OUTPUT WK17.CRC_DEVELOPMENT_SAMPLE; 
		ELSE 
			OUTPUT WK17.CRC_VALIDATION_SAMPLE;
RUN;




/** AP Track: Splitting the Data into Development and Validation Samples **/
DATA WK17.AP_DEVELOPMENT_SAMPLE WK17.AP_VALIDATION_SAMPLE ;

	SET WK17.RACE_EXOTIC_PAYOFF_MERGE;
	WHERE track_id = "AP";
	
	IF RANUNI(100) < 0.7 
		THEN 
			OUTPUT WK17.AP_DEVELOPMENT_SAMPLE; 
		ELSE 
			OUTPUT WK17.AP_VALIDATION_SAMPLE;
RUN;



/** FG Track: Splitting the Data into Development and Validation Samples **/
DATA WK17.FG_DEVELOPMENT_SAMPLE WK17.FG_VALIDATION_SAMPLE ;

	SET WK17.RACE_EXOTIC_PAYOFF_MERGE;
	WHERE track_id = "FG";
	
	IF RANUNI(100) < 0.7 
		THEN 
			OUTPUT WK17.FG_DEVELOPMENT_SAMPLE; 
		ELSE 
			OUTPUT WK17.FG_VALIDATION_SAMPLE;
RUN;



