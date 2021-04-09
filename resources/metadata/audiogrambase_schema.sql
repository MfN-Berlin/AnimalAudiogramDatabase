-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: audiogrambase
-- ------------------------------------------------------
-- Server version	10.4.12-MariaDB-1:10.4.12+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audiogram_data_point`
--

DROP TABLE IF EXISTS `audiogram_data_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiogram_data_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testtone_duration_in_millisecond` decimal(8,2) DEFAULT NULL COMMENT 'The duration of the applied test tone in ms.',
  `testtone_frequency_in_khz` float DEFAULT NULL COMMENT 'The frequency of the applied test tone in kHz.',
  `sound_pressure_level_in_decibel` decimal(5,2) DEFAULT NULL COMMENT 'The measured response SPL value in decibel.',
  `sound_pressure_level_reference_id` int(11) DEFAULT NULL COMMENT 'The SPL reference for this measurement. References the corresponding entry in table sound_pressure_level_reference.',
  `sound_pressure_level_reference_method` enum('root mean squared (RMS)','peak to peak (PP)') DEFAULT NULL COMMENT 'The method for applying the SPL reference.',
  `audiogram_experiment_id` int(11) DEFAULT NULL COMMENT 'References the audiogram experiment in which this datum was generated.',
  PRIMARY KEY (`id`),
  KEY `audiogram_experiment_id_idx` (`audiogram_experiment_id`),
  KEY `sound_pressure_level_reference_fkey_idx` (`sound_pressure_level_reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3053 DEFAULT CHARSET=utf8mb4 COMMENT='This table holds information on individual data points of a given audiogram experiment.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audiogram_experiment`
--

