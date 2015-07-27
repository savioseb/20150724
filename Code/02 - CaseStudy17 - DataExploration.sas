/***********************************************
/* FINAL CASE STUDY - HORSE RACING
/* Recommendations to a client on how to maximize handle
/* STEP 2a: Data Exploration
/* -----------------------------------------------------------
/***********************************************/


LIBNAME WK17 '/folders/myshortcuts/myfolder/SSCode/20150724/Datasets';


/** Running PROC FREQ on TRACK dataset **/
PROC FREQ
	DATA=WK17.TRACK;
	TITLE1 "Running PROC FREQ on TRACK dataset";
	TITLE2;
	TITLE3 "No Missing Values of interest";
RUN;




/** Running PROC FREQ on TRACK_STATISTIC dataset **/
PROC FREQ
	DATA=WK17.TRACK_STATISTIC;
	TITLE1 "Running PROC FREQ on TRACK_STATISTIC dataset";
	TITLE2;
	TITLE3 "Location is missing 1501 Records";
RUN;


/** Running PROC FREQ on RACE dataset **/
PROC FREQ
	DATA=WK17.RACE;
	TABLE 
		track_id
		race_date
		race_date_precision
		race_number
		day_evening
		country	
		conditions_of_race								/** 3738 Missing **/
		official_indicator
		status
		race_type
		age_restriction	
		sex_restriction									/** 3600 Missing **/
		stakes_indicator
		distance_id
		distance_unit
		about_distance_indicator						/** 5902 Missing **/
		surface
		course_type
		scheduled_surface								/** 5941 Missing **/
		purse_foreign
		purse_usa
		reverts_money
		available_money
		paid_to_others
		guaranteed_indicator							/* 5877 Missing **/
		added_money_foreign
		added_money_usa
		/* wps_pool * This is skipped because there are too many values here **/
		wager_types										/** 6327 Missing **/
		wager_types_cancelled							/** 6327 Missing **/
		post_time										/** 82 Missing **/
		track_condition									/** 79 Missing **/
		weather											/** 79 Missing **/
		/* Too many observations here
		fraction_1
		fraction_2
		fraction_3
		fraction_4
		fraction_5
		winning_time
		*/
		breed_type
		division										/** 6323 Missing **/
		start_description								/** 82 Missing **/
		minimum_claim_price
		maximum_claim_price
		grade											/** 6246 Missing **/
		number_of_runners
		race_class_stake_rule
		race_class_blktype_rule
		graded_stake_id									/** 6219 Missing **/
		abbreviated_name								/** 5877 Missing **/
		race_name										/** 5877 Missing **/
		/** too many observations **
		program_selections								/** 11 Missing 
		*/
		temporary_rail_distance							/** 4000 Missing **/
		race_class_stk_rule_wo_classic
		race_class_bt_rule_wo_classic
		chute_start										/** 2480 Missing **/
		track_sealed_indicator;							/** 1115 Missing **/
		
	TITLE1 "Running PROC FREQ on RACE dataset";
	TITLE2;
	TITLE3 "Variables with Missing Values: conditions_of_race(3738) , sex_restriction (3600)";
	TITLE4 "about_distance_indicator(5902), scheduled_surface(5941) , guaranteed_indicator (5877)";
	TITLE5 "wager_types (6327) , wager_types_cancelled (6327), post_time(82)";
	TITLE6 "track_condition (79) , weather (79) , division (6323)";
	TITLE7 "start_description (82) grade (6246) graded_stake_id (6219)";
	TITLE8 "abbreviated_name  (5877) race_name (5877) program_selections (11)";
	TITLE9 "temporary_rail_distance (4000) chute_start (2480) track_sealed_indicator (1115)";
RUN;







/** Running PROC FREQ on EXOTIC_PAYOFF dataset **/
PROC FREQ
	DATA=WK17.EXOTIC_PAYOFF;
	TABLE
		track_id
		race_date
		race_number
		day_evening
		country
		wager_type
		number_of_rights
		/** winning_numbers					325 Missing **/
		number_of_tickets_bet
		/** 
		total_pool  
		payoff_amount
		**/
		carryover;
	TITLE1 "Running PROC FREQ on EXOTIC_PAYOFF dataset";
	TITLE3 "Variables with Missing Values: winning numbers (325)";
RUN;

/** RACE Dataset - Analyzing the data for 1 day - 13May05 for track AP */
PROC PRINT
	DATA=WK17.RACE;
	WHERE race_date_in_date = '13May05'd AND track_id = 'AP';
	SUM wps_pool;
	TITLE1 "RACE Dataset - Analyzing the data for 1 day - 13May05 for track AP";
RUN;

/** EXOTIC_PAYOFF Dataset - Analyzing the data for 1 day - 13May05 for track AP */
PROC PRINT
	DATA=WK17.EXOTIC_PAYOFF;
	WHERE race_date_in_date = '13May05'd AND track_id = 'AP';
	SUM total_pool;
	TITLE1 "EXOTIC_PAYOFF Dataset - Analyzing the data for 1 day - 13May05 for track AP";
RUN;









/** TRACK_STATISTIC Dataset - Analyzing the data for 1 day - 13May05 for track AP */
PROC PRINT
	DATA=WK17.TRACK_STATISTIC;
	WHERE race_date_in_date = '13May05'd AND track_id = 'AP';
	TITLE1 "EXOTIC_PAYOFF Dataset - Analyzing the data for 1 day - 13May05 for track AP";
RUN;


















