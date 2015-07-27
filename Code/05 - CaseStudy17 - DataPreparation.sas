/***********************************************
/* FINAL CASE STUDY - HORSE RACING
/* Recommendations to a client on how to maximize handle
/* STEP 3: Data Preparation
/* -----------------------------------------------------------
/***********************************************/


LIBNAME WK17 '/folders/myshortcuts/myfolder/SSCode/20150724/Datasets';




/** Sorting EXOTIC_PAYOFF to extract the sum of total_pool for each race **/
PROC SORT
	DATA=WK17.EXOTIC_PAYOFF;
	BY track_id race_date_in_date race_number;
RUN;	

/** Sum of total_pool for each race */
PROC MEANS NOPRINT
	DATA=WK17.EXOTIC_PAYOFF;
	BY track_id race_date_in_date race_number;
	OUTPUT
		OUT=WK17.EXOTIC_PAYOFF_BY_DATE_RACE_NO
		SUM(total_pool)=total_pool_sum;
RUN;


/** EXOTIC_PAYOFF_BY_DATE_RACE_NO Dataset - Analyzing the data for 1 day - 13May05 for track AP */
PROC PRINT
	DATA=WK17.EXOTIC_PAYOFF_BY_DATE_RACE_NO;
	WHERE race_date_in_date = '13May05'd AND track_id = 'AP';
	TITLE1 "EXOTIC_PAYOFF_BY_DATE_RACE_NO Dataset - Analyzing the data for 1 day - 13May05 for track AP";
RUN;


/** SORT RACE DATASET to prepare for merging **/
PROC SORT
	DATA=WK17.RACE;
	BY track_id race_date_in_date race_number;
RUN;






