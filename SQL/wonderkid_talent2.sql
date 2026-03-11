CREATE DATABASE wonderkid_talent CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

SELECT * 
FROM player_data
LIMIT 50;

SELECT * FROM
player_data
WHERE `Mins Played` < 500;

CREATE TABLE wonderkid_talent2 LIKE player_data;

INSERT wonderkid_talent2 
SELECT * 
FROM player_data;

SELECT * 
FROM wonderkid_talent2
LIMIT 100;

SELECT COUNT(*)
FROM wonderkid_talent2
WHERE `Player Age` <= 21;

SELECT COUNT(*)
FROM wonderkid_talent2
WHERE `Mins Played` < 500 AND `player age` <= 21;

-- DELETE DATA PLAYER HAVE MINUTE PLAY < 500 AND 
DELETE 
FROM wonderkid_talent2
WHERE `Mins Played` < 500;

SELECT 
	`Player Name`, 
    `Player Team`, 
    `Mins Played`, 
    `Position 1`,
    `Position 2`
FROM wonderkid_talent2
WHERE `Mins Played` > 500 AND `player age` <= 21;

SELECT DISTINCT(`Position 1`)
FROM wonderkid_talent2;

SELECT
	`Player Name`,
    `Position 1`,
    `Player Team`,
    `Player Age`,
	CASE
		WHEN `Position 1` IN ('GK') THEN 'Goalkeeper'
        WHEN (`Position 1` LIKE 'D%' OR `Position 1` LIKE 'RB%' OR `Position 1` LIKE 'LB%') AND `Position 1` NOT LIKE 'DMC%'  THEN 'Defender'
		WHEN `Position 1` LIKE 'DMC%' OR `Position 1` LIKE 'M%' AND `Position 1` NOT LIKE 'AM%' THEN 'Midfielder'
        WHEN `Position 1` LIKE 'FW%' OR `Position 1` LIKE 'AM%' THEN 'Attacker'
        ELSE 'Uncategorized'
	END AS General_position
FROM wonderkid_talent2
WHERE `Mins Played` > 500 AND `player age` <= 21
ORDER BY general_position asc;

SELECT 
	`Player Name`, 
    `Player Age`,
    `Mins Played`, 
    `Position 1`,
    (goal+assistTotal) AS G_plus_A,
    xG,
    	CASE
		WHEN `Position 1` IN ('GK') THEN 'Goalkeeper'
        WHEN (`Position 1` LIKE 'D%' OR `Position 1` LIKE 'RB%' OR `Position 1` LIKE 'LB%') AND `Position 1` NOT LIKE 'DMC%'  THEN 'Defender'
		WHEN `Position 1` LIKE 'DMC%' OR `Position 1` LIKE 'M%' AND `Position 1` NOT LIKE 'AM%' THEN 'Midfielder'
        WHEN `Position 1` LIKE 'FW%' OR `Position 1` LIKE 'AM%' THEN 'Attacker'
        ELSE 'Uncategorized'
	END AS General_position
FROM wonderkid_talent2
WHERE `Mins Played` > 500 AND `player age` <= 21
ORDER BY G_plus_A DESC;

DELETE 
FROM wonderkid_talent2
WHERE `Player Age` > 21;

SELECT * 
FROM wonderkid_talent2;
