CREATE DATABASE IF NOT EXISTS pga_tour_database
	CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;
    
USE pga_tour_database;    

CREATE TABLE tournaments (
	tournament_id INT			 NOT NULL PRIMARY KEY,
    tournament_name VARCHAR(100) NOT NULL
);

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '/tournaments.csv'
INTO TABLE tournaments
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(tournament_id, tournament_name);

CREATE TABLE players(
	PLAYER_ID INT		NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL
);

LOAD DATA LOCAL INFILE '/players.csv'
INTO TABLE players
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER);

SELECT *
FROM PLAYERS;

CREATE TABLE courses (
	course_id INT 				NOT NULL PRIMARY KEY,
    course_name VARCHAR (100)	NOT NULL,
    city VARCHAR (100)			NOT NULL,
    state_province VARCHAR(100) NOT NULL,
    country VARCHAR(100)		NOT NULL,
    tournament_id INT			NOT NULL,
    CONSTRAINT fk_courses_tournament
		FOREIGN KEY (tournament_id) REFERENCES tournaments (tournament_id)
);

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA LOCAL INFILE '/courses.csv'
INTO TABLE courses
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(course_id, course_name, city, state_province, country, tournament_id);

SELECT *
FROM courses;

CREATE TABLE ball_speed_2026 (
	PLAYER_ID INT		NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50)  NOT NULL,
    avg_ball_speed DECIMAL(5,2) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2026/ball_speed.csv'
INTO TABLE ball_speed_2026
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_ball_speed);

CREATE TABLE ball_speed_2025 (
	PLAYER_ID INT 	NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) 	NOT NULL,
    avg_ball_speed DECIMAL(5,2) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2025/ball_speed.csv'
INTO TABLE ball_speed_2025
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_ball_speed);


CREATE TABLE ball_speed_2024 (
	PLAYER_ID INT 	NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) 	NOT NULL,
    avg_ball_speed DECIMAL(5,2) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2024/ball_speed.csv'
INTO TABLE ball_speed_2024
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_ball_speed);

CREATE TABLE course_stats_2026 (
	course_id INT NOT NULL PRIMARY KEY,
    course_name VARCHAR(100)	NOT NULL,
    season VARCHAR(50)	NOT NULL,
    course_par INT NOT NULL,
    total_yardage INT NOT NULL,
    average_score DECIMAL(5, 3) NOT NULL,
    average_score_diff DECIMAL(5, 3) NOT NULL,
    eagles INT NOT NULL,
    birdies INT NOT NULL,
    pars INT NOT NULL,
    bogey INT NOT NULL,
    double_bogeys INT NOT NULL,
    double_bogey_plus INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2026/course_stats.csv'
INTO TABLE course_stats_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(course_id, course_name, season, course_par, total_yardage, 
average_score, average_score_diff, eagles, birdies, pars, bogey, double_bogeys,
double_bogey_plus);


CREATE TABLE course_stats_2025 (
	course_id INT NOT NULL PRIMARY KEY,
    course_name VARCHAR(100)	NOT NULL,
    season VARCHAR(50)	NOT NULL,
    course_par INT NOT NULL,
    total_yardage INT NOT NULL,
    average_score DECIMAL(5, 3) NOT NULL,
    average_score_diff DECIMAL(5, 3) NOT NULL,
    eagles INT NOT NULL,
    birdies INT NOT NULL,
    pars INT NOT NULL,
    bogey INT NOT NULL,
    double_bogeys INT NOT NULL,
    double_bogey_plus INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2025/course_stats.csv'
INTO TABLE course_stats_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(course_id, course_name, season, course_par, total_yardage, 
average_score, average_score_diff, eagles, birdies, pars, bogey, double_bogeys,
double_bogey_plus);


CREATE TABLE course_stats_2024 (
	course_id INT NOT NULL PRIMARY KEY,
    course_name VARCHAR(100)	NOT NULL,
    season VARCHAR(50)	NOT NULL,
    course_par INT NOT NULL,
    total_yardage INT NOT NULL,
    average_score DECIMAL(5, 3) NOT NULL,
    average_score_diff DECIMAL(5, 3) NOT NULL,
    eagles INT NOT NULL,
    birdies INT NOT NULL,
    pars INT NOT NULL,
    bogey INT NOT NULL,
    double_bogeys INT NOT NULL,
    double_bogey_plus INT NOT NULL
);


LOAD DATA LOCAL INFILE '/data/2024/course_stats.csv'
INTO TABLE course_stats_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(course_id, course_name, season, course_par, total_yardage, 
average_score, average_score_diff, eagles, birdies, pars, bogey, double_bogeys,
double_bogey_plus);

CREATE TABLE driving_accuracy_2026(
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50)	NOT NULL,
    fairway_percentage DECIMAL(5, 2) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2026/driving_accuracy.csv'
INTO TABLE driving_accuracy_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct)
SET fairway_percentage = REPLACE(@pct, '%', '');


CREATE TABLE driving_accuracy_2025(
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50)	NOT NULL,
    fairway_percentage DECIMAL(5, 2) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2025/driving_accuracy.csv'
INTO TABLE driving_accuracy_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct)
SET fairway_percentage = REPLACE(@pct, '%', '');