/** Merging RACE and EXOTIC_PAYOFF_BY_DATE_RACE_NO **/
DATA WK17.RACE_EXOTIC_PAYOFF_MERGE;
	
	MERGE 
		WK17.RACE (
			DROP =
				race_date /** Since race_date_in_date works better **/
				race_date_precision	/** Since all the Races are in Daytime (D) - dropping it */
				day_evening	/** Since all the Races are in Daytime (D) - dropping it */
				country	/** Since all the Races are in USA - dropping it */
				official_indicator /** We can ignore what the Data Dictionary gives no information about **/
				status /** Data Dictionary gives no information about **/
				purse_foreign /** Data Exploration revealed that it has only 1 record with a valid value - statistically not important **/
				reverts_money  /** Data Dictionary gives no information about **/
				available_money /** Data Dictionary gives no information about **/
				paid_to_others /** Data Dictionary gives no information about **/
				guaranteed_indicator /** Data Dictionary gives no information about **/
				added_money_foreign /** Data Dictionary gives no information about **/
				added_money_usa /** Data Dictionary gives no information about **/
				wager_types /** Data Dictionary gives no information about **/
				wager_types_cancelled /** Data Dictionary gives no information about **/
				post_time /** Data Dictionary gives no information about **/
				division /** Data Dictionary gives no information about **/
				race_class_stake_rule /** Data Dictionary gives no information about **/
				race_class_blktype_rule /** Data Dictionary gives no information about **/
				graded_stake_id /** Data Dictionary gives no information about **/
				race_name /** Data Dictionary gives no information about **/
				temporary_rail_distance /** Data Dictionary gives no information about **/
				race_class_stk_rule_wo_classic /** Data Dictionary gives no information about **/
				race_class_bt_rule_wo_classic /** Data Dictionary gives no information about **/
				chute_start /** Data Dictionary gives no information about **/
				CreateDT /** Data Dictionary gives no information about **/
				ModifyDT /** Data Dictionary gives no information about **/
				RecType /** Data Dictionary gives no information about **/
				program_selections /** statistically very diverse and no information on how the data is used **/
				fraction_1	/** This is more with the activity on the race track itself - not something that can be used to predict handle - hence dropping it */
				fraction_2 	/** This is more with the activity on the race track itself - not something that can be used to predict handle - hence dropping it */
				fraction_3	/** This is more with the activity on the race track itself - not something that can be used to predict handle - hence dropping it */
				fraction_4	/** This is more with the activity on the race track itself - not something that can be used to predict handle - hence dropping it */
				fraction_5	/** This is more with the activity on the race track itself - not something that can be used to predict handle - hence dropping it */
				winning_time	/** This is more with the activity on the race track itself - not something that can be used to predict handle - hence dropping it */
				distance_unit /** the variation is too insignificant **/
				surface /** This is the same as course_type - hence elimination **/
				scheduled_surface /** This is similar to course_type - hence elimination **/
				breed_type /** the variation is too insignificant **/
				start_description /** the variation is too insignificant **/
				
		)
		WK17.EXOTIC_PAYOFF_BY_DATE_RACE_NO (
			DROP =
				_TYPE_
				_FREQ_
		);
	BY track_id race_date_in_date race_number;
	
	/** calculating the handle **/
	handle = wps_pool + total_pool_sum;
	
	
	/** creating dummy variables **/
	IF track_id = "AP"  THEN track_id_AP  = 1;
	IF track_id = "CRC" THEN track_id_CRC = 1;
	IF track_id_AP  = . THEN track_id_AP = 0;
	IF track_id_CRC = . THEN track_id_CRC = 0;
	
	
	IF race_number = 1  THEN race_number_1 = 1;
	IF race_number = 2  THEN race_number_2 = 1;
	IF race_number = 3  THEN race_number_3 = 1;
	IF race_number = 4  THEN race_number_4 = 1;
	IF race_number = 5  THEN race_number_5 = 1;
	IF race_number = 6  THEN race_number_6 = 1;
	IF race_number = 7  THEN race_number_7 = 1;
	IF race_number = 8  THEN race_number_8 = 1;
	IF race_number = 9  THEN race_number_9 = 1;
	IF race_number = 10 THEN race_number_10 = 1;
	IF race_number = 11 THEN race_number_11 = 1;
	IF race_number = 12 THEN race_number_12 = 1;
	IF race_number = 13 THEN race_number_13 = 1;
	IF race_number_1 = . THEN race_number_1 = 0;
	IF race_number_2 = . THEN  race_number_2 = 0;
	IF race_number_3  = . THEN race_number_3 = 0;
	IF race_number_4  = . THEN race_number_4 = 0;
	IF race_number_5  = . THEN race_number_5 = 0;
	IF race_number_6  = . THEN race_number_6 = 0;
	IF race_number_7  = . THEN race_number_7 = 0;
	IF race_number_8  = . THEN race_number_8 = 0;
	IF race_number_9  = . THEN race_number_9 = 0;
	IF race_number_10 = . THEN race_number_10 = 0;
	IF race_number_11 = . THEN race_number_11 = 0;
	IF race_number_12 = . THEN race_number_12 = 0;
	IF race_number_13 = . THEN race_number_13 = 0;
	
	
	IF conditions_of_race = "NW2     L" THEN conditions_of_race_NW2_L = 1;
	IF conditions_of_race = "NW1       X" THEN conditions_of_race_NW1_X = 1;
	IF conditions_of_race = "NW2       X" THEN conditions_of_race_NW2_X = 1;
	IF conditions_of_race = "NW3     L" THEN conditions_of_race_NW3_L = 1;
	IF prxmatch( '/C/' , conditions_of_race)  THEN conditions_of_race_C     = 1;
	IF conditions_of_race = "NW3       X" THEN conditions_of_race_NW3_X = 1;
	IF conditions_of_race_NW2_L = . THEN conditions_of_race_NW2_L = 0;
	IF conditions_of_race_NW1_X = . THEN conditions_of_race_NW1_X = 0;
	IF conditions_of_race_NW2_X = . THEN conditions_of_race_NW2_X = 0;
	IF conditions_of_race_NW3_L = . THEN conditions_of_race_NW3_L = 0;
	IF conditions_of_race_C     = . THEN conditions_of_race_C = 0;
	IF conditions_of_race_NW3_X = . THEN conditions_of_race_NW3_X = 0;
	
	
	IF conditions_of_race = "NW1     6MX" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW1     6M" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW2     Y+" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW1     3M" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW2   R 6MX" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW1     6MX" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW2     3MX" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW1     Y" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW1    T  X" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW1   R 6MX" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW1   R L" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW1$  R 3MX" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW2     9MX" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW2     Y X" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW2     Y+X" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW2   R Y+X" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW2   RTL X" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW2$    9MX" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW2$    L" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW2$    Y+X" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW2$   T3MX" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW3     6MX" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race = "NW3     L X" THEN conditions_of_race_OTHER = 1;
	IF conditions_of_race_OTHER = . THEN conditions_of_race_OTHER = 0;
		
	IF race_type = "CLM" THEN race_type_CLM = 1;
	IF race_type = "MCL" THEN race_type_MCL = 1;
	IF race_type = "MSW" THEN race_type_MSW = 1;
	IF race_type = "AOC" THEN race_type_AOC = 1;
	IF race_type = "ALW" THEN race_type_ALW = 1;
	IF race_type = "STK" THEN race_type_STK = 1;
	IF race_type = "STR" THEN race_type_STR = 1;
	IF race_type = "CAN" THEN race_type_CAN = 1;
	IF race_type_CLM = . THEN race_type_CLM = 0;
	IF race_type_MCL = . THEN race_type_MCL = 0;
	IF race_type_MSW = . THEN race_type_MSW = 0;
	IF race_type_AOC = . THEN race_type_AOC = 0;
	IF race_type_ALW = . THEN race_type_ALW = 0;
	IF race_type_STK = . THEN race_type_STK = 0;
	IF race_type_STR = . THEN race_type_STR = 0;
	IF race_type_CAN = . THEN race_type_CAN = 0;
	
	IF age_restriction = "3U" THEN age_restriction_3U = 1;
	IF age_restriction = "02" THEN age_restriction_02 = 1;
	IF age_restriction = "34" THEN age_restriction_34 = 1;
	IF age_restriction = "03" THEN age_restriction_03 = 1;
	IF age_restriction = "35" THEN age_restriction_35 = 1;
	IF age_restriction = "45" THEN age_restriction_45 = 1;
	IF age_restriction = "4U" THEN age_restriction_4U = 1;
	IF age_restriction_3U = . THEN age_restriction_3U = 0;
	IF age_restriction_02 = . THEN age_restriction_02 = 0;
	IF age_restriction_34 = . THEN age_restriction_34 = 0;
	IF age_restriction_03 = . THEN age_restriction_03 = 0;
	IF age_restriction_35 = . THEN age_restriction_35 = 0;
	IF age_restriction_45 = . THEN age_restriction_45 = 0;
	IF age_restriction_4U = . THEN age_restriction_4U = 0;
	
	
	IF sex_restriction = "B" THEN sex_restriction_B = 1;
	IF sex_restriction = "F" THEN sex_restriction_F = 1;
	IF sex_restriction_B = . THEN sex_restriction_B = 0;
	IF sex_restriction_F = . THEN sex_restriction_F = 0;
	
	IF stakes_indicator = "N" THEN stakes_indicator_N = 1;
	IF stakes_indicator_N = . THEN stakes_indicator_N = 0;
	
	
	IF distance_id = 600 THEN  distance_id_600  = 1;
	IF distance_id = 800 THEN  distance_id_800  = 1;
	IF distance_id = 850 THEN  distance_id_850  = 1;
	IF distance_id = 550 THEN  distance_id_550  = 1;
	IF distance_id = 700 THEN  distance_id_700  = 1;
	IF distance_id = 500 THEN  distance_id_500  = 1;
	IF distance_id = 650 THEN  distance_id_650  = 1;
	IF distance_id = 900 THEN  distance_id_900  = 1;
	IF distance_id = 832 THEN  distance_id_832  = 1;
	IF distance_id = 450 THEN  distance_id_450  = 1;
	IF distance_id = 750 THEN  distance_id_750  = 1;
	IF distance_id = 818 THEN  distance_id_818  = 1;
	IF distance_id = 1200 THEN distance_id_1200 = 1;
	IF distance_id = 1000 THEN distance_id_1000 = 1;
	IF distance_id = 200 THEN  distance_id_200  = 1;
	IF distance_id = 950 THEN  distance_id_950  = 1;
	IF distance_id_600  = . THEN distance_id_600 = 0;
	IF distance_id_800  = . THEN distance_id_800 = 0;
	IF distance_id_850  = . THEN distance_id_850 = 0;
	IF distance_id_550  = . THEN distance_id_550 = 0;
	IF distance_id_700  = . THEN distance_id_700 = 0;
	IF distance_id_500  = . THEN distance_id_500 = 0;
	IF distance_id_650  = . THEN distance_id_650 = 0;
	IF distance_id_900  = . THEN distance_id_900 = 0;
	IF distance_id_832  = . THEN distance_id_832 = 0;
	IF distance_id_450  = . THEN distance_id_450 = 0;
	IF distance_id_750  = . THEN distance_id_750 = 0;
	IF distance_id_818  = . THEN distance_id_818 = 0;
	IF distance_id_1200 = . THEN distance_id_1200 = 0;
	IF distance_id_1000 = . THEN distance_id_1000 = 0;
	IF distance_id_200  = . THEN distance_id_200 = 0;
	IF distance_id_950  = . THEN distance_id_950 = 0;
	
	IF about_distance_indicator = "A" THEN about_distance_indicator_A = 1;
	IF about_distance_indicator_A = . THEN about_distance_indicator_A = 0;
	
	IF course_type = "T" THEN course_type_T = 1;
	IF course_type_T = . THEN course_type_T = 0;
	
	
	IF purse_usa > 10000 AND purse_usa <= 25000 
		THEN purse_usa_25K = 1;
		ELSE IF purse_usa <= 30000 
			THEN purse_usa_30K = 1;
			ELSE IF purse_usa <= 40000
				THEN purse_usa_40K = 1;
				ELSE IF purse_usa <= 100000
					THEN purse_usa_100K = 1;
					ELSE IF purse_usa > 100000 
						THEN purse_usa_MT_100K = 1;
	IF purse_usa_25K = . THEN purse_usa_25K = 0;
	IF purse_usa_30K = . THEN purse_usa_30K = 0;
	IF purse_usa_40K = . THEN purse_usa_40K = 0;
	IF purse_usa_100K = . THEN purse_usa_100K = 0;
	IF purse_usa_MT_100K = . THEN purse_usa_MT_100K = 0;
	
	
	
	IF track_condition = "FT" THEN track_condition_FT = 1;
	IF track_condition = "FM" THEN track_condition_FM = 1;
	IF track_condition = "SY" THEN track_condition_SY = 1;
	IF track_condition = "GD" THEN track_condition_GD = 1;
	IF track_condition = "YL" THEN track_condition_YL = 1;
	IF track_condition = "MY" THEN track_condition_MY = 1;
	IF track_condition = "SF" THEN track_condition_SF = 1;
	IF track_condition = "WF" THEN track_condition_WF = 1;
	IF track_condition_FT = . THEN track_condition_FT = 0;
	IF track_condition_FM = . THEN track_condition_FM = 0;
	IF track_condition_SY = . THEN track_condition_SY = 0;
	IF track_condition_GD = . THEN track_condition_GD = 0;
	IF track_condition_YL = . THEN track_condition_YL = 0;
	IF track_condition_MY = . THEN track_condition_MY = 0;
	IF track_condition_SF = . THEN track_condition_SF = 0;
	IF track_condition_WF = . THEN track_condition_WF = 0;
	
	
	IF weather = "C" THEN weather_C = 1;
	IF weather = "L" THEN weather_L = 1;
	IF weather = "O" THEN weather_O = 1;
	IF weather = "H" THEN weather_H = 1;
	IF weather = "R" THEN weather_R = 1;
	IF weather = "F" THEN weather_F = 1;
	IF weather_C = . THEN weather_C = 0;
	IF weather_L = . THEN weather_L = 0;
	IF weather_O = . THEN weather_O = 0;
	IF weather_H = . THEN weather_H = 0;
	IF weather_R = . THEN weather_R = 0;
	IF weather_F = . THEN weather_F = 0;
	
	
	IF minimum_claim_price =     0 THEN minimum_claim_price___0 = 1;
	IF minimum_claim_price = 10000 THEN minimum_claim_price_10K = 1;
	IF minimum_claim_price = 16000 THEN minimum_claim_price_16K = 1;
	IF minimum_claim_price = 25000 THEN minimum_claim_price_25K = 1;
	IF minimum_claim_price = 12500 THEN minimum_claim_price_12K = 1;
	IF minimum_claim_price = 40000 THEN minimum_claim_price_40K = 1;
	IF minimum_claim_price = 20000 THEN minimum_claim_price_20K = 1;
	IF minimum_claim_price = 50000 THEN minimum_claim_price_50K = 1;
	IF minimum_claim_price =  5000 THEN minimum_claim_price__5K = 1;
	IF minimum_claim_price = 32000 THEN minimum_claim_price_32K = 1;
	IF minimum_claim_price = 30000 THEN minimum_claim_price_30K = 1;
	IF minimum_claim_price = 15000 THEN minimum_claim_price_15K = 1;
	IF minimum_claim_price =  9000 THEN minimum_claim_price__9K = 1;
	IF minimum_claim_price =  8000 THEN minimum_claim_price__8K = 1;
	IF minimum_claim_price = 62500 THEN minimum_claim_price_62K = 1;
	IF minimum_claim_price =  6500 THEN minimum_claim_price__7K = 1;
	IF minimum_claim_price =  6250 THEN minimum_claim_price__6K = 1;
	IF minimum_claim_price = 17500 THEN minimum_claim_price_17K = 1;
	IF minimum_claim_price =  4000 THEN minimum_claim_price__4K = 1;
	IF minimum_claim_price = 18000 THEN minimum_claim_price_18K = 1;
	
	IF minimum_claim_price___0 = . THEN minimum_claim_price___0 = 0;
	IF minimum_claim_price_10K = . THEN minimum_claim_price_10K = 0;
	IF minimum_claim_price_16K = . THEN minimum_claim_price_16K = 0;
	IF minimum_claim_price_25K = . THEN minimum_claim_price_25K = 0;
	IF minimum_claim_price_12K = . THEN minimum_claim_price_12K = 0;
	IF minimum_claim_price_40K = . THEN minimum_claim_price_40K = 0;
	IF minimum_claim_price_20K = . THEN minimum_claim_price_20K = 0;
	IF minimum_claim_price_50K = . THEN minimum_claim_price_50K = 0;
	IF minimum_claim_price__5K = . THEN minimum_claim_price__5K = 0;
	IF minimum_claim_price_32K = . THEN minimum_claim_price_32K = 0;
	IF minimum_claim_price_30K = . THEN minimum_claim_price_30K = 0;
	IF minimum_claim_price_15K = . THEN minimum_claim_price_15K = 0;
	IF minimum_claim_price__9K = . THEN minimum_claim_price__9K = 0;
	IF minimum_claim_price__8K = . THEN minimum_claim_price__8K = 0;
	IF minimum_claim_price_62K = . THEN minimum_claim_price_62K = 0;
	IF minimum_claim_price__7K = . THEN minimum_claim_price__7K = 0;
	IF minimum_claim_price__6K = . THEN minimum_claim_price__6K = 0;
	IF minimum_claim_price_17K = . THEN minimum_claim_price_17K = 0;
	IF minimum_claim_price__4K = . THEN minimum_claim_price__4K = 0;
	IF minimum_claim_price_18K = . THEN minimum_claim_price_18K = 0;
	
	IF maximum_claim_price = 100000 THEN maximum_claim_price_100K = 1;
	IF maximum_claim_price =      0 THEN maximum_claim_price____0 = 1;
	IF maximum_claim_price =  10000 THEN maximum_claim_price__10K = 1;
	IF maximum_claim_price =  25000 THEN maximum_claim_price__25K = 1;
	IF maximum_claim_price =  16000 THEN maximum_claim_price__16K = 1;
	IF maximum_claim_price =  12500 THEN maximum_claim_price__12K = 1;
	IF maximum_claim_price =  40000 THEN maximum_claim_price__40K = 1;
	IF maximum_claim_price =  50000 THEN maximum_claim_price__50K = 1;
	IF maximum_claim_price =   5000 THEN maximum_claim_price___5K = 1;
	IF maximum_claim_price =  20000 THEN maximum_claim_price__20K = 1;
	IF maximum_claim_price =  32000 THEN maximum_claim_price__32K = 1;
	IF maximum_claim_price =  15000 THEN maximum_claim_price__15K = 1;
	IF maximum_claim_price =  35000 THEN maximum_claim_price__35K = 1;
	IF maximum_claim_price =  30000 THEN maximum_claim_price__30K = 1;
	IF maximum_claim_price =   8000 THEN maximum_claim_price___8K = 1;
	IF maximum_claim_price =  17500 THEN maximum_claim_price__17K = 1;
	IF maximum_claim_price =  62500 THEN maximum_claim_price__62K = 1;
	IF maximum_claim_price =   6250 THEN maximum_claim_price___6K = 1;
	IF maximum_claim_price =   7500 THEN maximum_claim_price___7K = 1;
	IF maximum_claim_price =   4000 THEN maximum_claim_price___4K = 1;
	IF maximum_claim_price =  18000 THEN maximum_claim_price__18K = 1;
	IF maximum_claim_price =  14000 THEN maximum_claim_price__14K = 1;
	IF maximum_claim_price =  13500 THEN maximum_claim_price__13K = 1;
	IF maximum_claim_price =  80000 THEN maximum_claim_price__80K = 1;
	IF maximum_claim_price_100K = . THEN maximum_claim_price_100K = 0;
	IF maximum_claim_price____0 = . THEN maximum_claim_price____0 = 0;
	IF maximum_claim_price__10K = . THEN maximum_claim_price__10K = 0;
	IF maximum_claim_price__25K = . THEN maximum_claim_price__25K = 0;
	IF maximum_claim_price__16K = . THEN maximum_claim_price__16K = 0;
	IF maximum_claim_price__12K = . THEN maximum_claim_price__12K = 0;
	IF maximum_claim_price__40K = . THEN maximum_claim_price__40K = 0;
	IF maximum_claim_price__50K = . THEN maximum_claim_price__50K = 0;
	IF maximum_claim_price___5K = . THEN maximum_claim_price___5K = 0;
	IF maximum_claim_price__20K = . THEN maximum_claim_price__20K = 0;
	IF maximum_claim_price__32K = . THEN maximum_claim_price__32K = 0;
	IF maximum_claim_price__15K = . THEN maximum_claim_price__15K = 0;
	IF maximum_claim_price__35K = . THEN maximum_claim_price__35K = 0;
	IF maximum_claim_price__30K = . THEN maximum_claim_price__30K = 0;
	IF maximum_claim_price___8K = . THEN maximum_claim_price___8K = 0;
	IF maximum_claim_price__17K = . THEN maximum_claim_price__17K = 0;
	IF maximum_claim_price__62K = . THEN maximum_claim_price__62K = 0;
	IF maximum_claim_price___6K = . THEN maximum_claim_price___6K = 0;
	IF maximum_claim_price___7K = . THEN maximum_claim_price___7K = 0;
	IF maximum_claim_price___4K = . THEN maximum_claim_price___4K = 0;
	IF maximum_claim_price__18K = . THEN maximum_claim_price__18K = 0;
	IF maximum_claim_price__14K = . THEN maximum_claim_price__14K = 0;
	IF maximum_claim_price__13K = . THEN maximum_claim_price__13K = 0;
	IF maximum_claim_price__80K = . THEN maximum_claim_price__80K = 0;
	
	IF grade = "1" THEN grade_1 = 1;
	IF grade = "2" THEN grade_2 = 1;
	IF grade = "3" THEN grade_3 = 1;
	IF grade_1 = . THEN grade_1 = 0;
	IF grade_2 = . THEN grade_2 = 0;
	IF grade_3 = . THEN grade_3 = 0;
	
	
	IF number_of_runners = 0  THEN number_of_runners__0 = 1;
	IF number_of_runners = 3  THEN number_of_runners__3 = 1;
	IF number_of_runners = 4  THEN number_of_runners__4 = 1;
	IF number_of_runners = 5  THEN number_of_runners__5 = 1;
	IF number_of_runners = 6  THEN number_of_runners__6 = 1;
	IF number_of_runners = 7  THEN number_of_runners__7 = 1;
	IF number_of_runners = 8  THEN number_of_runners__8 = 1;
	IF number_of_runners = 9  THEN number_of_runners__9 = 1;
	IF number_of_runners = 10 THEN number_of_runners_10 = 1;
	IF number_of_runners = 11 THEN number_of_runners_11 = 1;
	IF number_of_runners = 12 THEN number_of_runners_12 = 1;
	IF number_of_runners__0 = . THEN number_of_runners__0 = 0;
	IF number_of_runners__3 = . THEN number_of_runners__3 = 0;
	IF number_of_runners__4 = . THEN number_of_runners__4 = 0;
	IF number_of_runners__5 = . THEN number_of_runners__5 = 0;
	IF number_of_runners__6 = . THEN number_of_runners__6 = 0;
	IF number_of_runners__7 = . THEN number_of_runners__7 = 0;
	IF number_of_runners__8 = . THEN number_of_runners__8 = 0;
	IF number_of_runners__9 = . THEN number_of_runners__9 = 0;
	IF number_of_runners_10 = . THEN number_of_runners_10 = 0;
	IF number_of_runners_11 = . THEN number_of_runners_11 = 0;
	IF number_of_runners_12 = . THEN number_of_runners_12 = 0;
	
	IF abbreviated_name = "" THEN abbreviated_name_RACE_HAS = 0;
	IF abbreviated_name_RACE_HAS = . THEN abbreviated_name_RACE_HAS = 1;
	
	IF track_sealed_indicator = "Y" THEN track_sealed_indicator_Y = 1;
	IF track_sealed_indicator = "N" THEN track_sealed_indicator_N = 1;
	IF track_sealed_indicator_Y = . THEN track_sealed_indicator_Y = 0;
	IF track_sealed_indicator_N = . THEN track_sealed_indicator_N = 0;
	
	race_weekday = WEEKDAY( race_date_in_date );
	
	
	IF race_weekday = 1 THEN race_weekday_Sun = 1;
	IF race_weekday = 2 THEN race_weekday_Mon = 1;
	IF race_weekday = 4 THEN race_weekday_Wed = 1;
	IF race_weekday = 5 THEN race_weekday_Thu = 1;
	IF race_weekday = 6 THEN race_weekday_Fri = 1;
	IF race_weekday = 7 THEN race_weekday_Sat = 1;
	IF race_weekday_Sun = . THEN race_weekday_Sun = 0;
	IF race_weekday_Mon = . THEN race_weekday_Mon = 0;
	IF race_weekday_Wed = . THEN race_weekday_Wed = 0;
	IF race_weekday_Thu = . THEN race_weekday_Thu = 0;
	IF race_weekday_Fri = . THEN race_weekday_Fri = 0;
	IF race_weekday_Sat = . THEN race_weekday_Sat = 0;
	
	
	
	IF race_date_in_date =  '6Feb05'd THEN race_date_Super_Bowl    = 1;
	IF race_date_in_date =  '5Feb06'd THEN race_date_Super_Bowl    = 1;
	IF race_date_in_date = '17Mar05'd THEN race_date_Patricks_Day  = 1;
	IF race_date_in_date = '17Mar06'd THEN race_date_Patricks_Day  = 1;
	IF race_date_in_date = '25Mar05'd THEN race_date_Good_Friday   = 1;
	IF race_date_in_date = '14Apr05'd THEN race_date_Good_Friday   = 1;
	IF race_date_in_date = '27Mar05'd THEN race_date_Easter        = 1;
	IF race_date_in_date = '28Mar05'd THEN race_date_Easter        = 1;
	IF race_date_in_date = '16Apr06'd THEN race_date_Easter        = 1;
	IF race_date_in_date = '17Apr06'd THEN race_date_Easter        = 1;
	IF race_date_in_date =  '5May05'd THEN race_date_Cinco_Mayo    = 1;
	IF race_date_in_date =  '5May06'd THEN race_date_Cinco_Mayo    = 1;
	IF race_date_in_date = '30May05'd THEN race_date_Memorial_Day  = 1;
	IF race_date_in_date = '29May06'd THEN race_date_Memorial_Day  = 1;
	IF race_date_in_date =  '4Jul05'd THEN race_date_Indep_Day     = 1;
	IF race_date_in_date =  '4Jul06'd THEN race_date_Indep_Day     = 1;
	IF race_date_in_date =  '5Sep05'd THEN race_date_Labor_Day     = 1;
	IF race_date_in_date =  '4Sep06'd THEN race_date_Labor_Day     = 1;
	IF race_date_in_date = '10Nov05'd THEN race_date_Veterans_Day  = 1;
	IF race_date_in_date = '10Nov06'd THEN race_date_Veterans_Day  = 1;
	IF race_date_in_date = '11Nov06'd THEN race_date_Veterans_Day  = 1;
	IF race_date_in_date = '24Nov05'd THEN race_date_Thanksgiving  = 1;
	IF race_date_in_date = '23Nov06'd THEN race_date_Thanksgiving  = 1;
	/** No Races recorded on Christmas Day on both years **
	IF race_date_in_date = '25Dec05'd THEN race_date_Christmas     = 1;
	IF race_date_in_date = '25Dec06'd THEN race_date_Christmas     = 1;
	IF race_date_Christmas     = . THEN race_date_Christmas        = 0;
	*/
	IF race_date_in_date = '26Dec05'd THEN race_date_Boxing_Day    = 1;
	IF race_date_in_date = '26Dec06'd THEN race_date_Boxing_Day    = 1;
	IF race_date_in_date =  '1Jan05'd THEN race_date_New_Year_Day  = 1;
	IF race_date_in_date =  '1Jan06'd THEN race_date_New_Year_Day  = 1;
	IF race_date_Super_Bowl    = . THEN race_date_Super_Bowl       = 0;
	IF race_date_Patricks_Day  = . THEN race_date_Patricks_Day     = 0;
	IF race_date_Good_Friday   = . THEN race_date_Good_Friday      = 0;
	IF race_date_Easter        = . THEN race_date_Easter           = 0;
	IF race_date_Cinco_Mayo    = . THEN race_date_Cinco_Mayo       = 0;
	IF race_date_Memorial_Day  = . THEN race_date_Memorial_Day     = 0;
	IF race_date_Indep_Day     = . THEN race_date_Indep_Day        = 0;
	IF race_date_Labor_Day     = . THEN race_date_Labor_Day        = 0;
	IF race_date_Veterans_Day  = . THEN race_date_Veterans_Day     = 0;
	IF race_date_Thanksgiving  = . THEN race_date_Thanksgiving     = 0;
	
	IF race_date_Boxing_Day    = . THEN race_date_Boxing_Day       = 0;
	IF race_date_New_Year_Day  = . THEN race_date_New_Year_Day     = 0;
	
RUN;

/** Studying the influcence on Days of the week on Races **/
PROC FREQ
	DATA=WK17.RACE_EXOTIC_PAYOFF_MERGE;
	TABLE race_weekday;
	TITLE1 "Studying the influcence on Days of the week on Races";
	TITLE2 "1=Sunday";
RUN;
		




/** Doing a PROC MEANS on the RACE_EXOTIC_PAYOFF_MERGE Dataset **/
PROC MEANS
	DATA=WK17.RACE_EXOTIC_PAYOFF_MERGE;
	TITLE1 "Doing a PROC MEANS on the RACE_EXOTIC_PAYOFF_MERGE Dataset";
RUN;





