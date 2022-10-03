CodeSystem: HealthInsurancePaymentSourceCS
Title: "Health Insurance Payment Source CodeSystem"
Description: "Sources for Payment for Element 3010"
* ^caseSensitive = false
* ^experimental = true
* #5	"Private Health Insurance"
* #1	"Medicare"
* #2	"Medicaid"
* #31	"Military Health Care"
* #36	"State-Specific Plan (non-Medicaid)"
* #33	"Indian Health Service"


ValueSet: HealthInsurancePaymentSource
Title: "Health Insurance Payment Source"
Description: "ValueSet listing payment source codes used by ACC"
* ^experimental = true

* include codes from system  HealthInsurancePaymentSourceCS
* ncdr#100000812

ValueSet: PriorMyocardialInfarction
Title: "Myocardial Infarction"
Description: "SNOMED CT codes for MI"

* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #22298006

ValueSet: PercutaneousCoronaryIntervention
Title: "PCI"
Description: "All SNOMED Codes that are PCI Procedures"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #415070008

ValueSet: CABG
Title: "Coronary artery bypass grafting"
Description: "All SNOMED Codes that are CABG Procedures"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #232717009

ValueSet: CerebrovascularDisease
Title: "Cerebrovascular Disease"
Description: "All SNOMED Codes that are Cerebrovascular Disease"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #62914000

ValueSet: DiabetesMellitus
Title: "Diabetes Mellitus"
Description: "All SNOMED Codes that are Diabetes Mellitus"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #73211009

ValueSet: HemodialysisOrPeritonealDialysis
Title: "hemodialysis or peritoneal dialysis"
Description: "All SNOMED Codes regarding hemodialysis or peritoneal dialysis"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #108241001

ValueSet: ChronicLungDisease
Id: ChronicLungDisease
Title: "Chronic Lung Disease"
Description: "Chronic Lung Disease as defined by ACC"
* ^copyright = """
* This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement
* This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc
"""
* ^experimental = true
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
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #399957001

ValueSet: Hypertension  
Title: "Hypertension"
Description: "All SNOMED Codes that are Hypertension"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #38341003

ValueSet: Dyslipidemia  
Title: "Dyslipidemia"
Description: "All SNOMED Codes that are Dyslipidemia"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #370992007

ValueSet: SmokingStatus
Title: "Smoking Status"
Description: """
* ^experimental = true
Patient's smoking status.  
Includes all SNOMED codes related to smoking status under 'Finding of tobacco use and exposure (finding)'
"""
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #365980008


ValueSet: CardiacArrest
Title: "Cardiac Arrest"
Description: "All SNOMED Codes related to Cardiac Arrest"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #410429000

ValueSet: HeartFailure
Id: HeartFailure
Title: "Heart Failure codes from SNOMED"
Description: "All SNOMED Codes that are Heart Failure"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #84114007

ValueSet: NewYorkHeartAssociationQuery
Id: NewYorkHeartAssociation
Title: "New York Heart Association Assessment Scale"
Description: "Includes codes from SNOMED and LOINC"
* ^experimental = true
* ^copyright = """
* This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement
* This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc
"""
* $loinc#88020-3
* $sct#420816009
* $sct#762994006

ValueSet: AbnormalElectrocardiacAssessment
Id: AbnormalElectrocardiacAssessment
Title: "Abnormal Electrocardiac Assessment"
Description: "All SNOMED codes that are an abnormal Electrocardiac Assessment result"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #102594003

ValueSet: CardiacCTA
Id: CardiacCTA
Title: "CTA Heart and Coronary arteries"
Description: "CTA Heart and Coronary arteries" 
* ^experimental = true
* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
* $loinc#79073-3
* $loinc#86980-0
* $loinc#89927-8
* $loinc#83289-9

ValueSet: StressTest
Id: StressTest
Title: "Cath PCI Selected Stress Test"
Description: "All ACC Selected Stress Tests for the CathPCI submission"
* ^experimental = true
* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
* $loinc#18752-6
* $loinc#18107-3
* $loinc#49569-7
* $loinc#58750-1

ValueSet: OrganDonor
Id: OrganDonor
Title: "SNOMED Valueset of Organ Donor codes"
Description: "All SNOMED codes that are an Organ Donor (person)"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #105461009

ValueSet: ValvularStenosis
Id: ValvularStenosis
Title: "Valvular Stenosis"
Description: "Loinc codes for Valvular Stenosis"
* ^experimental = true
* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
* $loinc#77916-5
* $loinc#78183-1 	
* $loinc#77912-4

ValueSet: ValvularRegurgitation
Id: ValvularRegurgitation
Title: "Valvular Regurgitation"
Description: "Existance of Valvular Regurgitation"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #40445007

ValueSet: PCIOperator
Id: PCIOperator
Title: "PCI Operator SNOMED codes"
Description:  "POssible codes for PCI Operator"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* $sct#1421009 
* $sct#56545009 
* $sct#304292004 
* $sct#309369000 
* $sct#309371000 

ValueSet: CardiacCatheter
Title: "SNOMED Cardiac Catheters"
Description: "SNOMED Cardiac Catheters set"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #706539002

ValueSet: PackedRedBloodCells
Title: "Packed Red Blood Ceels"
Description: "SNOMED codes for PRBC"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #431069006

ValueSet: SeattleAnginaQs
Id: SEattleAnginaQs
Title: "Seattle Angina Questions"
Description: "All LIONC codes for Seattle Angina Questions"
* ^experimental = true
* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
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
* ^experimental = true
* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
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
* ^experimental = true
* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc"
* $loinc#89437-8
* $loinc#89435-2
* $loinc#89438-6
* $loinc#89439-4

ValueSet: YesNo
Id: YesNo
Title: "Yes or No"
Description: "Affirmative or Negative"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* $sct#373066001 
* $sct#373067005 

ValueSet: MyocardialInfarction
Id: MyocardialInfarction
Title: "Myocardial Infarction"
Description: "Full SNOMED set for MI"
* ^experimental = true
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #22298006

ValueSet: PriorCoronaryArteryBypassGraft
Id: PriorCABG
Title: "Prior History of Coronary Artery Bypass Graft"
Description: "All SNOMED and LOINC codes for CABG or Prior CABG"
* ^experimental = true
* ^copyright = """
* This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement
* This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc
"""
* include codes from system $sct where concept is-a #232717009
* $loinc#88654-9 