Logical: Example_Submission_map
Id: ExampleMap
Title: "Example Submission Map"
Description: """This is an example of the data that would be used for a Resgistry Submission.
The full map is a logical model as that allows conformance to the FHIR Standard the way a custom Resource would not.
Each element has the short name of the data, a full description and the paths to fetch and place the information, by data standard type, for each.
A section (such as Demographics) is a BackboneElement (holds no values).  All subordinate elements are strings.
Each mapping includes the following:
* identity = standard used for the mapping (e.g., FHIR)
* language = mime type that matches identity
* map = FHIRPath expression of the path to the data
* comment = *Output mapping only* Resource/Profile for inclusion in the Submission Bundle
"""
// * ^baseDefinition = "http://hl7.org/fhir/StructureDefinition/base"
* ^version = "5.0"
* ^identifier.use = #official
* ^date = "2021-11-01"
* ^publisher = "Example Registry"
* ^contact.name = "Jane Smith"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "mailto:noreply@example.org"
* ^kind = #logical
//Mappings so that things show up in the mappings page on the IG
* ^mapping[+].identity = "FHIR"
* ^mapping[=].uri = "http://fhir.hl7.org"
* ^mapping[=].name = "Fast Health Interoperability Resources"
* ^mapping[=].comment = "Path to where in a FHIR Resource the data element is found"
* ^mapping[+].identity = "CDA"
* ^mapping[=].uri = "http://build.fhir.org/ig/HL7/cda-core-2.0/"
* ^mapping[=].name = "Clinical Document Architecture"
* ^mapping[=].comment = "Path to where in a CDA 2.0/CCDA 2.1 Document the data element is found"
* ^mapping[+].identity = "HL7V2"
* ^mapping[=].uri = "http://www.hl7.eu/refactored/index.html"
* ^mapping[=].name = "HL7 V2 Messages"
* ^mapping[=].comment = "Path to where in a HL7 V2 Message the data element is found"
* ^mapping[+].identity = "Output"
* ^mapping[=].uri = "http://hl7.org/fhir/us/core"
* ^mapping[=].name = "Submission Data Output location"
* ^mapping[=].comment = "Location within the requirements profile to place the data for submission in US Core or FHIR Core Resources"

* demographics 1..1 BackboneElement "Patient Demographics"

* demographics.lastName 1..1 string "Last Name" "Indicate the patient's last name. Hyphenated names should be recorded with a hyphen."
* demographics.lastName ^mapping[+].identity = "FHIR" // Always "Source Standard"
* demographics.lastName ^mapping[=].language = #application/fhir // mimetype of standard 
* demographics.lastName ^mapping[=].map = "Patient.name.family" // actual Xpath to data 
* demographics.lastName ^mapping[+].identity = "CDA"
* demographics.lastName ^mapping[=].language = #application/hl7-sda+xml // actual registered mimetype
* demographics.lastName ^mapping[=].map = "ClinicalDocument.recordTarget.patient.name.family"
* demographics.lastName ^mapping[+].identity = "HL7V2"
* demographics.lastName ^mapping[=].language = #application/edi-hl7v2 // discussed in InM but I don"t know if it was registered
* demographics.lastName ^mapping[=].map = "ADT_A01.PID.5.1" 
* demographics.lastName ^mapping[+].identity = "Output"
* demographics.lastName ^mapping[=].language = #application/fhir // output is always FHIR 
* demographics.lastName ^mapping[=].map = "Patient.name.family" // actual Xpath to data within profile in requirements
* demographics.lastName ^mapping[=].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient.name.family" // profile for Bundle inclusion

* demographics.firstName 1..1 string "First Name" "Indicate the patient's first name."
* demographics.firstName ^mapping[+].identity = "FHIR"
* demographics.firstName ^mapping[=].language = #application/fhir
* demographics.firstName ^mapping[=].map = "Patient.name.given[0]"
* demographics.firstName ^mapping[+].identity = "CDA"
* demographics.firstName ^mapping[=].language = #application/hl7-sda+xml
* demographics.firstName ^mapping[=].map = "ClinicalDocument.recordTarget.patient.name.given[1]"
* demographics.firstName ^mapping[+].identity = "HL7V2"
* demographics.firstName ^mapping[=].language = #application/edi-hl7v2
* demographics.firstName ^mapping[=].map = "ADT_A01.PID.5.2"
* demographics.firstName ^mapping[+].identity = "Output"
* demographics.firstName ^mapping[=].language = #application/fhir 
* demographics.firstName ^mapping[=].map = "Patient.name.given" 
* demographics.firstName ^mapping[=].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient.name.given[0]"