CREATE TABLE driving_accuracy_2024(
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50)	NOT NULL,
    fairway_percentage DECIMAL(5, 2) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2024/driving_accuracy.csv'
INTO TABLE driving_accuracy_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct)
SET fairway_percentage = REPLACE(@pct, '%', '');

CREATE TABLE driving_distance_2026 (
	PLAYER_ID INT 	NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100)	NOT NULL,
    season VARCHAR(50) 	NOT NULL,
    average_distance DECIMAL (5, 2)	NOT NULL,
    total_drives INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2026/driving_distance.csv'
INTO TABLE driving_distance_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, average_distance, total_drives);

CREATE TABLE driving_distance_2025 (
	PLAYER_ID INT 	NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100)	NOT NULL,
    season VARCHAR(50) 	NOT NULL,
    average_distance DECIMAL (5, 2)	NOT NULL,
    total_drives INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2025/driving_distance.csv'
INTO TABLE driving_distance_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, average_distance, total_drives);

CREATE TABLE driving_distance_2024 (
	PLAYER_ID INT 	NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100)	NOT NULL,
    season VARCHAR(50) 	NOT NULL,
    average_distance DECIMAL (5, 2)	NOT NULL,
    total_drives INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2024/driving_distance.csv'
INTO TABLE driving_distance_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, average_distance, total_drives);

CREATE TABLE greens_in_regulation_2026 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    gir_percentage DECIMAL(5, 2) NOT NULL,
    greens_hit INT NOT NULL,
    gir_relative_to_par DECIMAL(5, 2) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2026/greens_in_regulation.csv'
INTO TABLE greens_in_regulation_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct, greens_hit, gir_relative_to_par)
SET gir_percentage = REPLACE(@pct, '%', '');

CREATE TABLE greens_in_regulation_2025 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    gir_percentage DECIMAL(5, 2) NOT NULL,
    greens_hit INT NOT NULL,
    gir_relative_to_par DECIMAL(5, 2) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2025/greens_in_regulation.csv'
INTO TABLE greens_in_regulation_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct, greens_hit, gir_relative_to_par)
SET gir_percentage = REPLACE(@pct, '%', '');

CREATE TABLE greens_in_regulation_2024 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    gir_percentage DECIMAL(5, 2) NOT NULL,
    greens_hit INT NOT NULL,
    gir_relative_to_par DECIMAL(5, 2) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2024/greens_in_regulation.csv'
INTO TABLE greens_in_regulation_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct, greens_hit, gir_relative_to_par)
SET gir_percentage = REPLACE(@pct, '%', '');

