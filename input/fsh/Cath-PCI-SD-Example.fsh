Logical: CathPCI_Submission_Map
Id: cathPCISubmissionMap
//Parent: CathPCI 
Title: "Cath-PCI Submission Map"
Description: """This is an example of the data that would be used for a Cath-PCI Submission
The full map is a logical model as that allows conformance to the FHIR Standard the way a custom Resource would not.
Each element has the short name of the data, a full description and the paths to fetch and place the information, by data standard type, for each.
A section (such as Demographics) is a BackboneElement (holds no values).  All subordinate elements are CREDSElementDefinitions.
Each mapping includes the following:
    identity = standard used for the mapping (e.g., FHIR)
    language = mime type that matches identity
    map = FHIRPath expression of the path to the data
    comment = *Output mapping only* Resource/Profile for inclusion in the Submission Bundle
"""
* ^baseDefinition = "http://hl7.org/fhir/us/fhir-registry-protocols-ig/StructureDefinition/CREDSStructureDefinition"

* ^identifier.use = #official
* ^date = "2021-11-01"
* ^publisher = "American College of Cardiology"
* ^contact.name = "Jane Smith"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "mailto:noreply@acc.org"
//Mappings so that things show up in the mappings page on the IG
* ^mapping[0].identity = "FHIR"
* ^mapping[0].uri = "http://fhir.hl7.org"
* ^mapping[0].name = "Fast Health Interoperability Resources"
* ^mapping[0].comment = "Path to where in a FHIR Resource the data element is found"
* ^mapping[1].identity = "CDA"
* ^mapping[1].uri = "http://build.fhir.org/ig/HL7/cda-core-2.0/"
* ^mapping[1].name = "Clinical Document Architecture"
* ^mapping[1].comment = "Path to where in a CDA 2.0/CCDA 2.1 Document the data element is found"
* ^mapping[2].identity = "HL7V2"
* ^mapping[2].uri = "http://www.hl7.eu/refactored/index.html"
* ^mapping[2].name = "HL7 V2 Messages"
* ^mapping[2].comment = "Path to where in a HL7 V2 Message the data element is found"
* ^mapping[3].identity = "Output"
* ^mapping[3].uri = "http://hl7.org/fhir/us/core"
* ^mapping[3].name = "Submission Data Output location"
* ^mapping[3].comment = "Location within the requirements profile to place the data for submission in US Core or FHIR Core Resources"

* demographics 1..1 BackboneElement "Patient Demographics"

* demographics.lastName 1..1 CREDSElementDefinition "Last Name" "Indicate the patient's last name. Hyphenated names should be recorded with a hyphen."
* demographics.lastName ^mapping[0].identity = "FHIR" // Always "Source Standard"
* demographics.lastName ^mapping[0].language = #application/fhir // mimetype of standard 
* demographics.lastName ^mapping[0].map = "Patient.name.family" // actual Xpath to data 
* demographics.lastName ^mapping[1].identity = "CDA"
* demographics.lastName ^mapping[1].language = #application/hl7-sda+xml // actual registered mimetype
* demographics.lastName ^mapping[1].map = "ClinicalDocument.recordTarget.patient.name.family"
* demographics.lastName ^mapping[2].identity = "HL7V2"
* demographics.lastName ^mapping[2].language = #application/edi-hl7v2 // discussed in InM but I don't know if it was registered
* demographics.lastName ^mapping[2].map = "ADT_A01.PID.5.1" 
* demographics.lastName ^mapping[3].identity = "Output"
* demographics.lastName ^mapping[3].language = #application/fhir // output is always FHIR 
* demographics.lastName ^mapping[3].map = "Patient.name.family" // actual Xpath to data within profile in requirements
* demographics.lastName ^mapping[3].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient" // profile for Bundle inclusion

* demographics.firstName 1..1 CREDSElementDefinition "First Name" "Indicate the patient's first name."
* demographics.firstName ^mapping[0].identity = "FHIR"
* demographics.firstName ^mapping[0].language = #application/fhir
* demographics.firstName ^mapping[0].map = "Patient.name.given[0]"
* demographics.firstName ^mapping[1].identity = "CDA"
* demographics.firstName ^mapping[1].language = #application/hl7-sda+xml
* demographics.firstName ^mapping[1].map = "ClinicalDocument.recordTarget.patient.name.given[1]"
* demographics.firstName ^mapping[2].identity = "HL7V2"
* demographics.firstName ^mapping[2].language = #application/edi-hl7v2
* demographics.firstName ^mapping[2].map = "ADT_A01.PID.5.2"
* demographics.firstName ^mapping[3].identity = "Output"
* demographics.firstName ^mapping[3].language = #application/fhir 
* demographics.firstName ^mapping[3].map = "Patient.name.given" 
* demographics.firstName ^mapping[3].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"