* demographics.middleName 0..* string "Middle Name" "Indicate the patient's middle names."
* demographics.middleName ^mapping[+].identity = "FHIR"
* demographics.middleName ^mapping[=].language = #application/fhir
* demographics.middleName ^mapping[=].map = "Patient.name.given[position()>0]"
* demographics.middleName ^mapping[+].identity = "CDA"
* demographics.middleName ^mapping[=].language = #application/hl7-sda+xml
* demographics.middleName ^mapping[=].map = "ClinicalDocument.recordTarget.patient.name.given[position()>1]"  
* demographics.middleName ^mapping[+].identity = "HL7V2"
* demographics.middleName ^mapping[=].language = #application/edi-hl7v2
* demographics.middleName ^mapping[=].map = "ADT_A01.PID.5.3"
* demographics.middleName ^mapping[+].identity = "Output"
* demographics.middleName ^mapping[=].language = #application/fhir // mimetype of standard 
* demographics.middleName ^mapping[=].map = "Patient.name.given" // actual Xpath to data within profile in requirements
* demographics.middleName ^mapping[=].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient.name.given[position()>1]"

* episodeInformation 1..1 BackboneElement "CathPCI Episode Information"

* episodeInformation.episodeUniqueKey 1..1 string "Episode Unique Key" "Indicate the unique key associated with each patient episode record as assigned by the EMR/EHR or your software application."
* episodeInformation.episodeUniqueKey ^mapping[+].identity = "FHIR"
* episodeInformation.episodeUniqueKey ^mapping[=].language = #application/fhir
* episodeInformation.episodeUniqueKey ^mapping[=].map = "iif(Encounter.identifier(type.code='VN').value, Encounter.identifier(type.code='VN').value, Encounter.identifier[0].value)"
* episodeInformation.episodeUniqueKey ^mapping[+].identity = "CDA"
* episodeInformation.episodeUniqueKey ^mapping[=].language = #application/hl7-sda+xml
* episodeInformation.episodeUniqueKey ^mapping[=].map = "ClinicalDocument.componentOf.encompassingEncounter.id"  
* episodeInformation.episodeUniqueKey ^mapping[+].identity = "HL7V2"
* episodeInformation.episodeUniqueKey ^mapping[=].language = #application/edi-hl7v2
* episodeInformation.episodeUniqueKey ^mapping[=].map = "ADT_A01.PV1.19.1"
* episodeInformation.episodeUniqueKey ^mapping[+].identity = "Output"
* episodeInformation.episodeUniqueKey ^mapping[=].language = #application/fhir
* episodeInformation.episodeUniqueKey ^mapping[=].map = "Encounter.identifier"
* episodeInformation.episodeUniqueKey ^mapping[=].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter.identifier[0].value)"


* arrivalInformation 1..1 BackboneElement "Patient Arrival Information"
* arrivalInformation.numberOfTransferringFacilityUnavailable 1..1 string "Number of Transferring Facility Unavailable"
* arrivalInformation.numberOfTransferringFacilityUnavailable ^mapping[+].identity = "FHIR"
* arrivalInformation.numberOfTransferringFacilityUnavailable ^mapping[=].language = #application/fhir
* arrivalInformation.numberOfTransferringFacilityUnavailable ^mapping[=].map = "resolve(Encounter.hospital.where(admitSource.coding.where(code ='hosp-trans' and system='http://terminology.hl7.org/CodeSystem/admit-source')).origin).identifier.where(system='').exists().not()"

* arrivalInformation.numberOfTransferringFacilityUnavailable ^mapping[+].identity = "Output"
* arrivalInformation.numberOfTransferringFacilityUnavailable ^mapping[=].language = #application/fhir
* arrivalInformation.numberOfTransferringFacilityUnavailable ^mapping[=].map = "Observation"
* arrivalInformation.numberOfTransferringFacilityUnavailable ^mapping[=].comment = "Observation"