CREATE TABLE inside_100_approach_distance_2026 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    under_100_avg_dist_to_pin DECIMAL(5, 3) NOT NULL,
    under_100_shots INT NOT NULL,
    under_100_relative_to_par DECIMAL(5, 2) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2026/inside_100_approach_distance.csv'
INTO TABLE inside_100_approach_distance_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, under_100_avg_dist_to_pin, under_100_shots, under_100_relative_to_par);

CREATE TABLE inside_100_approach_distance_2025 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    under_100_avg_dist_to_pin DECIMAL(5, 3) NOT NULL,
    under_100_shots INT NOT NULL,
    under_100_relative_to_par DECIMAL(5, 2) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2025/inside_100_approach_distance.csv'
INTO TABLE inside_100_approach_distance_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, under_100_avg_dist_to_pin, under_100_shots, under_100_relative_to_par);

CREATE TABLE inside_100_approach_distance_2024 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    under_100_avg_dist_to_pin DECIMAL(5, 3) NOT NULL,
    under_100_shots INT NOT NULL,
    under_100_relative_to_par DECIMAL(5, 2) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2024/inside_100_approach_distance.csv'
INTO TABLE inside_100_approach_distance_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, under_100_avg_dist_to_pin, under_100_shots, under_100_relative_to_par);

CREATE TABLE money_2026 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    total_earnings INT NOT NULL,
    wins INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2026/money.csv'
INTO TABLE money_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @money, wins)
SET total_earnings = REPLACE(REPLACE(@money, '$', ''), ',', '');

CREATE TABLE money_2025 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    total_earnings INT NOT NULL,
    wins INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2025/money.csv'
INTO TABLE money_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @money, wins)
SET total_earnings = REPLACE(REPLACE(@money, '$', ''), ',', '');

CREATE TABLE money_2024 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    total_earnings INT NOT NULL,
    wins INT NOT NULL
);


LOAD DATA LOCAL INFILE '/data/2024/money.csv'
INTO TABLE money_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @money, wins)
SET total_earnings = REPLACE(REPLACE(@money, '$', ''), ',', '');

CREATE TABLE one_putt_pct_2026 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    one_putt_pct DECIMAL(5, 2) NOT NULL,
    total_one_putts INT NOT NULL,
    number_of_holes INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2026/one_putt_pct.csv'
INTO TABLE one_putt_pct_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct, total_one_putts, number_of_holes)
SET one_putt_pct = REPLACE(@pct, '%', '');

CREATE TABLE one_putt_pct_2025 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    one_putt_pct DECIMAL(5, 2) NOT NULL,
    total_one_putts INT NOT NULL,
    number_of_holes INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2025/one_putt_pct.csv'
INTO TABLE one_putt_pct_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct, total_one_putts, number_of_holes)
SET one_putt_pct = REPLACE(@pct, '%', '');

CREATE TABLE one_putt_pct_2024 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    one_putt_pct DECIMAL(5, 2) NOT NULL,
    total_one_putts INT NOT NULL,
    number_of_holes INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2024/one_putt_pct.csv'
INTO TABLE one_putt_pct_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct, total_one_putts, number_of_holes)
SET one_putt_pct = REPLACE(@pct, '%', '');

CREATE TABLE over_100_approach_distance_2026 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    over_100_avg_dist_to_pin DECIMAL(5,3) NOT NULL,
    over_100_shots INT NOT NULL,
    over_100_relative_to_par DECIMAL(5,2) NOT NULL
);


LOAD DATA LOCAL INFILE '/data/2026/over_100_approach_distance.csv'
INTO TABLE over_100_approach_distance_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, over_100_avg_dist_to_pin, over_100_shots, over_100_relative_to_par);

CREATE TABLE over_100_approach_distance_2025 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    over_100_avg_dist_to_pin DECIMAL(5,3) NOT NULL,
    over_100_shots INT NOT NULL,
    over_100_relative_to_par DECIMAL(5,2) NOT NULL
);


