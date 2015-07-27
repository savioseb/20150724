/***********************************************
/* FINAL CASE STUDY - HORSE RACING
/* Recommendations to a client on how to maximize handle
/* STEP 7: Make Model for CRC Track
/* -----------------------------------------------------------
/***********************************************/

LIBNAME WK17 '/folders/myshortcuts/myfolder/SSCode/20150724/Datasets';

/** Creating the Model **/
PROC REG 
	DATA=WK17.CRC_DEVELOPMENT_SAMPLE 
	OUTEST=WK17.CRC_HANDLE_LINEAR_MODEL; 
  	CRC_TRACK: MODEL 
  		 handle = 
			wps_pool
			total_pool_sum
			
			race_number_1 
			race_number_2 
			race_number_3 
			race_number_4 
			race_number_5 
			race_number_6 
			race_number_7 
			race_number_8 
			race_number_9 
			race_number_10
			race_number_11
			race_number_12
			race_number_13
			
			conditions_of_race_NW2_L
			conditions_of_race_NW1_X
			conditions_of_race_NW2_X
			conditions_of_race_NW3_L
			conditions_of_race_C    
			conditions_of_race_NW3_X
			conditions_of_race_OTHER
			
			race_type_CLM
			race_type_MCL
			race_type_MSW
			race_type_AOC
			race_type_ALW
			race_type_STK
			race_type_STR
			race_type_CAN
			
			age_restriction_3U
			age_restriction_02
			age_restriction_34
			age_restriction_03
			age_restriction_4U
			
			sex_restriction_B
			sex_restriction_F
			
			stakes_indicator_N
			
			distance_id_600 
			distance_id_800 
			distance_id_850 
			distance_id_550 
			distance_id_700 
			distance_id_500 
			distance_id_650 
			distance_id_900 
			distance_id_832 
			distance_id_450 
			distance_id_750 
			distance_id_1200
			distance_id_1000
			distance_id_200 
			distance_id_950 
			
			about_distance_indicator_A
			
			course_type_T
			
			purse_usa_30K
			purse_usa_40K
			purse_usa_100K
			purse_usa_MT_100K
			
			track_condition_FT
			track_condition_FM
			track_condition_SY
			track_condition_GD
			track_condition_YL
			track_condition_WF
			
			weather_C
			weather_L
			weather_O
			weather_R
			
			minimum_claim_price___0
			minimum_claim_price_10K
			minimum_claim_price_16K
			minimum_claim_price_25K
			minimum_claim_price_12K
			minimum_claim_price_40K
			minimum_claim_price_20K
			minimum_claim_price_50K
			minimum_claim_price__5K
			minimum_claim_price_32K
			minimum_claim_price__9K
			minimum_claim_price__8K
			minimum_claim_price_62K
			minimum_claim_price__6K
			
			maximum_claim_price____0
			maximum_claim_price__10K
			maximum_claim_price__25K
			maximum_claim_price__16K
			maximum_claim_price__12K
			maximum_claim_price__40K
			maximum_claim_price__50K
			maximum_claim_price___5K
			maximum_claim_price__20K
			maximum_claim_price__32K
			maximum_claim_price___8K
			
			grade_1
			grade_2
			grade_3
			
			number_of_runners__4
			number_of_runners__5
			number_of_runners__6
			number_of_runners__7
			number_of_runners__8
			number_of_runners__9
			number_of_runners_10
			number_of_runners_11
			number_of_runners_12
			
			abbreviated_name_RACE_HAS
			
			track_sealed_indicator_Y
			track_sealed_indicator_N
			
			race_date_Cinco_Mayo  
			race_date_Memorial_Day
			race_date_Indep_Day   
			race_date_Labor_Day   
			race_date_Veterans_Day
			race_date_Thanksgiving 
			race_date_Boxing_Day  
			race_date_New_Year_Day
			
			race_weekday_Sun
			race_weekday_Mon
			race_weekday_Wed
			race_weekday_Thu
			race_weekday_Fri
			race_weekday_Sat;
  	OUTPUT 
  		OUT = WK17.CRC_DEVELOPMENT_SAMPLE_PRED 
  		PREDICTED = handle_predicted
  		RESIDUAL = handle_residuals;
 
  	TITLE1 "Linear Model for CRC Track using Development Dataset";
RUN;