* arrivalInformation.transferringFacilityAmericanHospitalAssociationName 1..1 string "Transferring Facility American Hospital Association Name"
* arrivalInformation.transferringFacilityAmericanHospitalAssociationName ^mapping[+].identity = "FHIR"
* arrivalInformation.transferringFacilityAmericanHospitalAssociationName ^mapping[=].language = #application/fhir
* arrivalInformation.transferringFacilityAmericanHospitalAssociationName ^mapping[=].map = "resolve(Encounter.hospital.where(admitSource.coding.where(code ='hosp-trans' and system='http://terminology.hl7.org/CodeSystem/admit-source')).origin).name"

* arrivalInformation.transferringFacilityAmericanHospitalAssociationName ^mapping[+].identity = "Output"
* arrivalInformation.transferringFacilityAmericanHospitalAssociationName ^mapping[=].language = #application/fhir
* arrivalInformation.transferringFacilityAmericanHospitalAssociationName ^mapping[=].map = "Observation"
* arrivalInformation.transferringFacilityAmericanHospitalAssociationName ^mapping[=].comment = "Observation"

* arrivalInformation.transferringFacilityAmericanHospitalAssociationNumber 1..1 string "Transferring Facility American Hospital Association Number"
* arrivalInformation.transferringFacilityAmericanHospitalAssociationNumber ^mapping[+].identity = "FHIR"
* arrivalInformation.transferringFacilityAmericanHospitalAssociationNumber ^mapping[=].language = #application/fhir
* arrivalInformation.transferringFacilityAmericanHospitalAssociationNumber ^mapping[=].map = "resolve(Encounter.hospital.where(admitSource.coding.where(code ='hosp-trans' and system='http://terminology.hl7.org/CodeSystem/admit-source')).origin).identifier.where(system='').value"

* arrivalInformation.transferringFacilityAmericanHospitalAssociationNumber ^mapping[+].identity = "Output"
* arrivalInformation.transferringFacilityAmericanHospitalAssociationNumber ^mapping[=].language = #application/fhir
* arrivalInformation.transferringFacilityAmericanHospitalAssociationNumber ^mapping[=].map = "Observation"
* arrivalInformation.transferringFacilityAmericanHospitalAssociationNumber ^mapping[=].comment = "Observation"

* cardiacStatus 1..1 BackboneElement "Patient Cardiac Status"

* cardiacStatus.bystanderCardiopulmonaryResuscitation 1..1 string "Bystander Cardiopulmonary Resuscitation"
* cardiacStatus.bystanderCardiopulmonaryResuscitation ^mapping[+].identity = "FHIR"
* cardiacStatus.bystanderCardiopulmonaryResuscitation ^mapping[=].language = #application/fhir
* cardiacStatus.bystanderCardiopulmonaryResuscitation ^mapping[=].map = "Observation.where(code='112000000186' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()"

* cardiacStatus.bystanderCardiopulmonaryResuscitation ^mapping[+].identity = "Output"
* cardiacStatus.bystanderCardiopulmonaryResuscitation ^mapping[=].language = #application/fhir
* cardiacStatus.bystanderCardiopulmonaryResuscitation ^mapping[=].map = "Observation"
* cardiacStatus.bystanderCardiopulmonaryResuscitation ^mapping[=].comment = "Observation"

* cardiacStatus.cardiacArrestAfterArrivalOfEmergencyMedicalServices 1..1 string "Cardiac Arrest After Arrival of Emergency Medical Services" "Indicate if the out-of-hospital cardiac arrest occurred after arrival of Emergency Medical Services (EMS)."
* cardiacStatus.cardiacArrestAfterArrivalOfEmergencyMedicalServices ^mapping[+].identity = "FHIR"
* cardiacStatus.cardiacArrestAfterArrivalOfEmergencyMedicalServices ^mapping[=].language = #application/fhir
* cardiacStatus.cardiacArrestAfterArrivalOfEmergencyMedicalServices ^mapping[=].map = "Observation.where(code='100014081' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()"