LOAD DATA LOCAL INFILE '/data/2025/over_100_approach_distance.csv'
INTO TABLE over_100_approach_distance_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, over_100_avg_dist_to_pin, over_100_shots, over_100_relative_to_par);

CREATE TABLE over_100_approach_distance_2024 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    over_100_avg_dist_to_pin DECIMAL(5,3) NOT NULL,
    over_100_shots INT NOT NULL,
    over_100_relative_to_par DECIMAL(5,2) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2024/over_100_approach_distance.csv'
INTO TABLE over_100_approach_distance_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, over_100_avg_dist_to_pin, over_100_shots, over_100_relative_to_par);

CREATE TABLE putts_per_hole_2026 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    avg_putts_per_hole DECIMAL(5, 3) NOT NULL,
    total_greens_hit INT NOT NULL,
    birdie_conversion_pct DECIMAL(5, 2) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2026/putts_per_hole.csv'
INTO TABLE putts_per_hole_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_putts_per_hole, total_greens_hit, @pct)
SET birdie_conversion_pct = REPLACE(@pct, '%', '');

CREATE TABLE putts_per_hole_2025 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    avg_putts_per_hole DECIMAL(5, 3) NOT NULL,
    total_greens_hit INT NOT NULL,
    birdie_conversion_pct DECIMAL(5, 2) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2025/putts_per_hole.csv'
INTO TABLE putts_per_hole_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_putts_per_hole, total_greens_hit, @pct)
SET birdie_conversion_pct = REPLACE(@pct, '%', '');

CREATE TABLE putts_per_hole_2024 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    avg_putts_per_hole DECIMAL(5, 3) NOT NULL,
    total_greens_hit INT NOT NULL,
    birdie_conversion_pct DECIMAL(5, 2) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2024/putts_per_hole.csv'
INTO TABLE putts_per_hole_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_putts_per_hole, total_greens_hit, @pct)
SET birdie_conversion_pct = REPLACE(@pct, '%', '');


CREATE TABLE sand_save_pct_2026 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL, 
    sand_save_pct DECIMAL(5, 2) NOT NULL,
    bunkers_hit INT NOT NULL,
    over_under_par INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2026/sand_save_pct.csv'
INTO TABLE sand_save_pct_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct, bunkers_hit, over_under_par)
SET sand_save_pct = REPLACE(@pct, '%', '');

CREATE TABLE sand_save_pct_2025 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL, 
    sand_save_pct DECIMAL(5, 2) NOT NULL,
    bunkers_hit INT NOT NULL,
    over_under_par INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2025/sand_save_pct.csv'
INTO TABLE sand_save_pct_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct, bunkers_hit, over_under_par)
SET sand_save_pct = REPLACE(@pct, '%', '');

CREATE TABLE sand_save_pct_2024 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL, 
    sand_save_pct DECIMAL(5, 2) NOT NULL,
    bunkers_hit INT NOT NULL,
    over_under_par INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2024/sand_save_pct.csv'
INTO TABLE sand_save_pct_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct, bunkers_hit, over_under_par)
SET sand_save_pct = REPLACE(@pct, '%', '');


CREATE TABLE scoring_average_2026 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(100) NOT NULL,
    avg_score DECIMAL(5, 3) NOT NULL,
    rounds_played INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2026/scoring_average.csv'
INTO TABLE scoring_average_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_score, rounds_played);

CREATE TABLE scoring_average_2025 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(100) NOT NULL,
    avg_score DECIMAL(5, 3) NOT NULL,
    rounds_played INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2025/scoring_average.csv'
INTO TABLE scoring_average_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_score, rounds_played);

CREATE TABLE scoring_average_2024 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(100) NOT NULL,
    avg_score DECIMAL(5, 3) NOT NULL,
    rounds_played INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2024/scoring_average.csv'
