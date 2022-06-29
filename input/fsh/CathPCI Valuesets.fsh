CodeSystem: HealthInsurancePaymentSourceCS
Title: "Health Insurance Payment Source CodeSystem"
Description: "Sources for Payment for Element 3010"
* ^caseSensitive = false
* #5	"Private Health Insurance"
* #1	"Medicare"
* #2	"Medicaid"
* #31	"Military Health Care"
* #36	"State-Specific Plan (non-Medicaid)"
* #33	"Indian Health Service"
* #100000812	"Non-US Insurance"

ValueSet: HealthInsurancePaymentSource
Title: "Health Insurance Payment Source"
Description: "ValueSet listing payment source codes used by ACC"
* include codes from system  HealthInsurancePaymentSourceCS

ValueSet: PriorMyocardialInfarction
Title: "Myocardial Infarction"
Description: "SNOMED CT codes for MI"
* include codes from system $sct where concept is-a #22298006

ValueSet: PercutaneousCoronaryIntervention
Title: "PCI"
Description: "All SNOMED Codes that are PCI Procedures"
* include codes from system $sct where concept is-a #415070008

ValueSet: CABG
Title: "Coronary artery bypass grafting"
Description: "All SNOMED Codes that are CABG Procedures"
* include codes from system $sct where concept is-a #232717009

ValueSet: CerebrovascularDisease
Title: "Cerebrovascular Disease"
Description: "All SNOMED Codes that are Cerebrovascular Disease"
* include codes from system $sct where concept is-a #62914000

ValueSet: DiabetesMellitus
Title: "Diabetes Mellitus"
Description: "All SNOMED Codes that are Diabetes Mellitus"
* include codes from system $sct where concept is-a #73211009

ValueSet: HemodialysisOrPeritonealDialysis
Title: "hemodialysis or peritoneal dialysis"
Description: "All SNOMED Codes regarding hemodialysis or peritoneal dialysis"
* include codes from system $sct where concept is-a #108241001

ValueSet: ChronicLungDisease
Id: ChronicLungDisease
Title: "Chronic Lung Disease"
Description: "Chronic Lung Disease as defined by ACC"
* include codes from system $sct where concept is-a #413839001 
* exclude codes from system $sct where concept is-a #40122008
* exclude $sct#123713005
* exclude $sct#22607003
* exclude $sct#254826008
* exclude $sct#29422001
* $loinc#54822-2

ValueSet:  PeripheralArterialOcclusiveDisease  
Title: "Peripheral Arterial Occlusive Disease"
Description: "All SNOMED Codes that are Chronic Lung Disease"
* include codes from system $sct where concept is-a #399957001

ValueSet: Hypertension  
Title: "Hypertension"
Description: "All SNOMED Codes that are Hypertension"
* include codes from system $sct where concept is-a #38341003

ValueSet: Dyslipidemia  
Title: "Dyslipidemia"
Description: "All SNOMED Codes that are Dyslipidemia"
* include codes from system $sct where concept is-a #370992007

ValueSet: SmokingStatus
Id: SmokingStatus
Title: "Smoking Status"
Description: """
Patient's smoking status.  
Includes all SNOMED codes related to smoking status under 'Finding of tobacco use and exposure (finding)' 
"""
* include codes from system $sct where concept is-a #365980008