* cardiacStatus.cardiacArrestAfterArrivalOfEmergencyMedicalServices ^mapping[+].identity = "Output"
* cardiacStatus.cardiacArrestAfterArrivalOfEmergencyMedicalServices ^mapping[=].language = #application/fhir
* cardiacStatus.cardiacArrestAfterArrivalOfEmergencyMedicalServices ^mapping[=].map = "Observation"
* cardiacStatus.cardiacArrestAfterArrivalOfEmergencyMedicalServices ^mapping[=].comment = "Observation"

* cardiacStatus.cardiacArrestAtTransferringHealthcareFacility 1..1 string "Cardiac Arrest at Transferring Healthcare Facility" "Indicate if the patient had cardiac arrest at the transferring healthcare facility prior to arrival at the current facility."
* cardiacStatus.cardiacArrestAtTransferringHealthcareFacility ^mapping[+].identity = "FHIR"
* cardiacStatus.cardiacArrestAtTransferringHealthcareFacility ^mapping[=].language = #application/fhir
* cardiacStatus.cardiacArrestAtTransferringHealthcareFacility ^mapping[=].map = "Observation.where(code='100014016' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()"

* cardiacStatus.cardiacArrestAtTransferringHealthcareFacility ^mapping[+].identity = "Output"
* cardiacStatus.cardiacArrestAtTransferringHealthcareFacility ^mapping[=].language = #application/fhir
* cardiacStatus.cardiacArrestAtTransferringHealthcareFacility ^mapping[=].map = "Observation"
* cardiacStatus.cardiacArrestAtTransferringHealthcareFacility ^mapping[=].comment = "Observation"

* cardiacStatus.cardiacArrestOutOfHealthcareFacility 1..1 string "Cardiac Arrest Out of Healthcare Facility" "Indicate if a cardiac arrest event occurred outside of any healthcare facility."
* cardiacStatus.cardiacArrestOutOfHealthcareFacility ^mapping[+].identity = "FHIR"
* cardiacStatus.cardiacArrestOutOfHealthcareFacility ^mapping[=].language = #application/fhir
* cardiacStatus.cardiacArrestOutOfHealthcareFacility ^mapping[=].map = "Observation.where(code='10001424808' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()"

* cardiacStatus.cardiacArrestOutOfHealthcareFacility ^mapping[+].identity = "Output"
* cardiacStatus.cardiacArrestOutOfHealthcareFacility ^mapping[=].language = #application/fhir
* cardiacStatus.cardiacArrestOutOfHealthcareFacility ^mapping[=].map = "Observation"
* cardiacStatus.cardiacArrestOutOfHealthcareFacility ^mapping[=].comment = "Observation"

* cardiacStatus.cardiacArrestWitnessed 1..1 string "Cardiac Arrest Witnessed" "Indicate if the out-of-hospital cardiac arrest was witnessed by another person."
* cardiacStatus.cardiacArrestWitnessed ^mapping[+].identity = "FHIR"
* cardiacStatus.cardiacArrestWitnessed ^mapping[=].language = #application/fhir
* cardiacStatus.cardiacArrestWitnessed ^mapping[=].map = "Observation.where(code='100014082' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()"

* cardiacStatus.cardiacArrestWitnessed ^mapping[+].identity = "Output"
* cardiacStatus.cardiacArrestWitnessed ^mapping[=].language = #application/fhir
* cardiacStatus.cardiacArrestWitnessed ^mapping[=].map = "Observation"
* cardiacStatus.cardiacArrestWitnessed ^mapping[=].comment = "Observation"

* cardiacStatus.firstCardiacArrestRhythm 1..1 string "First Cardiac Arrest Rhythm" "Indicate if the initial out-of-hospital cardiac arrest rhythm was a shockable rhythm."
* cardiacStatus.firstCardiacArrestRhythm ^mapping[+].identity = "FHIR"
* cardiacStatus.firstCardiacArrestRhythm ^mapping[=].language = #application/fhir
* cardiacStatus.firstCardiacArrestRhythm ^mapping[=].map = "Observation.where(code='100014013' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()"