INTO TABLE scoring_average_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_score, rounds_played);

CREATE TABLE scramble_pct_2026 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    scramble_pct DECIMAL(5, 2) NOT NULL,
    total_missed_greens INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2026/scramble_pct.csv'
INTO TABLE scramble_pct_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY "'"
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct, total_missed_greens)
SET scramble_pct = REPLACE(@pct, '%', '');

CREATE TABLE scramble_pct_2025 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    scramble_pct DECIMAL(5, 2) NOT NULL,
    total_missed_greens INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2025/scramble_pct.csv'
INTO TABLE scramble_pct_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct, total_missed_greens)
SET scramble_pct = REPLACE(@pct, '%', '');

CREATE TABLE scramble_pct_2024 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    scramble_pct DECIMAL(5, 2) NOT NULL,
    total_missed_greens INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2024/scramble_pct.csv'
INTO TABLE scramble_pct_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct, total_missed_greens)
SET scramble_pct = REPLACE(@pct, '%', '');

CREATE TABLE strokes_gained_approach_2026 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    avg_strokes_gained_approach DECIMAL(5, 3) NOT NULL,
    total_strokes_gained_approach DECIMAL(5, 3) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2026/strokes_gained_approach.csv'
INTO TABLE strokes_gained_approach_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_strokes_gained_approach, total_strokes_gained_approach);


CREATE TABLE strokes_gained_approach_2025 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    avg_strokes_gained_approach DECIMAL(5, 3) NOT NULL,
    total_strokes_gained_approach DECIMAL(5, 3) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2025/strokes_gained_approach.csv'
INTO TABLE strokes_gained_approach_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_strokes_gained_approach, total_strokes_gained_approach);


CREATE TABLE strokes_gained_approach_2024 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    avg_strokes_gained_approach DECIMAL(5, 3) NOT NULL,
    total_strokes_gained_approach DECIMAL(5, 3) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2024/strokes_gained_approach.csv'
INTO TABLE strokes_gained_approach_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_strokes_gained_approach, total_strokes_gained_approach);

## Stopped at strokes_gained_off_the_tee

CREATE TABLE strokes_gained_off_the_tee_2026 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    avg_strokes_gained_ott DECIMAL(5, 3) NOT NULL,
    total_strokes_gained_ott DECIMAL(5, 3) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2026/strokes_gained_off_the_tee.csv'
INTO TABLE strokes_gained_off_the_tee_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_strokes_gained_ott, total_strokes_gained_ott);

CREATE TABLE strokes_gained_off_the_tee_2025 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    avg_strokes_gained_ott DECIMAL(5, 3) NOT NULL,
    total_strokes_gained_ott DECIMAL(5, 3) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2025/strokes_gained_off_the_tee.csv'
INTO TABLE strokes_gained_off_the_tee_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_strokes_gained_ott, total_strokes_gained_ott);

CREATE TABLE strokes_gained_off_the_tee_2024 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    avg_strokes_gained_ott DECIMAL(5, 3) NOT NULL,
    total_strokes_gained_ott DECIMAL(5, 3) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2024/strokes_gained_off_the_tee.csv'
INTO TABLE strokes_gained_off_the_tee_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_strokes_gained_ott, total_strokes_gained_ott);

CREATE TABLE strokes_gained_putting_2026(
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    avg_strokes_gained_putting DECIMAL(5, 3) NOT NULL,
    total_strokes_gained_putting DECIMAL(5, 3) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2026/strokes_gained_putting.csv'
INTO TABLE strokes_gained_putting_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_strokes_gained_putting, total_strokes_gained_putting);

CREATE TABLE strokes_gained_putting_2025(
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    avg_strokes_gained_putting DECIMAL(5, 3) NOT NULL,
    total_strokes_gained_putting DECIMAL(5, 3) NOT NULL
); 


