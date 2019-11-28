# MDA-OnlineComments
Supplementary materials for: Are online news comments like face-to-face conversation? A multi-dimensional analysis of an emerging register (version 1.0)

### DOI


[![DOI](https://zenodo.org/badge/224676981.svg)](https://zenodo.org/badge/latestdoi/224676981)

https://zenodo.org/badge/latestdoi/224676981



### Description

This repository contains the original data, script, and additional statistical material for conducting a multi-dimensional analysis of online news comments vis-à-vis other traditional English registers as described in

* Ehret, Katharina, and Maite Taboada. (in press). “Are online news comments like face-to-face conversation? A multi-dimensional analysis of an emerging register”. *Register Studies*.

This publication focuses on the question of whether online news comments are like face-to-face conversation or not. It is a widespread view that online comments are like "dialogue", with comments often being referred to as "conversations". These assumptions, however, lack empirical back-up. In order to answer this question, register-relevant properties of online news comments are systematically explored using multi-dimensional analysis (MDA) techniques. Specifically, MDA is used to establish what online comments are like by describing their linguistic features and comparing them to traditional registers (e.g. face-to-face conversation, academic writing). 

The dataset published in this repository is based on comments and opinion articles of the *Simon Fraser University opinion and
comments corpus* (SOCC, https://github.com/sfu-discourse-lab/SOCC) as well as the Canadian component of the *International Corpus of English* (ICE, http://ice-corpora.net/ice/). The original corpus data was annotated with parts-of-speech tags using the *Multidimensional Ananylsis Tagger* (MAT, https://sites.google.com/site/multidimensionaltagger/home) and tags were retrieved with a custom-made python script (available from https://github.com/sfu-discourse-lab/MDA_project). A detailed description of the data (henceforth called SOCC-ICE dataset) and statistical procedure, i.e. factor analysis, can be found in the related publication. 

### Overview and description of the files (in alphabetical order):

##### eigenvalues_unrotated.csv
This csv contains the unrotated eigenvalues which were calculated based on the correlation matrix of normalised feature frequencies.

##### factorScores.csv

This csv contains the factor scores of a six factor solution for each of the
660 individual text in the SOCC-ICE dataset. The first column contains the file
names.

##### feature_frequencies_normalised.csv

This csv contains normalised feature frequencies of 67 lexico-grammatical
features (see POS-tag_description) which were automatically retrieved from each
text in the SOCC-ICE dataset. The frequencies were normalised per 1000 word
tokens. This csv serves as input for the factor analysis. 

##### feature_frequencies_observed.csv

This csv contains the raw feature frequencies of 67 lexico-grammatical features
(see POS-tag_description) which were automatically retrieved from each text in
the SOCC-ICE dataset.

##### loadings.csv

The feature loadings of each feature on each factor in the six factor solution.
The first column lists the feature tags (see POS-tag_description.csv, for a
description of the features).

##### mean_factorScores.csv

A csv containing the mean factor scores for each register in the SOCC-ICE
dataset. The mean factor scores were calculated based on the factor scores of the 660 individual text in the dataset. Mean factor scores are essentially an average across all texts belonging to one register (see texts_per_register.csv).

##### mean_factorScoresDeviation.csv

The standard deviation of the mean factor scores per register.

##### POS-tag_description.csv

A list of 67 lexico-grammatical features. The first column provides the tag, the second column gives a brief description of the feature.

##### r_script.r

The r script containing the commands for conducting all statistics and the
factor analysis described in the related publication.

##### texts_per_register.csv

A list of all individual texts in the SOCC-ICE dataset (first column) and
information on their register (second column) and mode of communication (third
column). This file is necessary for calculating mean factor scores per
register.