* cardiacStatus.firstCardiacArrestRhythm ^mapping[+].identity = "Output"
* cardiacStatus.firstCardiacArrestRhythm ^mapping[=].language = #application/fhir
* cardiacStatus.firstCardiacArrestRhythm ^mapping[=].map = "Observation"
* cardiacStatus.firstCardiacArrestRhythm ^mapping[=].comment = "Observation"

* cardiacStatus.firstCardiacArrestRhythmUnknown 1..1 string "First Cardiac Arrest Rhythm Unknown" "Indicate if the initial out-of-hospital cardiac arrest rhythm was unknown."
* cardiacStatus.firstCardiacArrestRhythmUnknown ^mapping[+].identity = "FHIR"
* cardiacStatus.firstCardiacArrestRhythmUnknown ^mapping[=].language = #application/fhir
* cardiacStatus.firstCardiacArrestRhythmUnknown ^mapping[=].map = "Observation.where(code='100014013' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()"

* cardiacStatus.firstCardiacArrestRhythmUnknown ^mapping[+].identity = "Output"
* cardiacStatus.firstCardiacArrestRhythmUnknown ^mapping[=].language = #application/fhir
* cardiacStatus.firstCardiacArrestRhythmUnknown ^mapping[=].map = "Observation"
* cardiacStatus.firstCardiacArrestRhythmUnknown ^mapping[=].comment = "Observation"

* episodeInformation.admissionDateAndTime 1..1 string "Admission Date and Time"
* episodeInformation.admissionDateAndTime ^mapping[+].identity = "FHIR"
* episodeInformation.admissionDateAndTime ^mapping[=].language = #application/fhir
* episodeInformation.admissionDateAndTime ^mapping[=].map = "Encounter.period.start"

* episodeInformation.admissionDateAndTime ^mapping[+].identity = "Output"
* episodeInformation.admissionDateAndTime ^mapping[=].language = #application/fhir
* episodeInformation.admissionDateAndTime ^mapping[=].map = "Observation"
* episodeInformation.admissionDateAndTime ^mapping[=].comment = "Observation"

* episodeInformation.healthInsurance 1..1 string "Health Insurance""Indicate if the patient has health insurance."
* episodeInformation.healthInsurance ^mapping[+].identity = "FHIR"
* episodeInformation.healthInsurance ^mapping[=].language = #application/fhir
* episodeInformation.healthInsurance ^mapping[=].map = "Claim.where(encounter=Encounter.id).insurance.coverage.exists()"

* episodeInformation.healthInsurance ^mapping[+].identity = "Output"
* episodeInformation.healthInsurance ^mapping[=].language = #application/fhir
* episodeInformation.healthInsurance ^mapping[=].map = "Observation"
* episodeInformation.healthInsurance ^mapping[=].comment = "Observation"

* episodeInformation.healthInsuranceClaimNumber 1..1 string "Health Insurance Claim Number (HIC)" "Indicate the patient's Health Insurance Claim (HIC) number.    Note(s):  Enter the Health Insurance Claim (HIC) number for those patients covered by Medicare. Patients with other insurances will not have a HIC number."
* episodeInformation.healthInsuranceClaimNumber ^mapping[+].identity = "FHIR"
* episodeInformation.healthInsuranceClaimNumber ^mapping[=].language = #application/fhir
* episodeInformation.healthInsuranceClaimNumber ^mapping[=].map = "resolve(Claim.where(encounter=Encounter.id).insurance.coverage).identifier.value"

* episodeInformation.healthInsuranceClaimNumber ^mapping[+].identity = "Output"
* episodeInformation.healthInsuranceClaimNumber ^mapping[=].language = #application/fhir
* episodeInformation.healthInsuranceClaimNumber ^mapping[=].map = "Observation"
* episodeInformation.healthInsuranceClaimNumber ^mapping[=].comment = "Observation"

* episodeInformation.healthInsurancePaymentSource 1..* string "Health Insurance Payment Source" "Indicate the patient's health insurance payment type.    Note(s):  If the patient has multiple insurance payors, select all payors.    If there is uncertainty regarding how to identify a specific health insurance plan, please discuss with your billing department to understand how it should be identified in the registry."
* episodeInformation.healthInsurancePaymentSource ^mapping[+].identity = "FHIR"
* episodeInformation.healthInsurancePaymentSource ^mapping[=].language = #application/fhir
* episodeInformation.healthInsurancePaymentSource ^mapping[=].map = "resolve(Claim.where(encounter=Encounter.id)).insurer.display.value"

