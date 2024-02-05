-- DB update 2020_08_15_00 -> 2020_08_16_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2020_08_15_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2020_08_15_00 2020_08_16_00 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1592753632765913300'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1592753632765913300');

ALTER TABLE `spell_custom_attr`
	CHANGE `entry` `spell_id` MEDIUMINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'spell id',
	CHANGE `attributes` `attributes` INT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'SpellCustomAttributes';
	
SET @SPELL_ATTR0_CU_NEGATIVE_EFF0 = 4096,
	@SPELL_ATTR0_CU_NEGATIVE_EFF1 = 8192,          
	@SPELL_ATTR0_CU_NEGATIVE_EFF2 = 16384,
	@SPELL_ATTR0_CU_POSITIVE_EFF0 = 33554432,
	@SPELL_ATTR0_CU_POSITIVE_EFF1 = 67108864,
	@SPELL_ATTR0_CU_POSITIVE_EFF2 = 134217728;

DELETE FROM `spell_custom_attr` WHERE `spell_id` IN (50344, 71204, 72410, 64412, 24732, 40268, 42396, 8455, 47585, 64904, 604, 8450, 64844, 8451, 1008, 10173, 10174, 10169, 33944, 41478, 11103, 43015, 10170, 12357, 26044, 12358, 26143, 28310, 29407, 29570, 32417, 35507, 37276, 37330, 37621, 38243, 40842, 48396, 43512, 57941, 58381, 59367, 59974, 60472, 17165, 23953, 22919, 5171, 6774, 34074, 1725, 35202, 32645, 32684, 3411, 57993, 57992, 30708, 30877, 61716, 61734, 62344, 61819, 61834, 72998, 61988, 61987, 58867, 54836, 34709, 34700, 11196, 29214, 25771);
INSERT INTO `spell_custom_attr` (`spell_id`, `attributes`) VALUES
-- Positive
(50344, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1 | @SPELL_ATTR0_CU_POSITIVE_EFF2),
(40268, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1 | @SPELL_ATTR0_CU_POSITIVE_EFF2),
(64412, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1),
(24732, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1 | @SPELL_ATTR0_CU_POSITIVE_EFF2),
(1725, @SPELL_ATTR0_CU_POSITIVE_EFF0),
(3411, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1),
(30877, @SPELL_ATTR0_CU_POSITIVE_EFF0),
(61716, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1 | @SPELL_ATTR0_CU_POSITIVE_EFF2),
(61734, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1 | @SPELL_ATTR0_CU_POSITIVE_EFF2), 
(62344, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1 | @SPELL_ATTR0_CU_POSITIVE_EFF2),
(61819, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1 | @SPELL_ATTR0_CU_POSITIVE_EFF2), 
(61834, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1 | @SPELL_ATTR0_CU_POSITIVE_EFF2),
(32645, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1 | @SPELL_ATTR0_CU_POSITIVE_EFF2),
(32684, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1 | @SPELL_ATTR0_CU_POSITIVE_EFF2),
(57992, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1 | @SPELL_ATTR0_CU_POSITIVE_EFF2),
(57993, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1 | @SPELL_ATTR0_CU_POSITIVE_EFF2),
(34074, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1 | @SPELL_ATTR0_CU_POSITIVE_EFF2),
(64844, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1),
(64904, @SPELL_ATTR0_CU_POSITIVE_EFF1 | @SPELL_ATTR0_CU_POSITIVE_EFF2),
(47585, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF2),
(5171, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1),
(6774, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1),
(11103, @SPELL_ATTR0_CU_POSITIVE_EFF0),
(12357, @SPELL_ATTR0_CU_POSITIVE_EFF0),
(12358, @SPELL_ATTR0_CU_POSITIVE_EFF0),
(1008, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1),
(8455, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1),
(10169, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1),
(10170, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1),
(604, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1),
(8450, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1),
(8451, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1),
(10173, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1),
(10174, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1),
(33944, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1),
(41478, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1), 
(43015, @SPELL_ATTR0_CU_POSITIVE_EFF0 | @SPELL_ATTR0_CU_POSITIVE_EFF1),

-- Negative
(25771, @SPELL_ATTR0_CU_NEGATIVE_EFF0),
(30708, @SPELL_ATTR0_CU_NEGATIVE_EFF0),
(35202, @SPELL_ATTR0_CU_NEGATIVE_EFF0),
(72998, @SPELL_ATTR0_CU_NEGATIVE_EFF0), 
(61988, @SPELL_ATTR0_CU_NEGATIVE_EFF0),
(61987, @SPELL_ATTR0_CU_NEGATIVE_EFF0),
(71204, @SPELL_ATTR0_CU_NEGATIVE_EFF0),
(58867, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1), 
(54836, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(72410, @SPELL_ATTR0_CU_NEGATIVE_EFF0),
(34709, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1 | @SPELL_ATTR0_CU_NEGATIVE_EFF2),
(34700, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1 | @SPELL_ATTR0_CU_NEGATIVE_EFF2), 
(11196, @SPELL_ATTR0_CU_NEGATIVE_EFF0),
(29214, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(17165, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(22919, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(23953, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(26044, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1 | @SPELL_ATTR0_CU_NEGATIVE_EFF2),
(26143, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(28310, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(29407, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(29570, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(32417, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(35507, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(37276, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(37330, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(37621, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(38243, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(40842, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(42396, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(43512, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(57941, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(58381, @SPELL_ATTR0_CU_NEGATIVE_EFF0),
(59367, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(59974, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1),
(60472, @SPELL_ATTR0_CU_NEGATIVE_EFF0 | @SPELL_ATTR0_CU_NEGATIVE_EFF1);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;