* demographics.middleName 0..* CREDSElementDefinition "Middle Name" "Indicate the patient's middle names."
* demographics.middleName ^mapping[0].identity = "FHIR"
* demographics.middleName ^mapping[0].language = #application/fhir
* demographics.middleName ^mapping[0].map = "Patient.name.given[position()>0]"
* demographics.middleName ^mapping[1].identity = "CDA"
* demographics.middleName ^mapping[1].language = #application/hl7-sda+xml
* demographics.middleName ^mapping[1].map = "ClinicalDocument.recordTarget.patient.name.given[position()>1]"  
* demographics.middleName ^mapping[2].identity = "HL7V2"
* demographics.middleName ^mapping[2].language = #application/edi-hl7v2
* demographics.middleName ^mapping[2].map = "ADT_A01.PID.5.3"
* demographics.middleName ^mapping[3].identity = "Output"
* demographics.middleName ^mapping[3].language = #application/fhir // mimetype of standard 
* demographics.middleName ^mapping[3].map = "Patient.name.given" // actual Xpath to data within profile in requirements
* demographics.middleName ^mapping[3].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"

* episodeInformation 1..1 BackboneElement "CathPCI Episode Information"

* episodeInformation.episodeUniqueKey 1..1 CREDSElementDefinition "Episode Unique Key" "Indicate the unique key associated with each patient episode record as assigned by the EMR/EHR or your software application."
* episodeInformation.episodeUniqueKey ^mapping[0].identity = "FHIR"
* episodeInformation.episodeUniqueKey ^mapping[0].language = #application/fhir
* episodeInformation.episodeUniqueKey ^mapping[0].map = "iif(Encounter.identifier(type.code='VN').value, Encounter.identifier(type.code='VN').value, Encounter.identifier[0].value)"
* episodeInformation.episodeUniqueKey ^mapping[1].identity = "CDA"
* episodeInformation.episodeUniqueKey ^mapping[1].language = #application/hl7-sda+xml
* episodeInformation.episodeUniqueKey ^mapping[1].map = "ClinicalDocument.componentOf.encompassingEncounter.id"  
* episodeInformation.episodeUniqueKey ^mapping[2].identity = "HL7V2"
* episodeInformation.episodeUniqueKey ^mapping[2].language = #application/edi-hl7v2
* episodeInformation.episodeUniqueKey ^mapping[2].map = "ADT_A01.PV1.19.1"
* episodeInformation.episodeUniqueKey ^mapping[3].identity = "Output"
* episodeInformation.episodeUniqueKey ^mapping[3].language = #application/fhir
* episodeInformation.episodeUniqueKey ^mapping[3].map = "Encounter.identifier"
* episodeInformation.episodeUniqueKey ^mapping[3].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter"