* episodeInformation.healthInsurancePaymentSource ^mapping[+].identity = "Output"
* episodeInformation.healthInsurancePaymentSource ^mapping[=].language = #application/fhir
* episodeInformation.healthInsurancePaymentSource ^mapping[=].map = "Observation"
* episodeInformation.healthInsurancePaymentSource ^mapping[=].comment = "Observation"

* episodeInformation.medicareBeneficiaryIdentifier 1..1 string "Medicare Beneficiary Identifier"
* episodeInformation.medicareBeneficiaryIdentifier ^mapping[+].identity = "FHIR"
* episodeInformation.medicareBeneficiaryIdentifier ^mapping[=].language = #application/fhir
* episodeInformation.medicareBeneficiaryIdentifier ^mapping[=].map = "Patient.identifier.where(system='http://hl7.org/fhir/sid/us-mbi').value"

* episodeInformation.medicareBeneficiaryIdentifier ^mapping[+].identity = "Output"
* episodeInformation.medicareBeneficiaryIdentifier ^mapping[=].language = #application/fhir
* episodeInformation.medicareBeneficiaryIdentifier ^mapping[=].map = "Observation"
* episodeInformation.medicareBeneficiaryIdentifier ^mapping[=].comment = "Observation"

* episodeInformation.patientEnrolledInResearchStudy 1..1 string "Patient Enrolled in Research Study" "Indicate if the patient is enrolled in an ongoing ACC - NCDR research study related to this registry."
* episodeInformation.patientEnrolledInResearchStudy ^mapping[+].identity = "FHIR"
* episodeInformation.patientEnrolledInResearchStudy ^mapping[=].language = #application/fhir
* episodeInformation.patientEnrolledInResearchStudy ^mapping[=].map = "ResearchSubject.where(patient=Patient.id and period.overlaps(Encounter.period)).exists()"

* episodeInformation.patientEnrolledInResearchStudy ^mapping[+].identity = "Output"
* episodeInformation.patientEnrolledInResearchStudy ^mapping[=].language = #application/fhir
* episodeInformation.patientEnrolledInResearchStudy ^mapping[=].map = "Observation"
* episodeInformation.patientEnrolledInResearchStudy ^mapping[=].comment = "Observation"

* episodeInformation.patientRestriction 1..1 string "Patient Restriction" "Indicate if the patient requested for their information not to be used for any research or studies for the associated episode of care.    Note(s):  Documentation must be found in the patient record to support the request of removal of their information."
* episodeInformation.patientRestriction ^mapping[+].identity = "FHIR"
* episodeInformation.patientRestriction ^mapping[=].language = #application/fhir
* episodeInformation.patientRestriction ^mapping[=].map = "Patient.meta.securityLabel.memberOf(%Restricted)"

* episodeInformation.patientRestriction ^mapping[+].identity = "Output"
* episodeInformation.patientRestriction ^mapping[=].language = #application/fhir
* episodeInformation.patientRestriction ^mapping[=].map = "Observation"
* episodeInformation.patientRestriction ^mapping[=].comment = "Observation"

* historyAndRiskFactors  1..1 BackboneElement "Patient History and Risk Factors"

* historyAndRiskFactors.basicActivitiesOfDailyLiving 1..1 string "Basic Activities of Daily Living"
* historyAndRiskFactors.basicActivitiesOfDailyLiving ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.basicActivitiesOfDailyLiving ^mapping[=].language = #application/fhir
* historyAndRiskFactors.basicActivitiesOfDailyLiving ^mapping[=].map = "Observation.where(code='112000000180' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()"

* historyAndRiskFactors.basicActivitiesOfDailyLiving ^mapping[+].identity = "Output"
* historyAndRiskFactors.basicActivitiesOfDailyLiving ^mapping[=].language = #application/fhir
* historyAndRiskFactors.basicActivitiesOfDailyLiving ^mapping[=].map = "Observation"
* historyAndRiskFactors.basicActivitiesOfDailyLiving ^mapping[=].comment = "Observation"