LOAD DATA LOCAL INFILE '/data/2025/strokes_gained_putting.csv'
INTO TABLE strokes_gained_putting_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_strokes_gained_putting, total_strokes_gained_putting);

CREATE TABLE strokes_gained_putting_2024(
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    avg_strokes_gained_putting DECIMAL(5, 3) NOT NULL,
    total_strokes_gained_putting DECIMAL(5, 3) NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2024/strokes_gained_putting.csv'
INTO TABLE strokes_gained_putting_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, avg_strokes_gained_putting, total_strokes_gained_putting);

CREATE TABLE three_putt_avoidance_2026(
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    three_putt_avoidance_pct DECIMAL(5, 2) NOT NULL,
    total_holes_played INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2026/three_putt_avoidance.csv'
INTO TABLE three_putt_avoidance_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct, total_holes_played)
SET three_putt_avoidance_pct = REPLACE(@pct, '%', '');

CREATE TABLE three_putt_avoidance_2025(
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    three_putt_avoidance_pct DECIMAL(5, 2) NOT NULL,
    total_holes_played INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2025/three_putt_avoidance.csv'
INTO TABLE three_putt_avoidance_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct, total_holes_played)
SET three_putt_avoidance_pct = REPLACE(@pct, '%', '');


CREATE TABLE three_putt_avoidance_2024(
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    three_putt_avoidance_pct DECIMAL(5, 2) NOT NULL,
    total_holes_played INT NOT NULL
);

LOAD DATA LOCAL INFILE '/data/2024/three_putt_avoidance.csv'
INTO TABLE three_putt_avoidance_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, @pct, total_holes_played)
SET three_putt_avoidance_pct = REPLACE(@pct, '%', '');

CREATE TABLE total_strokes_gained_2026 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    average_strokes_gained DECIMAL(5, 3) NOT NULL,
    strokes_gained_total DECIMAL(10, 3) NOT NULL,
    strokes_gained_tee_to_green DECIMAL (10, 3) NOT NULL,
    strokes_gained_putting DECIMAL(10, 3) NOT NULL,
    rounds_played INT NOT NULL
);


LOAD DATA LOCAL INFILE '/data/2026/total_strokes_gained.csv'
INTO TABLE total_strokes_gained_2026
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, average_strokes_gained, strokes_gained_total, 
strokes_gained_tee_to_green, strokes_gained_putting, rounds_played);


CREATE TABLE total_strokes_gained_2025 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    average_strokes_gained DECIMAL(5, 3) NOT NULL,
    strokes_gained_total DECIMAL(10, 3) NOT NULL,
    strokes_gained_tee_to_green DECIMAL (10, 3) NOT NULL,
    strokes_gained_putting DECIMAL(10, 3) NOT NULL,
    rounds_played INT NOT NULL
);


LOAD DATA LOCAL INFILE '/data/2025/total_strokes_gained.csv'
INTO TABLE total_strokes_gained_2025
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, average_strokes_gained, strokes_gained_total, 
strokes_gained_tee_to_green, strokes_gained_putting, rounds_played);

CREATE TABLE total_strokes_gained_2024 (
	PLAYER_ID INT NOT NULL PRIMARY KEY,
    PLAYER VARCHAR(100) NOT NULL,
    season VARCHAR(50) NOT NULL,
    average_strokes_gained DECIMAL(5, 3) NOT NULL,
    strokes_gained_total DECIMAL(10, 3) NOT NULL,
    strokes_gained_tee_to_green DECIMAL (10, 3) NOT NULL,
    strokes_gained_putting DECIMAL(10, 3) NOT NULL,
    rounds_played INT NOT NULL
);


LOAD DATA LOCAL INFILE '/data/2024/total_strokes_gained.csv'
INTO TABLE total_strokes_gained_2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(PLAYER_ID, PLAYER, season, average_strokes_gained, strokes_gained_total, 
strokes_gained_tee_to_green, strokes_gained_putting, rounds_played);


