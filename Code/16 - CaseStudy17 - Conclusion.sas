/***********************************************
/* FINAL CASE STUDY - HORSE RACING
/* Recommendations to a client on how to maximize handle
/* STEP 13: Putting it all together - Comparing the Models
/* -----------------------------------------------------------
/***********************************************/

LIBNAME WK17 '/folders/myshortcuts/myfolder/SSCode/20150724/Datasets';

/** Merging the models together to compare the coefficients **/
DATA WK17.MODELS_MERGE;
	SET WK17.HANDLE_LINEAR_MODEL WK17.AP_HANDLE_LINEAR_MODEL WK17.CRC_HANDLE_LINEAR_MODEL WK17.FG_HANDLE_LINEAR_MODEL;
RUN;


/** Transposing the merged Models **/
PROC TRANSPOSE
	DATA=WK17.MODELS_MERGE
	OUT=WK17.MODELS_MERGE_TRANSPOSE;
RUN;

DATA WK17.MODELS_MERGE_COL_NAMES;
	SET WK17.MODELS_MERGE_TRANSPOSE (
		RENAME=(
			COL1=Overall_Model 
			COL2=AP_Track
			COL3=CRC_Track
			COL4=FG_Track
			_NAME_=Variable_Name
			_LABEL_=Label
		) );
	FORMAT Overall_Model E10.;
	FORMAT AP_Track E10.;
	FORMAT CRC_Track E10.;
	FORMAT FG_Track E10.;
RUN;


PROC PRINT
	DATA=WK17.MODELS_MERGE_COL_NAMES;
	TITLE1 "Printing the coefficients of the various models";
RUN;