* historyAndRiskFactors.basicActivitiesOfDailyLivingUnknown 1..1 string "Basic Activities of Daily Living Unknown"
* historyAndRiskFactors.basicActivitiesOfDailyLivingUnknown ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.basicActivitiesOfDailyLivingUnknown ^mapping[=].language = #application/fhir
* historyAndRiskFactors.basicActivitiesOfDailyLivingUnknown ^mapping[=].map = "Observation.where(code='112000000180' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()"

* historyAndRiskFactors.basicActivitiesOfDailyLivingUnknown ^mapping[+].identity = "Output"
* historyAndRiskFactors.basicActivitiesOfDailyLivingUnknown ^mapping[=].language = #application/fhir
* historyAndRiskFactors.basicActivitiesOfDailyLivingUnknown ^mapping[=].map = "Observation"
* historyAndRiskFactors.basicActivitiesOfDailyLivingUnknown ^mapping[=].comment = "Observation"

* historyAndRiskFactors.cognition 1..1 string "Cognition"
* historyAndRiskFactors.cognition ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.cognition ^mapping[=].language = #application/fhir
* historyAndRiskFactors.cognition ^mapping[=].map = "Observation.where(code='112000000140' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()"

* historyAndRiskFactors.cognition ^mapping[+].identity = "Output"
* historyAndRiskFactors.cognition ^mapping[=].language = #application/fhir
* historyAndRiskFactors.cognition ^mapping[=].map = "Observation"
* historyAndRiskFactors.cognition ^mapping[=].comment = "Observation"

* historyAndRiskFactors.cognitionUnknown 1..1 string "Cognition Unknown"
* historyAndRiskFactors.cognitionUnknown ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.cognitionUnknown ^mapping[=].language = #application/fhir
* historyAndRiskFactors.cognitionUnknown ^mapping[=].map = "Observation.where(code='112000000140' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()"

* historyAndRiskFactors.cognitionUnknown ^mapping[+].identity = "Output"
* historyAndRiskFactors.cognitionUnknown ^mapping[=].language = #application/fhir
* historyAndRiskFactors.cognitionUnknown ^mapping[=].map = "Observation"
* historyAndRiskFactors.cognitionUnknown ^mapping[=].comment = "Observation"

* historyAndRiskFactors.smokingAmount 1..1 string "Smoking Amount" "Indicate the amount of cigarette smoking reported by the patient."
* historyAndRiskFactors.smokingAmount ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.smokingAmount ^mapping[=].language = #application/fhir
* historyAndRiskFactors.smokingAmount ^mapping[=].map = "Observation.where(code='100001256' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()"

* historyAndRiskFactors.smokingAmount ^mapping[+].identity = "Output"
* historyAndRiskFactors.smokingAmount ^mapping[=].language = #application/fhir
* historyAndRiskFactors.smokingAmount ^mapping[=].map = "Observation"
* historyAndRiskFactors.smokingAmount ^mapping[=].comment = "Observation"

* historyAndRiskFactors.tobaccoType 1..1 string "Tobacco Type" "<<< CathPCI - Instruction >>> Indicate the type of tobacco product the patient uses. <<< CPMI - Instruction >>> Indicate the frequency that the patient uses tobacco.    Note(s): Consider use of any tobacco product as equivalent to a cigarette for referenced definitions.     "
* historyAndRiskFactors.tobaccoType ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.tobaccoType ^mapping[=].language = #application/fhir
* historyAndRiskFactors.tobaccoType ^mapping[=].map = "Observation.where(code='266918002' and system='http://snomed.info/sct' and effectiveDateTime > %Encounter.period.start).first()"

* historyAndRiskFactors.tobaccoType ^mapping[+].identity = "Output"
* historyAndRiskFactors.tobaccoType ^mapping[=].language = #application/fhir
* historyAndRiskFactors.tobaccoType ^mapping[=].map = "Observation"
* historyAndRiskFactors.tobaccoType ^mapping[=].comment = "Observation"

