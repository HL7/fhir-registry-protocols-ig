ValueSet: MyocardialInfarction
Id: MyocardialInfarction
Title: "Myocardial Infarction"
Description: "Full SNOMED set for MI"
* include codes from system $sct where concept is-a #22298006

ValueSet: PriorCoronaryArteryBypassGraft
Id: PriorCABG
Title: "Prior History of Coronary Artery Bypass Graft"
Description: "All SNOMED and LOINC codes for CABG or Prior CABG"
* include codes from system $sct where concept is-a #232717009
* $loinc#88654-9 