DROP TABLE IF EXISTS `audiogram_experiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiogram_experiment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facility_id` int(11) DEFAULT NULL COMMENT 'The facility which conducted the audiogram experiment.',
  `latitude_in_decimal_degree` float DEFAULT NULL COMMENT 'The geographical latitude of the experimental setup.',
  `longitude_in_decimal_degree` float DEFAULT NULL COMMENT 'The geographical longitude of the experimental setup.',
  `position_of_animal` varchar(1024) DEFAULT NULL COMMENT 'The exact position of the animal',
  `distance_to_sound_source_in_meter` decimal(4,2) DEFAULT NULL COMMENT 'The distance of the sound source measured in meters.',
  `test_environment_description` varchar(2048) DEFAULT NULL COMMENT 'A description of the test environment.\n\nExample:\nThe test pool, filled with sea water, was about 4 m deep and 15 m in diameter.',
  `medium` enum('air','water') DEFAULT NULL COMMENT 'Whether the audiogram was obtained in air or underwater',
  `measurement_method_id` int(11) DEFAULT NULL COMMENT 'The measurement method used in the audiogram experiment. References the corresponding entry in the method table.\n\n- behavioral methods: go - no go, pressing a paddle, pushing something\n- electrophysiological methods: auditory evoked potentials (AEP), auditory brain-stem responses (ABR)',
  `position_first_electrode` varchar(1000) DEFAULT NULL COMMENT 'In the case of electrophysiological subjects, the exact positions of the electrodes are indicated. The positions of the individual electrodes are recorded separately.\nFor example, a position can be indicated as: left pan bone, right pan bone, near the blowhole, near the dorsal fin, on the back, near the beginning of the dorsal ridge, posterior to the dorsal ridge.',
  `position_second_electrode` varchar(1000) DEFAULT NULL COMMENT 'In the case of electrophysiological subjects, the exact positions of the electrodes are indicated. The positions of the individual electrodes are recorded separately.\nFor example, a position can be indicated as: left pan bone, right pan bone, near the blowhole, near the dorsal fin, on the back, near the beginning of the dorsal ridge, posterior to the dorsal ridge..',
  `position_third_electrode` varchar(1000) DEFAULT NULL COMMENT 'In the case of electrophysiological subjects, the exact positions of the electrodes are indicated. The positions of the individual electrodes are recorded separately.\nFor example, a position can be indicated as: left pan bone, right pan bone, near the blowhole, near the dorsal fin, on the back, near the beginning of the dorsal ridge, posterior to the dorsal ridge..',
  `year_of_experiment_start` year(4) DEFAULT NULL COMMENT 'The year in which the audiogram experiment started.',
  `year_of_experiment_end` year(4) DEFAULT NULL COMMENT 'The year in which the audiogram experiment ended.',
  `background_noise_in_decibel` decimal(5,2) DEFAULT NULL COMMENT 'If information about background noise during the experiment is mentioned in the publication, it will be recorded here.',
  `calibration` varchar(2048) DEFAULT NULL COMMENT 'Information about the calibration value is recorded here with regard to the Sound Pressure Level (SPL) reference value.',
  `threshold_determination_method` decimal(5,2) DEFAULT NULL COMMENT 'Indicates the percentage at which the threshold was set.',
  `testtone_form_method_id` int(11) DEFAULT NULL COMMENT 'Indicates the method applied regarding the form of the test tone. References the corresponding entry in the method table.\n\n- cosine-gated tone bursts\n- sinusodial amplitude modulated tone (SAM) (subcategories: modulated narrow band noise, modulated rectangular click, pure tone)\n- sinusodial frequency modulated tone (FM) (subcategories: linear upward frequency modulated sweep, linear downward frequency modulated sweep, sinusoidal frequency modulation)',
  `testtone_presentation_staircase` enum('yes','no','unknown') DEFAULT NULL COMMENT 'Indicates wether or not a staircase procedure for presenting the test tone was applied.',
  `testtone_presentation_method_constants` enum('yes','no','unknown') DEFAULT NULL COMMENT 'Indicates wether the method of constant stimuli was applied or not.',
  `testtone_presentation_sound_form` enum('click','tone-pips','pip trains','prolonged','SAM (sinusoidal amplitude modulation)') DEFAULT NULL COMMENT 'The form of the test tone presentation. Two categories: click, prolonged.',
  `sedated` enum('yes','no','unknown') DEFAULT NULL COMMENT 'Indicates if the test animal was sedated.',
  `sedation_details` varchar(1000) DEFAULT NULL COMMENT 'More detailed  information about sedation will be collected here.',
  `number_of_measurements` int(11) DEFAULT NULL COMMENT 'The number of individual tests from which the audiogram data was aggregated.',
  `measurement_type` enum('auditory threshold','critical ratio','critical bandwidth','time period of integration','TTS - Temporary Threshold Shift','PTS - Permanent Threshold Shift','signal duration test') DEFAULT 'auditory threshold' COMMENT 'Measurement type of experiment.',
  PRIMARY KEY (`id`),
  KEY `facility_fkey_idx` (`facility_id`),
  KEY `method_fkey_idx` (`measurement_method_id`,`testtone_form_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8mb4 COMMENT='This table holds information on particular audiogram experiments.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audiogram_publication`
--

DROP TABLE IF EXISTS `audiogram_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiogram_publication` (
  `audiogram_experiment_id` int(11) NOT NULL COMMENT 'Indicates the audiogram experiment. References the corresponding entry in the audiogram_experiment table.',
  `publication_id` int(11) NOT NULL COMMENT 'Indicates the source publication. References the corresponding entry in the publication table.',
  KEY `source_publication_fkey_idx` (`publication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table holds information on the audiograms published in a given source publication and vice versa. One source can contain several audiograms. Data of the same audiogram experiment can be contained in more than one publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) DEFAULT NULL COMMENT 'The name of the facility.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COMMENT='The facility which conducted the experiment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `individual_animal`
--

DROP TABLE IF EXISTS `individual_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `individual_animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `individual_name` varchar(45) DEFAULT NULL COMMENT 'The vernacular name for this individual animal. Such a name exists only in certain cases.',
  `sex` enum('female','male') DEFAULT NULL COMMENT 'The biological sex of the individual animal.',
  `taxon_id` int(11) DEFAULT NULL COMMENT 'The biological species the animal belongs to. References a record from the taxon table.',
  PRIMARY KEY (`id`),
  KEY `fk_individual_animal_individual_animal1_idx` (`taxon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=utf8mb4 COMMENT='This table holds information on the biological individuals used as test animals in a given experiment.	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `method`
--

DROP TABLE IF EXISTS `method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `method` (
  `id` int(11) NOT NULL,
  `category_level` int(11) DEFAULT NULL COMMENT 'Indicates the category level of this method. "1" indicates that this method is a main method which may have a number of sub-methods. Sublevels are indicated by consecutive numbers.',
  `denomination` varchar(45) DEFAULT NULL COMMENT 'The denomination, or name, of the method.',
  `parent_method_id` int(11) DEFAULT NULL COMMENT 'Indicates the parent method category, if any. References another record in this table.',
  PRIMARY KEY (`id`),
  KEY `parent_method_fkey_idx` (`parent_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table holds information on experimental methods for conducting audiophysiological experiments. A method can have specialized variants. The relation between a main method and a specialized variant of it is represented by the parent_method_id attribute.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citation_long` varchar(1024) DEFAULT NULL COMMENT 'Long citation style reference of the published work.',
  `citation_short` varchar(45) DEFAULT NULL COMMENT 'Short citation style reference of the published work.',
  `doi` varchar(45) DEFAULT NULL COMMENT 'The digital object identifier (DOI) of the published work.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COMMENT='This table holds information about sources where audiogram data was originally published.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sound_pressure_level_reference`
--

DROP TABLE IF EXISTS `sound_pressure_level_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sound_pressure_level_reference` (
  `id` int(11) NOT NULL,
  `spl_reference_value` float DEFAULT NULL COMMENT 'The numerical value of the SPL reference.',
  `spl_reference_unit` varchar(45) DEFAULT NULL COMMENT 'The measurement unit of the SPL reference value.',
  `spl_reference_significance` varchar(45) DEFAULT NULL COMMENT 'The significance of this SPL reference in terms of its relation to modern air- and waterborne sound references.',
  `conversion_factor_airborne_sound_in_decibel` int(11) DEFAULT NULL COMMENT 'The conversion value in decibel for the SPL reference to convert values measured with this reference to the modern reference value for airborne sound.',
  `conversion_factor_waterborne_sound_in_decibel` int(11) DEFAULT NULL COMMENT 'The conversion value in decibel for the SPL reference to convert values measured with this reference to the modern reference value for waterborne sound.',
  `spl_reference_display_label` varchar(45) GENERATED ALWAYS AS (concat('re ',`spl_reference_value`,' ',`spl_reference_unit`)) VIRTUAL COMMENT 'This column contains a label for the SPL reference from the corresponding reference value and unit.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='This table holds information on the various sound pressure level reference values.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxon`
--

DROP TABLE IF EXISTS `taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon` (
  `ott_id` int(11) NOT NULL COMMENT 'The Open Tree of Life id of this taxon.',
  `unique_name` varchar(1024) NOT NULL COMMENT 'The scientific name of this taxon.',
  `rank` enum('subspecies','species','genus','family','order','class','phylum') NOT NULL COMMENT 'The rank of this taxon.',
  `parent` int(11) DEFAULT NULL COMMENT 'The parent taxon of this taxon References a record from the taxon table.',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `vernacular_name_english` varchar(1024) DEFAULT NULL,
  `vernacular_name_german` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ott_id`),
  KEY `fk_taxon_taxon1_idx` (`parent`),
  KEY `taxon_lftx` (`lft`),
  KEY `taxon_rgtx` (`rgt`),
  KEY `taxon_vernacular_name_englishx` (`vernacular_name_english`),
  KEY `taxon_vernacular_name_germanx` (`vernacular_name_german`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_animal`
--

DROP TABLE IF EXISTS `test_animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audiogram_experiment_id` int(11) DEFAULT NULL COMMENT 'Indicates the audiogram experiment that this test is a part of. References the corresponding record in the audiogram_experiment table.',
  `individual_animal_id` int(11) DEFAULT NULL COMMENT 'Indicates the individual animal tested in this particular test. References the corresponding entry in the individual_animal table.',
  `life_stage` enum('juvenile','sub-adult','adult','hatchling','post-hatchling') DEFAULT NULL,
  `age_min_in_month` decimal(5,2) DEFAULT NULL,
  `age_max_in_month` decimal(5,2) DEFAULT NULL,
  `liberty_status` enum('wild','captive','stranded') DEFAULT NULL,
  `captivity_duration_in_month` decimal(5,2) DEFAULT NULL,
  `biological_season` enum('courtship','pairing','rearing young animals') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `individual_animal_fkey_idx` (`individual_animal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8mb4 COMMENT='This table holds information on the test animals used in a given audiogram experiment. This maps individual audiograms to individual animals (which may not have a name and it is possible that the same anonymous animal has more than one entry in the animal table.)';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-09  8:59:52