* historyAndRiskFactors.tobaccoUse 1..1 string "Tobacco Use" "Indicate the frequency that the patient uses tobacco. Note(s): Consider use of any tobacco product as equivalent to a cigarette for referenced definitions."
* historyAndRiskFactors.tobaccoUse ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.tobaccoUse ^mapping[=].language = #application/fhir
* historyAndRiskFactors.tobaccoUse ^mapping[=].map = "Observation.where(code='110483000' and system='http://snomed.info/sct' and effectiveDateTime > %Encounter.period.start).first()"

* historyAndRiskFactors.tobaccoUse ^mapping[+].identity = "Output"
* historyAndRiskFactors.tobaccoUse ^mapping[=].language = #application/fhir
* historyAndRiskFactors.tobaccoUse ^mapping[=].map = "Observation"
* historyAndRiskFactors.tobaccoUse ^mapping[=].comment = "Observation"

* historyAndRiskFactors.walking 1..1 string "Walking"
* historyAndRiskFactors.walking ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.walking ^mapping[=].language = #application/fhir
* historyAndRiskFactors.walking ^mapping[=].map = "Observation.where(code='116329008' and system='http://snomed.info/sct' and effectiveDateTime > %Encounter.period.start).first()"

* historyAndRiskFactors.walking ^mapping[+].identity = "Output"
* historyAndRiskFactors.walking ^mapping[=].language = #application/fhir
* historyAndRiskFactors.walking ^mapping[=].map = "Observation"
* historyAndRiskFactors.walking ^mapping[=].comment = "Observation"

* historyAndRiskFactors.walkingUnknown 1..1 string "Walking Unknown"
* historyAndRiskFactors.walkingUnknown ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.walkingUnknown ^mapping[=].language = #application/fhir
* historyAndRiskFactors.walkingUnknown ^mapping[=].map = "Observation.where(code='116329008' and system='http://snomed.info/sct' and effectiveDateTime > %Encounter.period.start).first()"

* historyAndRiskFactors.walkingUnknown ^mapping[+].identity = "Output"
* historyAndRiskFactors.walkingUnknown ^mapping[=].language = #application/fhir
* historyAndRiskFactors.walkingUnknown ^mapping[=].map = "Observation"
* historyAndRiskFactors.walkingUnknown ^mapping[=].comment = "Observation"

* researchStudy  0..1 BackboneElement "Research Study Information"

* researchStudy.researchStudyName 1..1 string "Research Study Name" "Indicate the research study name as provided by the research study protocol.    Note(s):  If the patient is in more than one research study, list each separately."
* researchStudy.researchStudyName ^mapping[+].identity = "FHIR"
* researchStudy.researchStudyName ^mapping[=].language = #application/fhir
* researchStudy.researchStudyName ^mapping[=].map = "resolve(ResearchSubject.where(patient=Patient.id and period.overlaps(Encounter.period)).researchStudy).title"

* researchStudy.researchStudyName ^mapping[+].identity = "Output"
* researchStudy.researchStudyName ^mapping[=].language = #application/fhir
* researchStudy.researchStudyName ^mapping[=].map = "Observation"
* researchStudy.researchStudyName ^mapping[=].comment = "Observation"

* researchStudy.researchStudyPatientId 1..1 string "Research Study Patient ID" "Indicate the research study patient identification number as assigned by the research protocol.    Note(s):  If the patient is in more than one research study, list each separately."
* researchStudy.researchStudyPatientId ^mapping[+].identity = "FHIR"
* researchStudy.researchStudyPatientId ^mapping[=].language = #application/fhir
* researchStudy.researchStudyPatientId ^mapping[=].map = "ResearchSubject.where( individual = Patient.id and ((( Encounter.period.start >= period.start ) and (Encounter.period.start <= period.end)) or ((Encounter.period.end >= period.start) and  (Encounter.period.end <= period.end )))).identifier"

* researchStudy.researchStudyPatientId ^mapping[+].identity = "Output"
* researchStudy.researchStudyPatientId ^mapping[=].language = #application/fhir
* researchStudy.researchStudyPatientId ^mapping[=].map = "Observation"
* researchStudy.researchStudyPatientId ^mapping[=].comment = "Observation"
