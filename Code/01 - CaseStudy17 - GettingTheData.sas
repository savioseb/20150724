/***********************************************
/* FINAL CASE STUDY - HORSE RACING
/* Recommendations to a client on how to maximize handle
/* STEP 1: Get the Data and Filter the data to our analysis
/* -----------------------------------------------------------
/* Customer is interested only in Tracks with IDs: CRC, AP, and FG
/* Also year of analysis should be limited to 2005 - 2006
/***********************************************/


/** Library names for the Original Dataset and the Working Datasets */
LIBNAME CS17 '/folders/myshortcuts/myfolder/Foundation Exercises/Assignments/Class17 - Final Case Study';
LIBNAME WK17 '/folders/myshortcuts/myfolder/SSCode/20150724/Datasets';


/** Creating A working TRACK Dataset filtering for Tracks with IDs:  CRC, AP, and FG */
DATA WK17.TRACK;
	SET CS17.track;
	WHERE 
		track_id = "AP" OR 
		track_id = "FG" OR 
		track_id = "CRC";
RUN;
	
/** Creating a Working TRACK_ZONE Dataset **/	
DATA WK17.TRACK_STATISTIC;
	SET CS17.track_statistic;
	WHERE 
		( 
			track_id = "AP" OR 
			track_id = "FG" OR 
			track_id = "CRC" 
		)  AND
		( 
			YEAR( DATEPART( race_date) ) = 2005 OR 
			YEAR( DATEPART( race_date) )= 2006
		);
	race_date_in_date = DATEPART( race_date);
	FORMAT race_date_in_date date9.;
RUN;
		
		
/** Creating a Working RACE Dataset **/
DATA WK17.RACE;
	SET CS17.RACE;
	WHERE 
		( 
			track_id = "AP" OR 
			track_id = "FG" OR 
			track_id = "CRC" 
		)  AND
		( 
			YEAR( DATEPART( race_date) ) = 2005 OR 
			YEAR( DATEPART( race_date) )= 2006
		);
	race_date_in_date = DATEPART( race_date);
	FORMAT race_date_in_date date9.;
RUN;
				
		
/** Creating a Working EXOTIC_PAYOFF dataset **/
DATA WK17.EXOTIC_PAYOFF;
	SET CS17.EXOTIC_PAYOFF;
	WHERE 
		( 
			track_id = "AP" OR 
			track_id = "FG" OR 
			track_id = "CRC" 
		)  AND
		( 
			YEAR( DATEPART( race_date) ) = 2005 OR 
			YEAR( DATEPART( race_date) )= 2006
		);
	race_date_in_date = DATEPART( race_date);
	FORMAT race_date_in_date date9.;
RUN;
		
		
