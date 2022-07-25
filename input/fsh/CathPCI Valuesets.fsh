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


ValueSet: HealthInsurancePaymentSource
Title: "Health Insurance Payment Source"
Description: "ValueSet listing payment source codes used by ACC"
* include codes from system  HealthInsurancePaymentSourceCS
* ncdr#100000812

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
Title: "Smoking Status"
Description: """
Patient's smoking status.  
Includes all SNOMED codes related to smoking status under 'Finding of tobacco use and exposure (finding)' 
"""
* include codes from system $sct where concept is-a #365980008


ValueSet: CardiacArrest
Title: "Cardiac Arrest "
Description: "All SNOMED Codes related to Cardiac Arrest"
* include codes from system $sct where concept is-a #410429000

ValueSet: HeartFailure
Id: HeartFailure
Title: "Heart Failure codes from SNOMED"
Description: "All SNOMED Codes that are Heart Failure"
* include codes from system $sct where concept is-a #84114007

ValueSet: NewYorkHeartAssociationQuery
Id: NewYorkHeartAssociation
Title: "New York Heart Association Assessment Scale"
Description: "Includes codes from SNOMED and LOINC"
* $loinc#88020-3
* $sct#420816009
* $sct#762994006

ValueSet: AbnormalElectrocardiacAssessment
Id: AbnormalElectrocardiacAssessment
Title: "Abnormal Electrocardiac Assessment  "
Description: "All SNOMED codes that are an abnormal Electrocardiac Assessment result"
* include codes from system $sct where concept is-a #102594003

ValueSet: CardiacCTA
Id: CardiacCTA
Title: "CTA Heart and Coronary arteries" 
* $loinc#79073-3
* $loinc#86980-0
* $loinc#89927-8
* $loinc#83289-9

ValueSet: StressTest
Id: StressTest
Title: "Cath PCI Selected Stress Test"
Description: "All ACC Selected Stress Tests for the CathPCI submission"
* $loinc#18752-6
* $loinc#18107-3
* $loinc#49569-7
* $loinc#58750-1

ValueSet: OrganDonor
Id: OrganDonor
Title: "SNOMED Valueset of Organ Donor codes"
Description: "All SNOMED codes that are an Organ Donor (person)"
* include codes from system $sct where concept is-a #105461009

ValueSet: ValvularStenosis
Id: ValvularStenosis
Title: "Valvular Stenosis"
Description: ""
* $loinc#77916-5
* $loinc#78183-1 	
* $loinc#77912-4

ValueSet: ValvularRegurgitation
Id: ValvularRegurgitation
Title: "Valvular Regurgitation"
* include codes from system $sct where concept is-a #40445007

ValueSet: PCIOperator
Id: PCIOperator
Title: "PCI Operator SNOMED codes"
Description:  "POssible codes for PCI Operator"
* $sct#1421009 
* $sct#56545009 
* $sct#304292004 
* $sct#309369000 
* $sct#309371000 

ValueSet: CardiacCatheter
Title: "SNOMED Cardiac Catheters"
Description: ""
* include codes from system $sct where concept is-a #706539002

ValueSet: PackedRedBloodCells
Title: "Packed Red Blood Ceels"
Description: "SNOMED codes for PRBC"
* include codes from system $sct where concept is-a #431069006

ValueSet: SeattleAnginaQs
Id: SEattleAnginaQs
Title: "Seattle Angina Questions"
Description: "All LIONC codes for Seattle Angina Questions"
* $loinc#88476-7 	
* $loinc#88478-3
* $loinc#88477-5 	
* $loinc#88469-2
* $loinc#88480-9
* $loinc#88475-9 	
* $loinc#88473-4 	

ValueSet: SeattleAnginaAs
Id: SeattleAnginaAs
Title: "Seattle Angina Answers"
Description: "LOINC codes for the answers to SA Questions"
* $loinc#LA28518-1
* $loinc#LA25000-3
* $loinc#LA27770-9
* $loinc#LA13834-9
* $loinc#LA27722-0
* $loinc#LA28522-3

ValueSet: RoseDyspneaQ
Id: RoseDyspneaQ
Title: "Rose Dyspnea Questions"
Description: "LOINC codes for Rose Dyspnea Questions"
* $loinc#89437-8
* $loinc#89435-2
* $loinc#89438-6
* $loinc#89439-4

ValueSet: YesNo
Id: YesNo
Title: "Yes or No"
Description: "Affirmative or Negative"
* $sct#373066001 
* $sct#373067005 