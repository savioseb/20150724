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




