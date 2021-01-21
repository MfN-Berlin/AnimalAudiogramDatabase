# Audiogram Metadata Scheme

## About this document

This document describes the audiogram metadata scheme used in the AAD. Its elements specify properties of the experimental procedure (experiment details), the animal subjects used in the experiments (animal details), and the source of the data (publication details) of an audiometric experiment yielding audiogram data.
This scheme was initially developed based on research community feedback on metadata necessary for interpretation and reuse of audiogram data within the project [Hearing in Penguins](https://unterwasserlaerm.museumfuernaturkunde.berlin/en/project-hearing-in-penguins/about-us). Subsequently, these attributes were used to curate audiogram datasets from the literature and represent both the measurement data and the associated data about the test animals and experimental procedures in the [Animal Audiogram Database](https://animalaudiograms.museumfuernaturkunde.berlin).

## Category 1: Animal details
The category animal details specifies data about the test animals used in the audiometric experiment. This data should be recorded for each individual animal included in a given study.

### 1.1 species
* definition: A reference to the biological species that the test animal belongs to.
* value range: text
* note: As a default the valid scientific name for the species should be indicated.
    
### 1.2	unique animal identifier
* definition: A unique attribute or combination of attributes, which allows identifying an individual animal across experimental investigations.
* value range: text
* note:  It is not uncommon for test animals to have a unique individual name or identifier, especially with marine vertebrates in captivity. If available, this name, together with other relevant animal data to allow unique identification (e.g., Passive Integrated Transponder (PIT) tag IDs), should be recorded to enable identifying the same individual in different experiments. Since many animals in psychophysical experiments are trained and live for a longer time frame, repeat measurements from the same animal can be obtained. This is crucial for obtaining representative audiograms for a species, assuming that there is no loss of hearing in the tested animal. The same holds true for more elaborate tests of temporary or permanent hearing loss.

### 1.3	sex
* definition: The biological sex of the test animal.
* value range: female; male

### 1.4	life stage
* definition: The life stage of the test animal.
* value range: text
* typical values: juvenile / adult
* note: Other values, depending on life stage terminology for individual species are possible.

### 1.5	age
* definition: The age of the test animal in months.
* value range: numerical
* note: Uncertainty about the age might require recording age by specifying a lower and upper estimate in months for the age of the animal.

### 1.6	captivity status
* definition: The status of the animal with regard to captivity.
* value range: text
* typical values: wild / captive / stranded
* note: The values wild, captive, and stranded are applicable especially for marine mammals. Other values, depending on life stage terminology for individual species are possible.

### 1.7	captivity duration
* definition: The duration of captivity in months for test animals in captivity.
* value range: numerical
* note: Applicable only to animals with captivity status captive.

## Category 2:	Method details
The category method details specifies attributes of the experimental procedure.

### 2.1	institution
* definition: A reference for the institution where the experiment yielding the dataset was conducted.
* value range: text

### 2.2	test period
* definition: The time interval during which the experiments that yield the audiogram dataset were conducted.
* value range: text
* note: The overall time period of experimental investigation with a start and end date.

### 2.3	test environment
* definition: Additional pertinent information on the test environment.
* value range: text
* example: The test pool, filled with sea water, was about 4 m deep and 15 m in diameter.

### 2.4	individuals count
* definition: The number of test animals used for the audiogram dataset.
* value range: numerical

### 2.5	animal position
* definition: The position of the animal during the measurement with respect to submersion or other relevant characteristics of the position with regard to the experimental setup or test environment during measurement.
* value range: text
* typical values: totally underwater / head just below water surface / head half out of water / outside of the water
* note: The values totally underwater / head just below water surface / head half out of water / outside water are applicable especially for experimental setups for marine mammals. Other values, depending on the particular experimental setup are possible.

### 2.6	sedation state
* definition: Indicates whether or not the test animal was sedated.
* value range: yes / no / unknown

### 2.7	sedation details
* definition: Additional pertinent information on the sedation procedure.
* value range: text

### 2.8	test medium
* definition: The medium in which the test tone was perceived by the test animal.
* value range: air / water

### 2.9	source distance
* definition: The distance of the test tone source device from the test animal in meters.
* value range: numerical

### 2.10	test tone duration
* definition: Test tone duration in milliseconds.
* value range: numerical

### 2.11	test tone form
* definition: Indication whether pure tones were used or whether the amplitude or frequency was modulated.
* value range: text
* typical values: pure tone / cosine-gated tone bursts / sinusoidal amplitude modulated (SAM) tone (modulated narrow band noise / modulated rectangular click / pure tone) / sinusoidal frequency modulated (FM) tone (linear upward frequency modulated sweep / linear downward frequency modulated sweep / sinusoidal frequency modulation) /  tone-pips

### 2.12	test tone presentation
* The presentation mode of the test tone.
* value range: click /pip trains / prolonged

### 2.13	staircase procedure
* definition: An indicator for whether or not the test tone was presented by following a staircase procedure.
* value range: yes / no / unknown

### 2.14	method of constants
* definition: An indicator for whether or not the test tone was presented by following a method of constants.
* value range: yes / no / unknown

### 2.15	calibration
* definition: Description of the calibration procedure and parameters with regard to the sound pressure level reference value.
* value range: text

### 2.16	measurement repeats
* definition: The number of repeat measurements for a given frequency and sound pressure for the audiogram dataset.
* value range: numerical

### 2.17	threshold value
* definition: An indicator of the minimum proportion of repeat measurements with a positive animal response in order to evaluate as positive test result for a given test tone frequency and sound pressure..
* value range: numerical
* note: usually indicated as percentage.

### 2.18	test method
* definition: The type of method used in the experimental setup yielding the audiogram dataset.
* value range: go – no go / go – no go & biting a target / go – no go & touching a target / go – no go & vocalization (behavioural methods); auditory evoked potentials (AEP) / auditory brain-stem responses (ABR) / envelope-following responses (EFR) (electrophysiological methods)

### 2.19	electrode position
* definition: A descriptive term indicating the position of the electrode sensor during the experiment.
* value range: text
* typical values: near the ear / left pan bone / right pan bone / near the blowhole / near the dorsal fin / on the back / near the beginning of the dorsal ridge / posterior to the dorsal ridge
* note: Applicable only for electrophysiological experiments. The position of each electrode is to be documented separately.

## Category 3:	Publication details
The category publication details provides references to the original publication of the audiometric data in a given dataset.

### 3.1	source long
* definition: A full textual reference for the source of the audiogram dataset and corresponding metadata indicating authors, title and place of publication and any other data useful to identify the source of the dataset.
* value range: text

### 3.2	source short
* definition: A short textual reference for the source of the audiogram dataset and corresponding metadata indicating author and date.
* value range: text

### 3.3	DOI
* definition: The digital object identifier (DOI) for the source of the audiogram dataset and corresponding metadata.
* value range: DOI

END OF DOCUMENT
