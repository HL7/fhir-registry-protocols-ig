ValueSet: MyocardialInfarction
Id: MyocardialInfarction
Title: "Myocardial Infarction"
Description: "Full SNOMED set for MI"
* include codes from system $sct where concept is-a #22298006

ValueSet: PriorPercutaneousCoronaryIntervention
Id: PercutaneousCoronaryIntervention
Title: "Prior History of percutaneous coronary intervention"
Description: "All SNOMED and LOINC codes for PCI or Prior PCI"
* include codes from system $sct where concept is-a #415070008
* $loinc#80727-1
* $loinc#88656-4

ValueSet: PriorCoronaryArteryBypassGraft
Id: PriorCABG
Title: "Prior History of Coronary Artery Bypass Graft"
Description: "All SNOMED and LOINC codes for CABG or Prior CABG"
* include codes from system $sct where concept is-a #232717009
* $loinc#88654-9 

ValueSet: ChronicLungDisease
Id: ChronicLungDisease
Title: "Chronic Lung Disease"
Description: "Chronic Lung Disease as defined but ACC"
* include codes from system $sct where concept is-a #413839001 
* exclude codes from system $sct where concept is-a #40122008
* exclude $sct#123713005
* exclude $sct#22607003
* exclude $sct#254826008
* exclude $sct#29422001
* $loinc#54822-2