/*
* arrivalInformation BackboneElement 1..1
* arrivalInformation.numberOfTransferringFacilityUnavailable 1..1 CREDSElementDefinition 'Number of Transferring Facility Unavailable' ''
* arrivalInformation.numberOfTransferringFacilityUnavailable ^mapping[0].identity ='FHIR'
* arrivalInformation.numberOfTransferringFacilityUnavailable ^mapping[0].language = #application/fhir
* arrivalInformation.numberOfTransferringFacilityUnavailable ^mapping[0].map ='resolve(Encounter.hospital.where(admitSource.coding.where(code = 'hosp-trans' and system-'http://terminology.hl7.org/CodeSystem/admit-source ')).origin).identifier.where(system='').exists().not()'

* arrivalInformation.numberOfTransferringFacilityUnavailable ^mapping[0].identity ='Output'
* arrivalInformation.numberOfTransferringFacilityUnavailable ^mapping[0].language = #application/fhir
* arrivalInformation.numberOfTransferringFacilityUnavailable ^mapping[0].map ='Observation'
* arrivalInformation.numberOfTransferringFacilityUnavailable ^mapping[0].comment ='Observation'

* arrivalInformation.transferringFacilityAmericanHospitalAssociationName 1..1 CREDSElementDefinition 'Transferring Facility American Hospital Association Name' ''
* arrivalInformation.transferringFacilityAmericanHospitalAssociationName ^mapping[0].identity ='FHIR'
* arrivalInformation.transferringFacilityAmericanHospitalAssociationName ^mapping[0].language = #application/fhir
* arrivalInformation.transferringFacilityAmericanHospitalAssociationName ^mapping[0].map ='resolve(Encounter.hospital.where(admitSource.coding.where(code = 'hosp-trans' and system-'http://terminology.hl7.org/CodeSystem/admit-source ')).origin).name'

* arrivalInformation.transferringFacilityAmericanHospitalAssociationName ^mapping[0].identity ='Output'
* arrivalInformation.transferringFacilityAmericanHospitalAssociationName ^mapping[0].language = #application/fhir
* arrivalInformation.transferringFacilityAmericanHospitalAssociationName ^mapping[0].map ='Observation'
* arrivalInformation.transferringFacilityAmericanHospitalAssociationName ^mapping[0].comment ='Observation'

* arrivalInformation.transferringFacilityAmericanHospitalAssociationNumber 1..1 CREDSElementDefinition 'Transferring Facility American Hospital Association Number' ''
* arrivalInformation.transferringFacilityAmericanHospitalAssociationNumber ^mapping[0].identity ='FHIR'
* arrivalInformation.transferringFacilityAmericanHospitalAssociationNumber ^mapping[0].language = #application/fhir
* arrivalInformation.transferringFacilityAmericanHospitalAssociationNumber ^mapping[0].map ='resolve(Encounter.hospital.where(admitSource.coding.where(code = 'hosp-trans' and system-'http://terminology.hl7.org/CodeSystem/admit-source ')).origin).identifier.where(system='').value'

* arrivalInformation.transferringFacilityAmericanHospitalAssociationNumber ^mapping[0].identity ='Output'
* arrivalInformation.transferringFacilityAmericanHospitalAssociationNumber ^mapping[0].language = #application/fhir
* arrivalInformation.transferringFacilityAmericanHospitalAssociationNumber ^mapping[0].map ='Observation'
* arrivalInformation.transferringFacilityAmericanHospitalAssociationNumber ^mapping[0].comment ='Observation'

* cardiacStatus BackboneElement 1..1
* cardiacStatus.bystanderCardiopulmonaryResuscitation 1..1 CREDSElementDefinition 'Bystander Cardiopulmonary Resuscitation' ''
* cardiacStatus.bystanderCardiopulmonaryResuscitation ^mapping[0].identity ='FHIR'
* cardiacStatus.bystanderCardiopulmonaryResuscitation ^mapping[0].language = #application/fhir
* cardiacStatus.bystanderCardiopulmonaryResuscitation ^mapping[0].map ='Observation.where(code='112000000186' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()'

* cardiacStatus.bystanderCardiopulmonaryResuscitation ^mapping[0].identity ='Output'
* cardiacStatus.bystanderCardiopulmonaryResuscitation ^mapping[0].language = #application/fhir
* cardiacStatus.bystanderCardiopulmonaryResuscitation ^mapping[0].map ='Observation'
* cardiacStatus.bystanderCardiopulmonaryResuscitation ^mapping[0].comment ='Observation'

* cardiacStatus.cardiacArrestAfterArrivalOfEmergencyMedicalServices 1..1 CREDSElementDefinition 'Cardiac Arrest After Arrival of Emergency Medical Services' 'Indicate if the out-of-hospital cardiac arrest occurred after arrival of Emergency Medical Services (EMS).'
* cardiacStatus.cardiacArrestAfterArrivalOfEmergencyMedicalServices ^mapping[0].identity ='FHIR'
* cardiacStatus.cardiacArrestAfterArrivalOfEmergencyMedicalServices ^mapping[0].language = #application/fhir
* cardiacStatus.cardiacArrestAfterArrivalOfEmergencyMedicalServices ^mapping[0].map ='Observation.where(code='100014081' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()'

* cardiacStatus.cardiacArrestAfterArrivalOfEmergencyMedicalServices ^mapping[0].identity ='Output'
* cardiacStatus.cardiacArrestAfterArrivalOfEmergencyMedicalServices ^mapping[0].language = #application/fhir
* cardiacStatus.cardiacArrestAfterArrivalOfEmergencyMedicalServices ^mapping[0].map ='Observation'
* cardiacStatus.cardiacArrestAfterArrivalOfEmergencyMedicalServices ^mapping[0].comment ='Observation'

* cardiacStatus.cardiacArrestAtTransferringHealthcareFacility 1..1 CREDSElementDefinition 'Cardiac Arrest at Transferring Healthcare Facility' 'Indicate if the patient had cardiac arrest at the transferring healthcare facility prior to arrival at the current facility.'
* cardiacStatus.cardiacArrestAtTransferringHealthcareFacility ^mapping[0].identity ='FHIR'
* cardiacStatus.cardiacArrestAtTransferringHealthcareFacility ^mapping[0].language = #application/fhir
* cardiacStatus.cardiacArrestAtTransferringHealthcareFacility ^mapping[0].map ='Observation.where(code='100014016' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()'

* cardiacStatus.cardiacArrestAtTransferringHealthcareFacility ^mapping[0].identity ='Output'
* cardiacStatus.cardiacArrestAtTransferringHealthcareFacility ^mapping[0].language = #application/fhir
* cardiacStatus.cardiacArrestAtTransferringHealthcareFacility ^mapping[0].map ='Observation'
* cardiacStatus.cardiacArrestAtTransferringHealthcareFacility ^mapping[0].comment ='Observation'

* cardiacStatus.cardiacArrestOutOfHealthcareFacility 1..1 CREDSElementDefinition 'Cardiac Arrest Out of Healthcare Facility' 'Indicate if a cardiac arrest event occurred outside of any healthcare facility.'
* cardiacStatus.cardiacArrestOutOfHealthcareFacility ^mapping[0].identity ='FHIR'
* cardiacStatus.cardiacArrestOutOfHealthcareFacility ^mapping[0].language = #application/fhir
* cardiacStatus.cardiacArrestOutOfHealthcareFacility ^mapping[0].map ='Observation.where(code='10001424808' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()'

* cardiacStatus.cardiacArrestOutOfHealthcareFacility ^mapping[0].identity ='Output'
* cardiacStatus.cardiacArrestOutOfHealthcareFacility ^mapping[0].language = #application/fhir
* cardiacStatus.cardiacArrestOutOfHealthcareFacility ^mapping[0].map ='Observation'
* cardiacStatus.cardiacArrestOutOfHealthcareFacility ^mapping[0].comment ='Observation'

* cardiacStatus.cardiacArrestWitnessed 1..1 CREDSElementDefinition 'Cardiac Arrest Witnessed' 'Indicate if the out-of-hospital cardiac arrest was witnessed by another person.'
* cardiacStatus.cardiacArrestWitnessed ^mapping[0].identity ='FHIR'
* cardiacStatus.cardiacArrestWitnessed ^mapping[0].language = #application/fhir
* cardiacStatus.cardiacArrestWitnessed ^mapping[0].map ='Observation.where(code='100014082' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()'

* cardiacStatus.cardiacArrestWitnessed ^mapping[0].identity ='Output'
* cardiacStatus.cardiacArrestWitnessed ^mapping[0].language = #application/fhir
* cardiacStatus.cardiacArrestWitnessed ^mapping[0].map ='Observation'
* cardiacStatus.cardiacArrestWitnessed ^mapping[0].comment ='Observation'

* cardiacStatus.firstCardiacArrestRhythm 1..1 CREDSElementDefinition 'First Cardiac Arrest Rhythm' 'Indicate if the initial out-of-hospital cardiac arrest rhythm was a shockable rhythm.'
* cardiacStatus.firstCardiacArrestRhythm ^mapping[0].identity ='FHIR'
* cardiacStatus.firstCardiacArrestRhythm ^mapping[0].language = #application/fhir
* cardiacStatus.firstCardiacArrestRhythm ^mapping[0].map ='Observation.where(code='100014013' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()'

* cardiacStatus.firstCardiacArrestRhythm ^mapping[0].identity ='Output'
* cardiacStatus.firstCardiacArrestRhythm ^mapping[0].language = #application/fhir
* cardiacStatus.firstCardiacArrestRhythm ^mapping[0].map ='Observation'
* cardiacStatus.firstCardiacArrestRhythm ^mapping[0].comment ='Observation'

* cardiacStatus.firstCardiacArrestRhythmUnknown 1..1 CREDSElementDefinition 'First Cardiac Arrest Rhythm Unknown' 'Indicate if the initial out-of-hospital cardiac arrest rhythm was unknown.'
* cardiacStatus.firstCardiacArrestRhythmUnknown ^mapping[0].identity ='FHIR'
* cardiacStatus.firstCardiacArrestRhythmUnknown ^mapping[0].language = #application/fhir
* cardiacStatus.firstCardiacArrestRhythmUnknown ^mapping[0].map ='Observation.where(code='100014013' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()'

* cardiacStatus.firstCardiacArrestRhythmUnknown ^mapping[0].identity ='Output'
* cardiacStatus.firstCardiacArrestRhythmUnknown ^mapping[0].language = #application/fhir
* cardiacStatus.firstCardiacArrestRhythmUnknown ^mapping[0].map ='Observation'
* cardiacStatus.firstCardiacArrestRhythmUnknown ^mapping[0].comment ='Observation'

* episodeInformation.admissionDateAndTime 1..1 CREDSElementDefinition 'Admission Date and Time' ''
* episodeInformation.admissionDateAndTime ^mapping[0].identity ='FHIR'
* episodeInformation.admissionDateAndTime ^mapping[0].language = #application/fhir
* episodeInformation.admissionDateAndTime ^mapping[0].map ='Encounter.period.start'

* episodeInformation.admissionDateAndTime ^mapping[0].identity ='Output'
* episodeInformation.admissionDateAndTime ^mapping[0].language = #application/fhir
* episodeInformation.admissionDateAndTime ^mapping[0].map ='Observation'
* episodeInformation.admissionDateAndTime ^mapping[0].comment ='Observation'

* episodeInformation.healthInsurance 1..1 CREDSElementDefinition 'Health Insurance' 'Indicate if the patient has health insurance.'
* episodeInformation.healthInsurance ^mapping[0].identity ='FHIR'
* episodeInformation.healthInsurance ^mapping[0].language = #application/fhir
* episodeInformation.healthInsurance ^mapping[0].map ='Claim.where(encounter=Encounter.id).insurance.coverage.exists()'

* episodeInformation.healthInsurance ^mapping[0].identity ='Output'
* episodeInformation.healthInsurance ^mapping[0].language = #application/fhir
* episodeInformation.healthInsurance ^mapping[0].map ='Observation'
* episodeInformation.healthInsurance ^mapping[0].comment ='Observation'

* episodeInformation.healthInsuranceClaimNumber(Hic) 1..1 CREDSElementDefinition 'Health Insurance Claim Number (HIC)' 'Indicate the patient's Health Insurance Claim (HIC) number.    Note(s):  Enter the Health Insurance Claim (HIC) number for those patients covered by Medicare. Patients with other insurances will not have a HIC number.'
* episodeInformation.healthInsuranceClaimNumber(Hic) ^mapping[0].identity ='FHIR'
* episodeInformation.healthInsuranceClaimNumber(Hic) ^mapping[0].language = #application/fhir
* episodeInformation.healthInsuranceClaimNumber(Hic) ^mapping[0].map ='resolve(Claim.where(encounter=Encounter.id).insurance.coverage).identifier.value'

* episodeInformation.healthInsuranceClaimNumber(Hic) ^mapping[0].identity ='Output'
* episodeInformation.healthInsuranceClaimNumber(Hic) ^mapping[0].language = #application/fhir
* episodeInformation.healthInsuranceClaimNumber(Hic) ^mapping[0].map ='Observation'
* episodeInformation.healthInsuranceClaimNumber(Hic) ^mapping[0].comment ='Observation'

* episodeInformation.healthInsurancePaymentSource 1..1 CREDSElementDefinition 'Health Insurance Payment Source' 'Indicate the patient's health insurance payment type.    Note(s):  If the patient has multiple insurance payors, select all payors.    If there is uncertainty regarding how to identify a specific health insurance plan, please discuss with your billing department to understand how it should be identified in the registry.'
* episodeInformation.healthInsurancePaymentSource ^mapping[0].identity ='FHIR'
* episodeInformation.healthInsurancePaymentSource ^mapping[0].language = #application/fhir
* episodeInformation.healthInsurancePaymentSource ^mapping[0].map ='resolve(Claim.where(encounter=Encounter.id).insurance.coverage).something'

* episodeInformation.healthInsurancePaymentSource ^mapping[0].identity ='Output'
* episodeInformation.healthInsurancePaymentSource ^mapping[0].language = #application/fhir
* episodeInformation.healthInsurancePaymentSource ^mapping[0].map ='Observation'
* episodeInformation.healthInsurancePaymentSource ^mapping[0].comment ='Observation'

* episodeInformation.medicareBeneficiaryIdentifier 1..1 CREDSElementDefinition 'Medicare Beneficiary Identifier' ''
* episodeInformation.medicareBeneficiaryIdentifier ^mapping[0].identity ='FHIR'
* episodeInformation.medicareBeneficiaryIdentifier ^mapping[0].language = #application/fhir
* episodeInformation.medicareBeneficiaryIdentifier ^mapping[0].map ='Patient.identifier.where(system='http://hl7.org/fhir/sid/us-mbi').value'

* episodeInformation.medicareBeneficiaryIdentifier ^mapping[0].identity ='Output'
* episodeInformation.medicareBeneficiaryIdentifier ^mapping[0].language = #application/fhir
* episodeInformation.medicareBeneficiaryIdentifier ^mapping[0].map ='Observation'
* episodeInformation.medicareBeneficiaryIdentifier ^mapping[0].comment ='Observation'

* episodeInformation.patientEnrolledInResearchStudy 1..1 CREDSElementDefinition 'Patient Enrolled in Research Study' 'Indicate if the patient is enrolled in an ongoing ACC - NCDR research study related to this registry.'
* episodeInformation.patientEnrolledInResearchStudy ^mapping[0].identity ='FHIR'
* episodeInformation.patientEnrolledInResearchStudy ^mapping[0].language = #application/fhir
* episodeInformation.patientEnrolledInResearchStudy ^mapping[0].map ='ResearchSubject.where(patient=Patient.id and period.overlaps(Encounter.period)).exists()'

* episodeInformation.patientEnrolledInResearchStudy ^mapping[0].identity ='Output'
* episodeInformation.patientEnrolledInResearchStudy ^mapping[0].language = #application/fhir
* episodeInformation.patientEnrolledInResearchStudy ^mapping[0].map ='Observation'
* episodeInformation.patientEnrolledInResearchStudy ^mapping[0].comment ='Observation'

* episodeInformation.patientRestriction 1..1 CREDSElementDefinition 'Patient Restriction' 'Indicate if the patient requested for their information not to be used for any research or studies for the associated episode of care.    Note(s):  Documentation must be found in the patient record to support the request of removal of their information.'
* episodeInformation.patientRestriction ^mapping[0].identity ='FHIR'
* episodeInformation.patientRestriction ^mapping[0].language = #application/fhir
* episodeInformation.patientRestriction ^mapping[0].map ='Patient.meta.securityLabel.memberOf(%Restricted)'

* episodeInformation.patientRestriction ^mapping[0].identity ='Output'
* episodeInformation.patientRestriction ^mapping[0].language = #application/fhir
* episodeInformation.patientRestriction ^mapping[0].map ='Observation'
* episodeInformation.patientRestriction ^mapping[0].comment ='Observation'

* historyAndRiskFactors BackboneElement 1..1

* historyAndRiskFactors.basicActivitiesOfDailyLiving 1..1 CREDSElementDefinition 'Basic Activities of Daily Living ' ''
* historyAndRiskFactors.basicActivitiesOfDailyLiving ^mapping[0].identity ='FHIR'
* historyAndRiskFactors.basicActivitiesOfDailyLiving ^mapping[0].language = #application/fhir
* historyAndRiskFactors.basicActivitiesOfDailyLiving ^mapping[0].map ='Observation.where(code='112000000180' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()'

* historyAndRiskFactors.basicActivitiesOfDailyLiving ^mapping[0].identity ='Output'
* historyAndRiskFactors.basicActivitiesOfDailyLiving ^mapping[0].language = #application/fhir
* historyAndRiskFactors.basicActivitiesOfDailyLiving ^mapping[0].map ='Observation'
* historyAndRiskFactors.basicActivitiesOfDailyLiving ^mapping[0].comment ='Observation'

* historyAndRiskFactors.basicActivitiesOfDailyLivingUnknown 1..1 CREDSElementDefinition 'Basic Activities of Daily Living Unknown' ''
* historyAndRiskFactors.basicActivitiesOfDailyLivingUnknown ^mapping[0].identity ='FHIR'
* historyAndRiskFactors.basicActivitiesOfDailyLivingUnknown ^mapping[0].language = #application/fhir
* historyAndRiskFactors.basicActivitiesOfDailyLivingUnknown ^mapping[0].map ='Observation.where(code='112000000180' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()'

* historyAndRiskFactors.basicActivitiesOfDailyLivingUnknown ^mapping[0].identity ='Output'
* historyAndRiskFactors.basicActivitiesOfDailyLivingUnknown ^mapping[0].language = #application/fhir
* historyAndRiskFactors.basicActivitiesOfDailyLivingUnknown ^mapping[0].map ='Observation'
* historyAndRiskFactors.basicActivitiesOfDailyLivingUnknown ^mapping[0].comment ='Observation'

* historyAndRiskFactors.cognition 1..1 CREDSElementDefinition 'Cognition' ''
* historyAndRiskFactors.cognition ^mapping[0].identity ='FHIR'
* historyAndRiskFactors.cognition ^mapping[0].language = #application/fhir
* historyAndRiskFactors.cognition ^mapping[0].map ='Observation.where(code='112000000140' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()'

* historyAndRiskFactors.cognition ^mapping[0].identity ='Output'
* historyAndRiskFactors.cognition ^mapping[0].language = #application/fhir
* historyAndRiskFactors.cognition ^mapping[0].map ='Observation'
* historyAndRiskFactors.cognition ^mapping[0].comment ='Observation'

* historyAndRiskFactors.cognitionUnknown 1..1 CREDSElementDefinition 'Cognition Unknown' ''
* historyAndRiskFactors.cognitionUnknown ^mapping[0].identity ='FHIR'
* historyAndRiskFactors.cognitionUnknown ^mapping[0].language = #application/fhir
* historyAndRiskFactors.cognitionUnknown ^mapping[0].map ='Observation.where(code='112000000140' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()'

* historyAndRiskFactors.cognitionUnknown ^mapping[0].identity ='Output'
* historyAndRiskFactors.cognitionUnknown ^mapping[0].language = #application/fhir
* historyAndRiskFactors.cognitionUnknown ^mapping[0].map ='Observation'
* historyAndRiskFactors.cognitionUnknown ^mapping[0].comment ='Observation'

* historyAndRiskFactors.smokingAmount 1..1 CREDSElementDefinition 'Smoking Amount' 'Indicate the amount of cigarette smoking reported by the patient.'
* historyAndRiskFactors.smokingAmount ^mapping[0].identity ='FHIR'
* historyAndRiskFactors.smokingAmount ^mapping[0].language = #application/fhir
* historyAndRiskFactors.smokingAmount ^mapping[0].map ='Observation.where(code='100001256' and system='https://cvquality.acc.org/NCDR' and effectiveDateTime > %Encounter.period.start).first()'

* historyAndRiskFactors.smokingAmount ^mapping[0].identity ='Output'
* historyAndRiskFactors.smokingAmount ^mapping[0].language = #application/fhir
* historyAndRiskFactors.smokingAmount ^mapping[0].map ='Observation'
* historyAndRiskFactors.smokingAmount ^mapping[0].comment ='Observation'

* historyAndRiskFactors.tobaccoType 1..1 CREDSElementDefinition 'Tobacco Type' '<<< CathPCI - Instruction >>> Indicate the type of tobacco product the patient uses. <<< CPMI - Instruction >>> Indicate the frequency that the patient uses tobacco.    Note(s): Consider use of any tobacco product as equivalent to a cigarette for referenced definitions.      '
* historyAndRiskFactors.tobaccoType ^mapping[0].identity ='FHIR'
* historyAndRiskFactors.tobaccoType ^mapping[0].language = #application/fhir
* historyAndRiskFactors.tobaccoType ^mapping[0].map ='Observation.where(code='266918002' and system='http://snomed.info/sct' and effectiveDateTime > %Encounter.period.start).first()'

* historyAndRiskFactors.tobaccoType ^mapping[0].identity ='Output'
* historyAndRiskFactors.tobaccoType ^mapping[0].language = #application/fhir
* historyAndRiskFactors.tobaccoType ^mapping[0].map ='Observation'
* historyAndRiskFactors.tobaccoType ^mapping[0].comment ='Observation'

* historyAndRiskFactors.tobaccoUse 1..1 CREDSElementDefinition 'Tobacco Use' 'Indicate the frequency that the patient uses tobacco.    Note(s): Consider use of any tobacco product as equivalent to a cigarette for referenced definitions.      '
* historyAndRiskFactors.tobaccoUse ^mapping[0].identity ='FHIR'
* historyAndRiskFactors.tobaccoUse ^mapping[0].language = #application/fhir
* historyAndRiskFactors.tobaccoUse ^mapping[0].map ='Observation.where(code='110483000' and system='http://snomed.info/sct' and effectiveDateTime > %Encounter.period.start).first()'

* historyAndRiskFactors.tobaccoUse ^mapping[0].identity ='Output'
* historyAndRiskFactors.tobaccoUse ^mapping[0].language = #application/fhir
* historyAndRiskFactors.tobaccoUse ^mapping[0].map ='Observation'
* historyAndRiskFactors.tobaccoUse ^mapping[0].comment ='Observation'

* historyAndRiskFactors.walking 1..1 CREDSElementDefinition 'Walking' ''
* historyAndRiskFactors.walking ^mapping[0].identity ='FHIR'
* historyAndRiskFactors.walking ^mapping[0].language = #application/fhir
* historyAndRiskFactors.walking ^mapping[0].map ='Observation.where(code='116329008' and system='http://snomed.info/sct' and effectiveDateTime > %Encounter.period.start).first()'

* historyAndRiskFactors.walking ^mapping[0].identity ='Output'
* historyAndRiskFactors.walking ^mapping[0].language = #application/fhir
* historyAndRiskFactors.walking ^mapping[0].map ='Observation'
* historyAndRiskFactors.walking ^mapping[0].comment ='Observation'

* historyAndRiskFactors.walkingUnknown 1..1 CREDSElementDefinition 'Walking Unknown' ''
* historyAndRiskFactors.walkingUnknown ^mapping[0].identity ='FHIR'
* historyAndRiskFactors.walkingUnknown ^mapping[0].language = #application/fhir
* historyAndRiskFactors.walkingUnknown ^mapping[0].map ='Observation.where(code='116329008' and system='http://snomed.info/sct' and effectiveDateTime > %Encounter.period.start).first()'

* historyAndRiskFactors.walkingUnknown ^mapping[0].identity ='Output'
* historyAndRiskFactors.walkingUnknown ^mapping[0].language = #application/fhir
* historyAndRiskFactors.walkingUnknown ^mapping[0].map ='Observation'
* historyAndRiskFactors.walkingUnknown ^mapping[0].comment ='Observation'

* researchStudy BackboneElement 1..1

* researchStudy.researchStudyName 1..1 CREDSElementDefinition 'Research Study Name' 'Indicate the research study name as provided by the research study protocol.    Note(s):  If the patient is in more than one research study, list each separately.'
* researchStudy.researchStudyName ^mapping[0].identity ='FHIR'
* researchStudy.researchStudyName ^mapping[0].language = #application/fhir
* researchStudy.researchStudyName ^mapping[0].map ='resolve(ResearchSubject.where(patient=Patient.id and period.overlaps(Encounter.period)).researchStudy).title'

* researchStudy.researchStudyName ^mapping[0].identity ='Output'
* researchStudy.researchStudyName ^mapping[0].language = #application/fhir
* researchStudy.researchStudyName ^mapping[0].map ='Observation'
* researchStudy.researchStudyName ^mapping[0].comment ='Observation'

* researchStudy.researchStudyPatientId 1..1 CREDSElementDefinition 'Research Study Patient ID' 'Indicate the research study patient identification number as assigned by the research protocol.    Note(s):  If the patient is in more than one research study, list each separately.'
* researchStudy.researchStudyPatientId ^mapping[0].identity ='FHIR'
* researchStudy.researchStudyPatientId ^mapping[0].language = #application/fhir
* researchStudy.researchStudyPatientId ^mapping[0].map ='ResearchSubject.where(patient=Patient.id and period.overlaps(Encounter.period)).identifier'

* researchStudy.researchStudyPatientId ^mapping[0].identity ='Output'
* researchStudy.researchStudyPatientId ^mapping[0].language = #application/fhir
* researchStudy.researchStudyPatientId ^mapping[0].map ='Observation'
* researchStudy.researchStudyPatientId ^mapping[0].comment ='Observation'

*/