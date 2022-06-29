Logical: CathPCI_Submission_Map_detailed
Id: ACCNCDRCathPCI-Detailed
Title: "Cath-PCI Submission Map"
Description: """This is an example of the data that would be used for a Cath-PCI Submission.
The full map is a logical model as that allows conformance to the FHIR Standard the way a custom Resource would not.
Each element has the short name of the data, a full description and the paths to fetch and place the information, by data standard type, for each.
A section (such as Demographics) is a BackboneElement (holds no values).  All subordinate elements are CREDSElementDefinitions.
Each mapping includes the following:
* identity = standard used for the mapping (e.g., FHIR)
* language = mime type that matches identity
* map = FHIRPath expression of the path to the data
* comment = *Output mapping only* Profile for inclusion in the Submission Bundle if not the Core resource

Environment Variables used:
%patient (Patient resource for the subject of the procedure)
%period (Encounter period i.e. Encounter.period)
%procedure (Cath PCI Procedure resource)
%procperiod (CathPCI Procedure period i.e., Procedure.performedPeriod)

"""
* ^baseDefinition = "http://hl7.org/fhir/us/fhir-registry-protocols-ig/StructureDefinition/CREDSStructureDefinition"
* ^version = "5.0"
* ^identifier.use = #official
* ^date = "2021-11-01"
* ^publisher = "American College of Cardiology"
* ^contact.name = "Jane Smith"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "mailto:noreply@acc.org"
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

* administration 1..1 BackboneElement "Adminstrative Data"

* administration.event 1..1 CREDSElementDefinition "EventCode" "Code used for reason of submission"
* administration.event ^fixedCode = $message-events#CathPCI-Discharge
* administration.event ^mapping[+].identity = "Output"
* administration.event ^mapping[=].language = #application/fhir
* administration.event ^mapping[=].map = "MessageHeader.eventCoding"

* administration.participantId 1..1 CREDSElementDefinition "Facility ID" "ACC Assigned Facilty ID"
* administration.participantId ^mapping[+].identity = "Output"
* administration.participantId ^mapping[=].language = #application/fhir
* administration.participantId ^mapping[=].map = "MessageHeader.source.name"

* administration.vendorSoftwareVersion 1..1 CREDSElementDefinition "Vendor Identifier" "Software Vendor ID"
* administration.vendorSoftwareVersion ^mapping[+].identity = "Output"
* administration.vendorSoftwareVersion ^mapping[=].language = #application/fhir
* administration.vendorSoftwareVersion ^mapping[=].map = "MessageHeader.source.software"

* administration.vendorSoftwareVersion 1..1 CREDSElementDefinition "Software Version" "Vendor Software Version"
* administration.vendorSoftwareVersion ^mapping[+].identity = "Output"
* administration.vendorSoftwareVersion ^mapping[=].language = #application/fhir
* administration.vendorSoftwareVersion ^mapping[=].map = "MessageHeader.source.version"

* administration.status  1..1 CREDSElementDefinition "Submission Status" "Status of the Submission, always final"
* administration.status ^fixedCode = $loinc#11516-2 "Physician Episode of care medical records"
* administration.status ^mapping[+].identity = "Output"
* administration.status ^mapping[=].language = #application/fhir
* administration.status ^mapping[=].map = "Composition.type"
 
* administration.type  1..1 CREDSElementDefinition "Submission Status" "Status of the Submission, always final"
* administration.type ^fixedCode = #final
* administration.type ^mapping[+].identity = "Output"
* administration.type ^mapping[=].language = #application/fhir
* administration.type ^mapping[=].map = "Composition.status"

* administration.timeFrameOfDataSubmission 1..1 CREDSElementDefinition "Submission Period" "Time Frame of Data Submission quarter start (e.g., Q2 start date Apr 1)"
* administration.timeFrameOfDataSubmission ^mapping[+].identity = "Output"
* administration.timeFrameOfDataSubmission ^mapping[=].language = #application/fhir
* administration.timeFrameOfDataSubmission ^mapping[=].map = "Composition.event.period.start"

* administration.registryIdentifier 1..1 CREDSElementDefinition "Registry Identifier"
* administration.registryIdentifier ^fixedString = "ACC-NCDR-CathPCI-5.0"
* administration.registryIdentifier ^mapping[+].identity = "Output"
* administration.registryIdentifier ^mapping[=].language = #application/fhir
* administration.registryIdentifier ^mapping[=].map = "Composition.title"

* administration.date 1..1 CREDSElementDefinition "Submission DateTime " "Date and Time of the Submission"
* administration.date ^mapping[+].identity = "FHIR"
* administration.date ^mapping[=].language = #application/fhir
* administration.date ^mapping[=].map = "now()"
* administration.date ^mapping[+].identity = "Output"
* administration.date ^mapping[=].language = #application/fhir
* administration.date ^mapping[=].map = "Composition.date"

* administration.author 1..1 CREDSElementDefinition "Submission Organization " "Organization Submitting the Record"
* administration.author ^mapping[+].identity = "FHIR"
* administration.author ^mapping[=].language = #application/fhir
* administration.author ^mapping[=].map = "Organization"
* administration.author ^mapping[+].identity = "Output"
* administration.author ^mapping[=].language = #application/fhir
* administration.author ^mapping[=].map = "Composition.author"

* demographics 1..1 BackboneElement "Patient Demographics"

* demographics.lastName 1..1 CREDSElementDefinition "Last Name" "Indicate the patient's last name. Hyphenated names should be recorded with a hyphen."
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
* demographics.lastName ^mapping[=].map = "Patient.name.family" 
* demographics.lastName ^mapping[=].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient" // profile for Bundle inclusion

* demographics.firstName 1..1 CREDSElementDefinition "First Name" "Indicate the patient's first name."
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
* demographics.firstName ^mapping[=].map = "Patient.name.given[0]" 
* demographics.firstName ^mapping[=].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"

* demographics.middleName 0..* CREDSElementDefinition "Middle Name" "Indicate the patient's middle names."
* demographics.middleName ^mapping[+].identity = "FHIR"
* demographics.middleName ^mapping[=].language = #application/fhir
* demographics.middleName ^mapping[=].map = "Patient.name.given.skip(1)"
* demographics.middleName ^mapping[+].identity = "CDA"
* demographics.middleName ^mapping[=].language = #application/hl7-sda+xml
* demographics.middleName ^mapping[=].map = "ClinicalDocument.recordTarget.patient.name.given.skip(1)"  
* demographics.middleName ^mapping[+].identity = "HL7V2"
* demographics.middleName ^mapping[=].language = #application/edi-hl7v2
* demographics.middleName ^mapping[=].map = "ADT_A01.PID.5.3"
* demographics.middleName ^mapping[+].identity = "Output"
* demographics.middleName ^mapping[=].language = #application/fhir 
* demographics.middleName ^mapping[=].map = "Patient.name.given.skip(1)" 
* demographics.middleName ^mapping[=].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"

* demographics.ssn 0..1 CREDSElementDefinition "Social Security Number" "Indicate the patient's SSN"
* demographics.ssn ^mapping[+].identity = "FHIR"
* demographics.ssn ^mapping[=].language = #application/fhir
* demographics.ssn ^mapping[=].map = "Patient.identifier.where( system = 'http://hl7.org/fhir/sid/us-ssn' )"
* demographics.ssn ^mapping[+].identity = "Output"
* demographics.ssn ^mapping[=].language = #application/fhir 
* demographics.ssn ^mapping[=].map = "Patient.identifier" 
* demographics.ssn ^mapping[=].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"

* demographics.patientId  0..1 CREDSElementDefinition "CATHPci ID" "Unique ID for ACC reference"
* demographics.patientId ^type.code = #Identifier
* demographics.patientId ^patternIdentifier.system  = "http://cathpci.acc.org"
* demographics.patientId ^mapping[+].identity = "Output"
* demographics.patientId ^mapping[=].language = #application/fhir
* demographics.patientId ^mapping[=].map = "Patient.identifier.value"

* demographics.otherId 0..1 CREDSElementDefinition "Other Identifier" "Patient MRN"
* demographics.otherId ^mapping[+].identity = "FHIR"
* demographics.otherId ^mapping[=].language = #application/fhir
* demographics.otherId ^mapping[=].map = "Patient.identifier.where(type.coding.code= 'MR' )"
* demographics.otherId ^mapping[+].identity = "Output"
* demographics.otherId ^mapping[=].language = #application/fhir 
* demographics.otherId ^mapping[=].map = "Patient.identifier" 
* demographics.otherId ^mapping[=].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"

* demographics.birthDate 1..1 CREDSElementDefinition "Patient DOB" "Indicate the patient's date of birth."
* demographics.birthDate ^mapping[+].identity = "FHIR"
* demographics.birthDate ^mapping[=].language = #application/fhir
* demographics.birthDate ^mapping[=].map = "Patient.birthDate"
* demographics.birthDate ^mapping[+].identity = "Output"
* demographics.birthDate ^mapping[=].language = #application/fhir 
* demographics.birthDate ^mapping[=].map = "Patient.birthDate" 
* demographics.birthDate ^mapping[=].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"

* demographics.sex 1..1 CREDSElementDefinition "Birth Sex"
* demographics.sex ^mapping[+].identity = "FHIR"
* demographics.sex ^mapping[=].language = #application/fhir
* demographics.sex ^mapping[=].map = "Patient.extension.us-core-birthsex"
* demographics.sex ^mapping[+].identity = "Output"
* demographics.sex ^mapping[=].language = #application/fhir 
* demographics.sex ^mapping[=].map = "Patient.extension.us-core-birthsex" 
* demographics.sex ^mapping[=].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"

* demographics.patientZipCode 1..1 CREDSElementDefinition "Patient's Zip Code"
* demographics.patientZipCode ^mapping[+].identity = "FHIR"
* demographics.patientZipCode ^mapping[=].language = #application/fhir
* demographics.patientZipCode ^mapping[=].map = "Patient.address.postalCode"
* demographics.patientZipCode ^mapping[+].identity = "Output"
* demographics.patientZipCode ^mapping[=].language = #application/fhir 
* demographics.patientZipCode ^mapping[=].map = "Patient.address.postalCode" 
* demographics.patientZipCode ^mapping[=].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"

* demographics.race 0..* CREDSElementDefinition "Patient Race"
* demographics.race ^mapping[+].identity = "FHIR"
* demographics.race ^mapping[=].language = #application/fhir
* demographics.race ^mapping[=].map = "Patient.extension.us-core-race"
* demographics.race ^mapping[+].identity = "Output"
* demographics.race ^mapping[=].language = #application/fhir 
* demographics.race ^mapping[=].map = "Patient.extension.us-core-race" 
* demographics.race ^mapping[=].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"

* demographics.enthnicity 0..1 CREDSElementDefinition "Patient Ethnicity"
* demographics.enthnicity ^mapping[+].identity = "FHIR"
* demographics.enthnicity ^mapping[=].language = #application/fhir
* demographics.enthnicity ^mapping[=].map = "Patient.extension.us-core-enthnicity"
* demographics.enthnicity ^mapping[+].identity = "Output"
* demographics.enthnicity ^mapping[=].language = #application/fhir 
* demographics.enthnicity ^mapping[=].map = "Patient.extension.us-core-enthnicity" 
* demographics.enthnicity ^mapping[=].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"

* episodeInformation 1..1 BackboneElement "Episode information"

* episodeInformation.episodeUniqueKey 1..1 CREDSElementDefinition "Episode Unique Key" "Indicate the unique key associated with each patient episode record as assigned by the EMR/EHR or your software application."
* episodeInformation.episodeUniqueKey ^type.code = Identifier 
* episodeInformation.episodeUniqueKey ^patternIdentifier.system  = "http://cathpci.acc.org/episodeUniqueKey"
* episodeInformation.episodeUniqueKey ^mapping[+].identity = "FHIR"
* episodeInformation.episodeUniqueKey ^mapping[=].language = #application/fhir
* episodeInformation.episodeUniqueKey ^mapping[=].map = "Encounter.id"
* episodeInformation.episodeUniqueKey ^mapping[+].identity = "CDA"
* episodeInformation.episodeUniqueKey ^mapping[=].language = #application/hl7-sda+xml
* episodeInformation.episodeUniqueKey ^mapping[=].map = "ClinicalDocument.componentOf.encompassingEncounter.id"  
* episodeInformation.episodeUniqueKey ^mapping[+].identity = "HL7V2"
* episodeInformation.episodeUniqueKey ^mapping[=].language = #application/edi-hl7v2
* episodeInformation.episodeUniqueKey ^mapping[=].map = "ADT_A01.PV1.19.1"
* episodeInformation.episodeUniqueKey ^mapping[+].identity = "Output"
* episodeInformation.episodeUniqueKey ^mapping[=].language = #application/fhir
* episodeInformation.episodeUniqueKey ^mapping[=].map = "Encounter.identifier"
* episodeInformation.episodeUniqueKey ^mapping[=].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter"

* episodeInformation.arrivalDateAndTime  1..1 CREDSElementDefinition "Patient Arrival" "Date and Time of Patient Arrival"
* episodeInformation.episodeUniqueKey ^mapping[+].identity = "FHIR"
* episodeInformation.episodeUniqueKey ^mapping[=].language = #application/fhir
* episodeInformation.episodeUniqueKey ^mapping[=].map = "Encounter.period.start"
* episodeInformation.episodeUniqueKey ^mapping[+].identity = "Output"
* episodeInformation.episodeUniqueKey ^mapping[=].language = #application/fhir
* episodeInformation.episodeUniqueKey ^mapping[=].map = "Encounter.period.start"
* episodeInformation.episodeUniqueKey ^mapping[=].comment = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter"

* episodeInformation.healthInsurancePaymentSource  1..* CREDSElementDefinition "Health Insurers"
* episodeInformation.healthInsurancePaymentSource ^mapping[+].identity = "FHIR"
* episodeInformation.healthInsurancePaymentSource ^mapping[=].language = #application/fhir
* episodeInformation.healthInsurancePaymentSource ^mapping[=].map = "Coverage"
* episodeInformation.healthInsurancePaymentSource ^mapping[+].identity = "Output"
* episodeInformation.healthInsurancePaymentSource ^mapping[=].language = #application/fhir
* episodeInformation.healthInsurancePaymentSource ^mapping[=].map = "Coverage"

* episodeInformation.healthInsuranceClaimNumber 1..* CREDSElementDefinition "Health Insurance Claim Number" "Medicare Claim Number"
* episodeInformation.healthInsuranceClaimNumber ^mapping[+].identity = "FHIR"
* episodeInformation.healthInsuranceClaimNumber ^mapping[=].language = #application/fhir
* episodeInformation.healthInsuranceClaimNumber ^mapping[=].map = "ClaimResponse.where(type = medi).identifier.value"
* episodeInformation.healthInsuranceClaimNumber ^mapping[+].identity = "Output"
* episodeInformation.healthInsuranceClaimNumber ^mapping[=].language = #application/fhir
* episodeInformation.healthInsuranceClaimNumber ^mapping[=].map = "ClaimResponse"

* episodeInformation.patientRestriction 0..1 CREDSElementDefinition "Patient Restriction" "patient requested for their information not to be used for any research or studies for the associated episode of care."
* episodeInformation.patientRestriction ^mapping[+].identity = "FHIR"
* episodeInformation.patientRestriction ^mapping[=].language = #application/fhir
* episodeInformation.patientRestriction ^mapping[=].map = "Consent.where(scope = research)"
* episodeInformation.patientRestriction ^mapping[+].identity = "Output"
* episodeInformation.patientRestriction ^mapping[=].language = #application/fhir
* episodeInformation.patientRestriction ^mapping[=].map = "Consent"

* episodeInformation.admittingProvider 1..1 CREDSElementDefinition "Admitting Provider"
* episodeInformation.admittingProvider ^mapping[+].identity = "FHIR"
* episodeInformation.admittingProvider ^mapping[=].language = #application/fhir
* episodeInformation.admittingProvider ^mapping[=].map = "Encounter.participant.where( type.coding.code = 'ADM' ).individual.resolve()"
* episodeInformation.admittingProvider ^mapping[+].identity = "Output"
* episodeInformation.admittingProvider ^mapping[=].language = #application/fhir
* episodeInformation.admittingProvider ^mapping[=].map = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner"

* episodeInformation.attendingProvider 1..1 CREDSElementDefinition "Attending Provider"
* episodeInformation.attendingProvider ^mapping[+].identity = "FHIR"
* episodeInformation.attendingProvider ^mapping[=].language = #application/fhir
* episodeInformation.attendingProvider ^mapping[=].map = "Encounter.participant.where( type.coding.code = 'ATND' ).individual.resolve()"
* episodeInformation.attendingProvider ^mapping[+].identity = "Output"
* episodeInformation.attendingProvider ^mapping[=].language = #application/fhir
* episodeInformation.attendingProvider ^mapping[=].map = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner"

* researchStudy 0..* CREDSElementDefinition "ACC Research Study" "ACC study the patient is currently enrolled"
* researchStudy ^mapping[+].identity = "Output"
* researchStudy ^mapping[=].language = #application/fhir
* researchStudy ^mapping[=].map = "ResearchStudy"

* historyAndRiskFactors 1..1 BackboneElement "History and Risk Factors"

* historyAndRiskFactors.familyHistoryOfPrematureCoronaryArteryDisease 0..1 CREDSElementDefinition "Family History of Premature Coronary Artery Disease"
* historyAndRiskFactors.familyHistoryOfPrematureCoronaryArteryDisease ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.familyHistoryOfPrematureCoronaryArteryDisease ^mapping[=].language = #application/fhir
* historyAndRiskFactors.familyHistoryOfPrematureCoronaryArteryDisease ^mapping[=].map = "Observation.where(code.coding.code = '80985-5')"
* historyAndRiskFactors.familyHistoryOfPrematureCoronaryArteryDisease ^mapping[+].identity = "Output"
* historyAndRiskFactors.familyHistoryOfPrematureCoronaryArteryDisease ^mapping[=].language = #application/fhir
* historyAndRiskFactors.familyHistoryOfPrematureCoronaryArteryDisease ^mapping[=].map = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation"

* historyAndRiskFactors.priorMyocardialInfarction  0..1 CREDSElementDefinition "Prior MI Incidence"
* historyAndRiskFactors.priorMyocardialInfarction ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.priorMyocardialInfarction ^mapping[=].language = #application/fhir
* historyAndRiskFactors.priorMyocardialInfarction ^mapping[=].map = "Condition.where(code.coding.code.memberOf(PriorMyocardialInfarction) and %encounter.actualPeriod.start > (occurrenceDateTime - 1 day))"
* historyAndRiskFactors.priorMyocardialInfarction ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.priorMyocardialInfarction ^mapping[=].language = #application/fhir
* historyAndRiskFactors.priorMyocardialInfarction ^mapping[=].map = "Observation.where(code.coding.code.memberOf(PriorMyocardialInfarction) and %encounter.actualPeriod.start > (effectiveDateTime - 1 day))"
* historyAndRiskFactors.priorMyocardialInfarction ^mapping[+].identity = "Output"
* historyAndRiskFactors.priorMyocardialInfarction ^mapping[=].language = #application/fhir
* historyAndRiskFactors.priorMyocardialInfarction ^mapping[=].map = "http://hl7.org/fhir/us/core//StructureDefinition/us-core-condition-problems-health-concerns.where(category = 'problem-list-item')"

* historyAndRiskFactors.priorPercutaneousCoronaryIntervention  0..1 CREDSElementDefinition "Prior PCI Incidence"
* historyAndRiskFactors.priorPercutaneousCoronaryIntervention ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.priorPercutaneousCoronaryIntervention ^mapping[=].language = #application/fhir
* historyAndRiskFactors.priorPercutaneousCoronaryIntervention ^mapping[=].map = "Procedure.where(code.coding.code.memberOf(priorPercutaneousCoronaryIntervention) and %encounter.actualPeriod.start > (occurrenceDateTime - 1 day))"
* historyAndRiskFactors.priorPercutaneousCoronaryIntervention ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.priorPercutaneousCoronaryIntervention ^mapping[=].language = #application/fhir
* historyAndRiskFactors.priorPercutaneousCoronaryIntervention ^mapping[=].map = "Observation.where(code.coding.code.memberOf(priorPercutaneousCoronaryIntervention) and %encounter.actualPeriod.start > (effectiveDateTime - 1 day))"
* historyAndRiskFactors.priorPercutaneousCoronaryIntervention ^mapping[+].identity = "Output"
* historyAndRiskFactors.priorPercutaneousCoronaryIntervention ^mapping[=].language = #application/fhir
* historyAndRiskFactors.priorPercutaneousCoronaryIntervention ^mapping[=].map = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation"

* historyAndRiskFactors.priorCoronaryArteryBypassGraft  0..1 CREDSElementDefinition "PRior CABG Incidence"
* historyAndRiskFactors.priorCoronaryArteryBypassGraft ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.priorCoronaryArteryBypassGraft ^mapping[=].language = #application/fhir
* historyAndRiskFactors.priorCoronaryArteryBypassGraft ^mapping[=].map = "Procedure.where(code.coding.code.memberOf(PriorCABG) and %encounter.actualPeriod.start > (occurrenceDateTime - 1 day))"
* historyAndRiskFactors.priorCoronaryArteryBypassGraft ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.priorCoronaryArteryBypassGraft ^mapping[=].language = #application/fhir
* historyAndRiskFactors.priorCoronaryArteryBypassGraft ^mapping[=].map = "Observation.where(code.coding.code.memberOf(PriorCABG) and %encounter.actualPeriod.start > (effectiveDateTime - 1 day))"
* historyAndRiskFactors.priorCoronaryArteryBypassGraft ^mapping[+].identity = "Output"
* historyAndRiskFactors.priorCoronaryArteryBypassGraft ^mapping[=].language = #application/fhir
* historyAndRiskFactors.priorCoronaryArteryBypassGraft ^mapping[=].map = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation"

* historyAndRiskFactors.cerebrovascularDisease 0..1 CREDSElementDefinition "Current Cerebrovascual Disease"
* historyAndRiskFactors.cerebrovascularDisease ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.cerebrovascularDisease ^mapping[=].language = #application/fhir
* historyAndRiskFactors.cerebrovascularDisease ^mapping[=].map = "Condition.where(code.coding.code.memberOf(PriorCerebrovascularDisease) and %encounter.actualPeriod.start > (effectiveDateTime - 1 day))"
* historyAndRiskFactors.cerebrovascularDisease ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.cerebrovascularDisease ^mapping[=].language = #application/fhir
* historyAndRiskFactors.cerebrovascularDisease ^mapping[=].map = "Observation.where(code.coding.code.memberOf(PriorCerebrovascularDisease) and %encounter.actualPeriod.start > (effectiveDateTime - 1 day))"
* historyAndRiskFactors.cerebrovascularDisease ^mapping[+].identity = "Output"
* historyAndRiskFactors.cerebrovascularDisease ^mapping[=].language = #application/fhir
* historyAndRiskFactors.cerebrovascularDisease ^mapping[=].map = "http://hl7.org/fhir/us/core//StructureDefinition/us-core-condition-problems-health-concerns.where(category = 'problem-list-item')"

* historyAndRiskFactors.diabetesMellitus 0..1 CREDSElementDefinition "Current Diabetes Mellitus"
* historyAndRiskFactors.diabetesMellitus ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.diabetesMellitus ^mapping[=].language = #application/fhir
* historyAndRiskFactors.diabetesMellitus ^mapping[=].map = "Condition.where(code.coding.code.memberOf(PriorOrCurrentDiabetesMellitus) and %encounter.actualPeriod.start > (effectiveDateTime - 1 day))"
* historyAndRiskFactors.diabetesMellitus ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.diabetesMellitus ^mapping[=].language = #application/fhir
* historyAndRiskFactors.diabetesMellitus ^mapping[=].map = "Observation.where(code.coding.code.memberOf(PriorOrCurrentDiabetesMellitus) and %encounter.actualPeriod.start > (effectiveDateTime - 1 day))"
* historyAndRiskFactors.diabetesMellitus ^mapping[+].identity = "Output"
* historyAndRiskFactors.diabetesMellitus ^mapping[=].language = #application/fhir
* historyAndRiskFactors.diabetesMellitus ^mapping[=].map = "http://hl7.org/fhir/us/core//StructureDefinition/us-core-condition-problems-health-concerns.where(category = 'problem-list-item')"

* historyAndRiskFactors.currentlyOnDialysis 0..1 CREDSElementDefinition "Patient on Dialysis"
* historyAndRiskFactors.currentlyOnDialysis ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.currentlyOnDialysis ^mapping[=].language = #application/fhir
* historyAndRiskFactors.currentlyOnDialysis ^mapping[=].map = "Condition.where(code.coding.code.memberOf(HemodialysisOrPeritonealDialysis) and %encounter.actualPeriod.start > (effectiveDateTime - 1 day))"
* historyAndRiskFactors.currentlyOnDialysis ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.currentlyOnDialysis ^mapping[=].language = #application/fhir
* historyAndRiskFactors.currentlyOnDialysis ^mapping[=].map = "Observation.where(code.coding.code.memberOf(HemodialysisOrPeritonealDialysis) and %encounter.actualPeriod.start > (effectiveDateTime - 1 day))"
* historyAndRiskFactors.currentlyOnDialysis ^mapping[+].identity = "Output"
* historyAndRiskFactors.currentlyOnDialysis ^mapping[=].language = #application/fhir
* historyAndRiskFactors.currentlyOnDialysis ^mapping[=].map = "http://hl7.org/fhir/us/core//StructureDefinition/us-core-condition-problems-health-concerns.where(category = 'problem-list-item')"

* historyAndRiskFactors.canadianStudyOfHealthAndAgingClinicalFrailtyScale 0..1 CREDSElementDefinition "Frailty Scale"
* historyAndRiskFactors.canadianStudyOfHealthAndAgingClinicalFrailtyScale ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.canadianStudyOfHealthAndAgingClinicalFrailtyScale ^mapping[=].language = #application/fhir
* historyAndRiskFactors.canadianStudyOfHealthAndAgingClinicalFrailtyScale ^mapping[=].map = "Observation.where(code.coding.code = '763264000' ) and %encounter.actualPeriod.start > (effectiveDateTime - 1 day))"
* historyAndRiskFactors.canadianStudyOfHealthAndAgingClinicalFrailtyScale ^mapping[+].identity = "Output"
* historyAndRiskFactors.canadianStudyOfHealthAndAgingClinicalFrailtyScale ^mapping[=].language = #application/fhir
* historyAndRiskFactors.canadianStudyOfHealthAndAgingClinicalFrailtyScale ^mapping[=].map = "http://hl7.org/fhir/us/core//StructureDefinition/us-core-observation"

* historyAndRiskFactors.chronicLungDisease  0..1 CREDSElementDefinition "Current Chronic Lung Disease"
* historyAndRiskFactors.chronicLungDisease ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.chronicLungDisease ^mapping[=].language = #application/fhir
* historyAndRiskFactors.chronicLungDisease ^mapping[=].map = "Condition.where(code.coding.code.memberOf(ChronicLungDisease) and %encounter.actualPeriod.start > (effectiveDateTime - 1 day))"
* historyAndRiskFactors.chronicLungDisease ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.chronicLungDisease ^mapping[=].language = #application/fhir
* historyAndRiskFactors.chronicLungDisease ^mapping[=].map = "Observation.where(code.coding.code.memberOf(ChronicLungDisease) and %encounter.actualPeriod.start > (effectiveDateTime - 1 day))"
* historyAndRiskFactors.chronicLungDisease ^mapping[+].identity = "Output"
* historyAndRiskFactors.chronicLungDisease ^mapping[=].language = #application/fhir
* historyAndRiskFactors.chronicLungDisease ^mapping[=].map = "http://hl7.org/fhir/us/core//StructureDefinition/us-core-condition-problems-health-concerns.where(category = 'problem-list-item')"

* historyAndRiskFactors.peripheralArterialDisease  0..1 CREDSElementDefinition "Peripheral Arterial Disease Instance"
* historyAndRiskFactors.peripheralArterialDisease ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.peripheralArterialDisease ^mapping[=].language = #application/fhir
* historyAndRiskFactors.peripheralArterialDisease ^mapping[=].map = "Condition.where(code.coding.code.memberOf(PeripheralArterialOcclusiveDisease) and %encounter.actualPeriod.start > (effectiveDateTime - 1 day))"
* historyAndRiskFactors.peripheralArterialDisease ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.peripheralArterialDisease ^mapping[=].language = #application/fhir
* historyAndRiskFactors.peripheralArterialDisease ^mapping[=].map = "Observation.where(code.coding.code.memberOf(PeripheralArterialOcclusiveDisease) and %encounter.actualPeriod.start > (effectiveDateTime - 1 day))"
* historyAndRiskFactors.peripheralArterialDisease ^mapping[+].identity = "Output"
* historyAndRiskFactors.peripheralArterialDisease ^mapping[=].language = #application/fhir
* historyAndRiskFactors.peripheralArterialDisease ^mapping[=].map = "http://hl7.org/fhir/us/core//StructureDefinition/us-core-condition-problems-health-concerns.where(category = 'problem-list-item')"

* historyAndRiskFactors.hypertension 0..1 CREDSElementDefinition "Hypertension Instance"
* historyAndRiskFactors.hypertension ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.hypertension ^mapping[=].language = #application/fhir
* historyAndRiskFactors.hypertension ^mapping[=].map = "Condition.where(code.coding.code.memberOf(Hypertension))"
* historyAndRiskFactors.hypertension ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.hypertension ^mapping[=].language = #application/fhir
* historyAndRiskFactors.hypertension ^mapping[=].map = "Observation.where(code.coding.code.memberOf(Hypertension))"
* historyAndRiskFactors.hypertension ^mapping[+].identity = "Output"
* historyAndRiskFactors.hypertension ^mapping[=].language = #application/fhir
* historyAndRiskFactors.hypertension ^mapping[=].map = "http://hl7.org/fhir/us/core//StructureDefinition/us-core-condition-problems-health-concerns.where(category = 'problem-list-item')"

* historyAndRiskFactors.dyslipidemia 0..1 CREDSElementDefinition "Dyslipidemia Instance"
* historyAndRiskFactors.dyslipidemia ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.dyslipidemia ^mapping[=].language = #application/fhir
* historyAndRiskFactors.dyslipidemia ^mapping[=].map = "Condition.where(code.coding.code.memberOf(Dyslipidemia))"
* historyAndRiskFactors.dyslipidemia ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.dyslipidemia ^mapping[=].language = #application/fhir
* historyAndRiskFactors.dyslipidemia ^mapping[=].map = "Observation.where(code.coding.code.memberOf(Dyslipidemia))"
* historyAndRiskFactors.dyslipidemia ^mapping[+].identity = "Output"
* historyAndRiskFactors.dyslipidemia ^mapping[=].language = #application/fhir
* historyAndRiskFactors.dyslipidemia ^mapping[=].map = "http://hl7.org/fhir/us/core//StructureDefinition/us-core-condition-problems-health-concerns.where(category = 'problem-list-item')"

* historyAndRiskFactors.tobaccoUse 1..1 CREDSElementDefinition "Smoking status and usage"  "This is for encoding all smoking status, including quantity"
* historyAndRiskFactors.tobaccoUse ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.tobaccoUse ^mapping[=].language = #application/fhir
* historyAndRiskFactors.tobaccoUse ^mapping[=].map = "Condition.where(code.coding.code.memberOf(Dyslipidemia))"
* historyAndRiskFactors.tobaccoUse ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.tobaccoUse ^mapping[=].language = #application/fhir
* historyAndRiskFactors.tobaccoUse ^mapping[=].map = "Observation.where(code.coding.code.memberOf(Dyslipidemia))"
* historyAndRiskFactors.tobaccoUse ^mapping[+].identity = "Output"
* historyAndRiskFactors.tobaccoUse ^mapping[=].language = #application/fhir
* historyAndRiskFactors.tobaccoUse ^mapping[=].map = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-smokingstatus"

* historyAndRiskFactors.height  1..1 CREDSElementDefinition "Patient Height"
* historyAndRiskFactors.height ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.height ^mapping[=].language = #application/fhir
* historyAndRiskFactors.height ^mapping[=].map = "Observation.where(code.coding.code = '8302-2')"
* historyAndRiskFactors.height ^mapping[+].identity = "Output"
* historyAndRiskFactors.height ^mapping[=].language = #application/fhir
* historyAndRiskFactors.height ^mapping[=].map = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-height"

* historyAndRiskFactors.weight 1..1 CREDSElementDefinition "Patient Weight"
* historyAndRiskFactors.weight ^mapping[+].identity = "FHIR"
* historyAndRiskFactors.weight ^mapping[=].language = #application/fhir
* historyAndRiskFactors.weight ^mapping[=].map = "Observation.where(code.coding.code = '3141-9')"
* historyAndRiskFactors.weight ^mapping[+].identity = "Output"
* historyAndRiskFactors.weight ^mapping[=].language = #application/fhir
* historyAndRiskFactors.weight ^mapping[=].map = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-weight"

* procedureInformation 1..1 BackboneElement "CathPCI Procedure Information" "All information regarding the pre-, post- and intra-procedure for the Cath PCI itself"
* procedureInformation.systolicBloodPressure 1..1 CREDSElementDefinition "Blood PRessure (Systolic)"
* procedureInformation.systolicBloodPressure ^mapping[+].identity = "FHIR"
* procedureInformation.systolicBloodPressure ^mapping[=].language = #application/fhir
* procedureInformation.systolicBloodPressure ^mapping[=].map = "Observation.where(code.coding.code = '8480-6')"
* procedureInformation.systolicBloodPressure ^mapping[+].identity = "Output"
* procedureInformation.systolicBloodPressure ^mapping[=].language = #application/fhir
* procedureInformation.systolicBloodPressure ^mapping[=].map = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-blood-pressure"

* procedureInformation.PCIprocedure  1..1 CREDSElementDefinition "PCI Procedure" "Results of this query will fill the %Procedure and %procperiod environment variables"
* procedureInformation.PCIprocedure ^mapping[+].identity = "FHIR"
* procedureInformation.PCIprocedure ^mapping[=].language = #application/fhir
* procedureInformation.PCIprocedure ^mapping[=].map = "Procedure.where(code.coding.code.memberOf('PercutaneousCoronaryIntervention') and performedPeriod.exists() )"
* procedureInformation.PCIprocedure ^mapping[+].identity = "Output"
* procedureInformation.PCIprocedure ^mapping[=].language = #application/fhir
* procedureInformation.PCIprocedure ^mapping[=].map = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-procedure"

* procedureInformation.diagnosticCoronaryAngiographyProcedure  0..1 CREDSElementDefinition "Diagnostic Coronary Angiography"
* procedureInformation.diagnosticCoronaryAngiographyProcedure ^mapping[+].identity = "FHIR"
* procedureInformation.diagnosticCoronaryAngiographyProcedure ^mapping[=].language = #application/fhir
* procedureInformation.diagnosticCoronaryAngiographyProcedure ^mapping[=].map = "Procedure.where(code.coding.code = '80994-7' and performedPeriod.start >= %period.start and performedPeriod.end <= %period.end )"
* procedureInformation.diagnosticCoronaryAngiographyProcedure ^mapping[+].identity = "Output"
* procedureInformation.diagnosticCoronaryAngiographyProcedure ^mapping[=].language = #application/fhir
* procedureInformation.diagnosticCoronaryAngiographyProcedure ^mapping[=].map = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-procedure"

* procedureInformation.diagnosticCatheterizationOperator  0..1 CREDSElementDefinition "Diagnostic Catheterization Operator" 
* procedureInformation.diagnosticCatheterizationOperator ^mapping[+].identity = "FHIR"
* procedureInformation.diagnosticCatheterizationOperator ^mapping[=].language = #application/fhir
* procedureInformation.diagnosticCatheterizationOperator ^mapping[=].map = "Procedure.where(code.coding.code = '80994-7' and performedPeriod.start >= %period.start and performedPeriod <= %period.end ).performer.actor.resolve()"
* procedureInformation.diagnosticCatheterizationOperator ^mapping[+].identity = "Output"
* procedureInformation.diagnosticCatheterizationOperator ^mapping[=].language = #application/fhir
* procedureInformation.diagnosticCatheterizationOperator ^mapping[=].map = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitoner"

* procedureInformation.diagnosticLeftHeartCath 0..1 CREDSElementDefinition "Instance of Left Heart Diagnostic Catheterization"
* procedureInformation.diagnosticLeftHeartCath ^mapping[+].identity = "FHIR"
* procedureInformation.diagnosticLeftHeartCath ^mapping[=].language = #application/fhir
* procedureInformation.diagnosticLeftHeartCath ^mapping[=].map = "Procedure.where(code.coding.code = '67629009' and performedPeriod.start >= %period.start and performedPeriod.end <= %period.end)"
* procedureInformation.diagnosticLeftHeartCath ^mapping[+].identity = "Output"
* procedureInformation.diagnosticLeftHeartCath ^mapping[=].language = #application/fhir
* procedureInformation.diagnosticLeftHeartCath ^mapping[=].map = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-procedure"

* procedureInformation.lvefPercentDiagnosticLeftHeartCath 1..1 CREDSElementDefinition "Diagnositic Left Heart Cath LVEF%"
* procedureInformation.diagnosticLeftHeartCath ^mapping[+].identity = "FHIR"
* procedureInformation.diagnosticLeftHeartCath ^mapping[=].language = #application/fhir
* procedureInformation.diagnosticLeftHeartCath ^mapping[=].map = "Observation.where(code.coding.code = '10230-1' and effectiveDate ge %period.start)"
* procedureInformation.diagnosticLeftHeartCath ^mapping[+].identity = "Output"
* procedureInformation.diagnosticLeftHeartCath ^mapping[=].language = #application/fhir
* procedureInformation.diagnosticLeftHeartCath ^mapping[=].map = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-clinical-test"

* procedureInformation.concomitantProceduresPerformed 0..* CREDSElementDefinition "Concomitant Procedures Performed" 
* procedureInformation.diagnosticLeftHeartCath ^mapping[+].identity = "FHIR"
* procedureInformation.diagnosticLeftHeartCath ^mapping[=].language = #application/fhir
* procedureInformation.diagnosticLeftHeartCath ^mapping[=].map = "Procedure.where(code.coding.code != '67629009' and performedPeriod.start >= %period.start and performedPeriod.end <= %period.end)"
* procedureInformation.diagnosticLeftHeartCath ^mapping[+].identity = "Output"
* procedureInformation.diagnosticLeftHeartCath ^mapping[=].language = #application/fhir
* procedureInformation.diagnosticLeftHeartCath ^mapping[=].map = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-procedure"

* procedureInformation.cumulativeAirKerma  1..* CREDSElementDefinition "Cumulative Air Kerma" 
* procedureInformation.diagnosticLeftHeartCath ^mapping[+].identity = "FHIR"
* procedureInformation.diagnosticLeftHeartCath ^mapping[=].language = #application/fhir
* procedureInformation.diagnosticLeftHeartCath ^mapping[=].map = "Observation.where(code.coding.code = '228850003' and (effectivePeriod.start >= %period.start and effectivePeriod.end <= %period.end)"
* procedureInformation.diagnosticLeftHeartCath ^mapping[+].identity = "Output"
* procedureInformation.diagnosticLeftHeartCath ^mapping[=].language = #application/fhir
* procedureInformation.diagnosticLeftHeartCath ^mapping[=].map = "Observation"

* procedureInformation.fluoroscopyTime 1..* CREDSElementDefinition "Total Flouroscopy Time"  "Indicate the total fluoroscopy time recorded to the nearest 0.1-minute."
* procedureInformation.fluoroscopyTime ^mapping[+].identity = "Output"
* procedureInformation.fluoroscopyTime ^mapping[=].language = #application/fhir
* procedureInformation.fluoroscopyTime ^mapping[=].map = "Observation"

* procedureInformation.contrastVolume 1..* CREDSElementDefinition "Indicate the volume of contrast (ionic and non-ionic) used in milliliters (ml). The volume recorded should be the total volume for the lab visit."
* procedureInformation.contrastVolume ^mapping[+].identity = "Output"
* procedureInformation.contrastVolume ^mapping[=].language = #application/fhir
* procedureInformation.contrastVolume ^mapping[=].map = "Observation"

* procedureInformation.doseAreaProduct 1..* CREDSElementDefinition "Total Flouroscopy Dose"  "Indicate the total fluoroscopy dose to the nearest integer. The value recorded should include the total dose for the lab visit."
* procedureInformation.fluoroscopyTime ^mapping[+].identity = "Output"
* procedureInformation.fluoroscopyTime ^mapping[=].language = #application/fhir
* procedureInformation.fluoroscopyTime ^mapping[=].map = "Observation"
/*
* procedureInformation.arterialCrossOver
* procedureInformation.venousAccess
* procedureInformation.cardiacArrestAtThisFacility
* procedureInformation.preprocedureInformation  1..1 BackboneElement 
* procedureInformation.preprocedureInformation.heartFailure
* procedureInformation.preprocedureInformation.heartFailure.newYorkHeartAssociationClassification
* procedureInformation.preprocedureInformation.heartFailure.heartFailureNewlyDiagnosed
* procedureInformation.preprocedureInformation.heartFailure.heartFailureType
* procedureInformation.preprocedureInformation.diagnosticTest  1..1 BackboneElement 
* procedureInformation.preprocedureInformation.diagnosticTest.electrocardiacAssessment.results
* procedureInformation.preprocedureInformation.diagnosticTest.electrocardiacAssessment.method
* procedureInformation.preprocedureInformation.diagnosticTest.newAntiarrhythmicTherapyInitiatedPriorToCathLab
* procedureInformation.preprocedureInformation.diagnosticTest.electrocardiacAbnormalityType
* procedureInformation.preprocedureInformation.diagnosticTest.non-SustainedVentricularTachycardiaType
* procedureInformation.preprocedureInformation.diagnosticTest.lvef
* procedureInformation.preprocedureInformation.diagnosticTest.lvef.percent
* procedureInformation.preprocedureInformation.diagnosticTest.cardiacCta
* procedureInformation.preprocedureInformation.diagnosticTest.cardiacCta.date
* procedureInformation.preprocedureInformation.diagnosticTest.cardiacCta.results
* procedureInformation.preprocedureInformation.diagnosticTest.agatstonCalciumScore
* procedureInformation.preprocedureInformation.diagnosticTest.agatstonCalciumScore.results
* procedureInformation.preprocedureInformation.diagnosticTest.agatstonCalciumScore.date
* procedureInformation.preprocedureInformation.diagnosticTest.priorDcapWithoutIntervention
* procedureInformation.preprocedureInformation.diagnosticTest.priorDcapWithoutIntervention.date
* procedureInformation.preprocedureInformation.diagnosticTest.priorDcapWithoutIntervention.results
* procedureInformation.preprocedureInformation.diagnosticTest.heartRate
* procedureInformation.preprocedureInformation.diagnosticTest.stressTest
* procedureInformation.preprocedureInformation.diagnosticTest.stressTest.performedType
* procedureInformation.preprocedureInformation.diagnosticTest.stressTest.results
* procedureInformation.preprocedureInformation.diagnosticTest.stressTest.riskOrExtentOfIschemia
* procedureInformation.preprocedureInformation.diagnosticTest.stressTest.date
* procedureInformation.preprocedureInformation.preprocedureMedication 1..1 BackboneElement 
* procedureInformation.preprocedureInformation.preprocedureMedication.code
* procedureInformation.preprocedureInformation.preprocedureMedication.administered
* procedureInformation.preprocedureInformation.saQuestionnaire 1..1 BackboneElement 
* procedureInformation.preprocedureInformation.saQuestionnaire.q1A
* procedureInformation.preprocedureInformation.saQuestionnaire.q1B
* procedureInformation.preprocedureInformation.saQuestionnaire.q1C
* procedureInformation.preprocedureInformation.saQuestionnaire.q2
* procedureInformation.preprocedureInformation.saQuestionnaire.q3
* procedureInformation.preprocedureInformation.saQuestionnaire.q4
* procedureInformation.preprocedureInformation.saQuestionnaire.q5
* procedureInformation.preprocedureInformation.roseDyspneaScale 1..1 BackboneElement 
* procedureInformation.preprocedureInformation.roseDyspneaScale.q1
* procedureInformation.preprocedureInformation.roseDyspneaScale.q2
* procedureInformation.preprocedureInformation.roseDyspneaScale.q3
* procedureInformation.preprocedureInformation.roseDyspneaScale.q4
* procedureInformation.closureMethods 1..1 BackboneElement 
* procedureInformation.closureMethods.arterialAccessClosureMethod
* procedureInformation.closureMethods.closureMethodUdi
* procedureInformation.preprocedureLabs 1..1 BackboneElement 
* procedureInformation.preprocedureLabs.hemoglobin
* procedureInformation.preprocedureLabs.creatinine
* procedureInformation.preprocedureLabs.troponinI
* procedureInformation.preprocedureLabs.troponinT
* procedureInformation.preprocedureLabs.totalCholesterol
* procedureInformation.preprocedureLabs.highDensityLipoprotein
* procedureInformation.postprocedureLabs 1..1 BackboneElement 
* procedureInformation.postprocedureLabs.hemoglobin
* procedureInformation.postprocedureLabs.creatinine
* procedureInformation.postprocedureLabs.troponinI
* procedureInformation.postprocedureLabs.troponinT
* procedureInformation.cathLabVisit 1..1 BackboneElement 
* procedureInformation.cathLabVisit.indicationsForCathLabVisit
* procedureInformation.cathLabVisit.chestPainSymptomAssessment
* procedureInformation.cathLabVisit.cardiovascularInstability
* procedureInformation.cathLabVisit.cardiovascularInstability.type
* procedureInformation.cathLabVisit.ventricularSupport
* procedureInformation.cathLabVisit.pharmacologicVasopressorSupport
* procedureInformation.cathLabVisit.mechanicalVentricularSupportTiming
* procedureInformation.cathLabVisit.evaluationForSurgeryType
* procedureInformation.cathLabVisit.functionalCapacity
* procedureInformation.cathLabVisit.surgicalRisk
* procedureInformation.cathLabVisit.solidOrganTransplant
* procedureInformation.cathLabVisit.solidOrganTransplant.donor
* procedureInformation.cathLabVisit.solidOrganTransplant.type
* procedureInformation.cathLabVisit.valvularDiseaseStenosis.type
* procedureInformation.cathLabVisit.valvularDiseaseStenosis.severity
* procedureInformation.cathLabVisit.valvularDiseaseRegurgitation.type
* procedureInformation.cathLabVisit.valvularDiseaseRegurgitation.severity
* procedureInformation.coronaryAnatomy 1..1 BackboneElement 
* procedureInformation.coronaryAnatomy.coronaryCirculationDominance
* procedureInformation.coronaryAnatomy.nativeVessel 1..1 BackboneElement
* procedureInformation.coronaryAnatomy.nativeVessel.lesionSegmentNumber
* procedureInformation.coronaryAnatomy.nativeVessel.coronaryVesselStenosis
* procedureInformation.coronaryAnatomy.nativeVessel.adjunctiveMeasurementsObtained
* procedureInformation.coronaryAnatomy.nativeVessel.fractionalFlowReserveRatio
* procedureInformation.coronaryAnatomy.nativeVessel.instantaneousWave-FreeRatio
* procedureInformation.coronaryAnatomy.nativeVessel.intravascularUltrasonography
* procedureInformation.coronaryAnatomy.nativeVessel.coherenceTomography
* procedureInformation.coronaryAnatomy.graftVessel 1..1 BackboneElement
* procedureInformation.coronaryAnatomy.graftVessel.lesionSegmentNumber
* procedureInformation.coronaryAnatomy.graftVessel.coronaryVesselStenosis
* procedureInformation.coronaryAnatomy.graftVessel.cabg
* procedureInformation.coronaryAnatomy.graftVessel.adjunctiveMeasurementsObtained
* procedureInformation.coronaryAnatomy.graftVessel.fractionalFlowReserveRatio
* procedureInformation.coronaryAnatomy.graftVessel.instantaneousWave-FreeRatio
* procedureInformation.coronaryAnatomy.graftVessel.intravascularUltrasonography
* procedureInformation.coronaryAnatomy.graftVessel.opticalCoherenceTomography
* procedureInformation.pciProcedure 1..1 BackboneElement
* procedureInformation.pciProcedure.pciStatus
* procedureInformation.pciProcedure.hypothermiaInduced 1..1 BackboneElement
* procedureInformation.pciProcedure.hypothermiaInduced.timing
* procedureInformation.pciProcedure.levelOfConsciousness
* procedureInformation.pciProcedure.decisionForPciWithSurgicalConsult
* procedureInformation.pciProcedure.cardiovascularTreatmentDecision
* procedureInformation.pciProcedure.pciForMultivesselDisease
* procedureInformation.pciProcedure.multi-VesselProcedureType
* procedureInformation.pciProcedure.percutaneousCoronaryInterventionIndication
* procedureInformation.pciProcedure.acuteCoronarySyndromeSymptom 1..1 BackboneElement
* procedureInformation.pciProcedure.acuteCoronarySyndromeSymptom.datetime
* procedureInformation.pciProcedure.thrombolytics 
* procedureInformation.pciProcedure.thrombolyticTherapy 1..1 BackboneElement
* procedureInformation.pciProcedure.thrombolyticTherapy.datetime
* procedureInformation.pciProcedure.syntaxScore
* procedureInformation.pciProcedure.stemiOrStemiEquivalentFirstNoted
* procedureInformation.pciProcedure.subsequentEcgWithStemiOrStemiEquivalent.datetime
* procedureInformation.pciProcedure.subsequentEcgObtainedInEmergencyDepartment
* procedureInformation.pciProcedure.patientTransferredInForImmediatePciForStemi
* procedureInformation.pciProcedure.emergencyDepartmentPresentationAtReferringFacility
* procedureInformation.pciProcedure.firstDeviceActivation
* procedureInformation.pciProcedure.patientCenteredReasonForDelayInPci
* procedureInformation.pciProcedure.patientCenteredReasonForDelayInPci.reason
* procedureInformation.pciProcedure.pciOperator 1..1 BackboneElement
* procedureInformation.pciProcedure.pciOperator.lastName
* procedureInformation.pciProcedure.pciOperator.firstName
* procedureInformation.pciProcedure.pciOperator.middleName
* procedureInformation.pciProcedure.pciOperator.npi
* procedureInformation.pciProcedure.arterialAccessSite
* procedureInformation.pciProcedure.mechanicalVentilatorSupport 1..1 BackboneElement
* procedureInformation.pciProcedure.mechanicalVentilatorSupport.device
* procedureInformation.pciProcedure.pciProcedureMedicationCode
* procedureInformation.pciProcedure.procedureMedicationsAdministered
* procedureInformation.pciProcedure.lesionsAndDevices 1..1 BackboneElement
* procedureInformation.pciProcedure.lesionsAndDevices.lesionCounter
* procedureInformation.pciProcedure.lesionsAndDevices.nativeLesionSegmentNumber
* procedureInformation.pciProcedure.lesionsAndDevices.culpritStenosis
* procedureInformation.pciProcedure.lesionsAndDevices.stenosisImmediatelyPriorToTreatment
* procedureInformation.pciProcedure.lesionsAndDevices.chronicTotalOcclusion
* procedureInformation.pciProcedure.lesionsAndDevices.timiFlowPre-Intervention
* procedureInformation.pciProcedure.lesionsAndDevices.previouslyTreatedLesion
* procedureInformation.pciProcedure.lesionsAndDevices.previouslyTreatedLesionDate
* procedureInformation.pciProcedure.lesionsAndDevices.treatedWithStent
* procedureInformation.pciProcedure.lesionsAndDevices.in-StentRestenosis
* procedureInformation.pciProcedure.lesionsAndDevices.in-StentThrombosis
* procedureInformation.pciProcedure.lesionsAndDevices.stentType
* procedureInformation.pciProcedure.lesionsAndDevices.lesionInGraft
* procedureInformation.pciProcedure.lesionsAndDevices.typeOfCabgGraft
* procedureInformation.pciProcedure.lesionsAndDevices.locationInGraft
* procedureInformation.pciProcedure.lesionsAndDevices.navigateThroughGraftToNativeLesion
* procedureInformation.pciProcedure.lesionsAndDevices.lesionComplexity
* procedureInformation.pciProcedure.lesionsAndDevices.lesionLength
* procedureInformation.pciProcedure.lesionsAndDevices.severeCalcification
* procedureInformation.pciProcedure.lesionsAndDevices.bifurcationLesion
* procedureInformation.pciProcedure.lesionsAndDevices.guidewireAcrossLesion
* procedureInformation.pciProcedure.lesionsAndDevices.deviceDeployed
* procedureInformation.pciProcedure.lesionsAndDevices.post-InterventionStenosis
* procedureInformation.pciProcedure.lesionsAndDevices.post-InterventionTimiFlow
* procedureInformation.pciProcedure.intracoronaryDevices 1..1 BackboneElement
* procedureInformation.pciProcedure.intracoronaryDevices.counter
* procedureInformation.pciProcedure.intracoronaryDevices.used
* procedureInformation.pciProcedure.intracoronaryDevices.udi
* procedureInformation.pciProcedure.intracoronaryDevices.associateLesion
* procedureInformation.pciProcedure.intracoronaryDevices.diameter
* procedureInformation.pciProcedure.intracoronaryDevices.length
* procedureInformation.pciProcedure.intraAndPost-ProcedureEvents 1..1 BackboneElement
* procedureInformation.pciProcedure.intraAndPost-ProcedureEvents.datetime
* procedureInformation.pciProcedure.intraAndPost-ProcedureEvents.coronaryArteryPerforation
* procedureInformation.pciProcedure.intraAndPost-ProcedureEvents.significantCoronaryArteryDissection
* procedureInformation.pciProcedure.intraAndPost-ProcedureEvents.numberOfUnitsOfPrbcsTransfused
* procedureInformation.pciProcedure.intraAndPost-ProcedureEvents.transfusionPci
* procedureInformation.pciProcedure.intraAndPost-ProcedureEvents.transfusionSurgery
* discharge 1..1 BackboneElement
* discharge.coronaryArteryBypassGraftDatetime
* discharge.interventionsThisHospitalization
* discharge.interventionsThisHospitalization.type
* discharge.cabgStatus
* discharge.cabgIndication
* discharge.creatinine
* discharge.hemoglobin
* discharge.dischargeProvider 1..1 BackboneElement
* discharge.dischargeProvider.lastName
* discharge.dischargeProvider.firstName
* discharge.dischargeProvider.middleName
* discharge.dischargeProvider.npi
* discharge.comfortMeasuresOnly
* discharge.discharge 1..1 BackboneElement
* discharge.discharge.datetime
* discharge.discharge.status
* discharge.discharge.location
* discharge.transferredForCabg
* discharge.cabgPlannedAfterDischarge
* discharge.hospiceCare
* discharge.cardiacRehabilitationReferral
* discharge.levelOfConsciousness
* discharge.deathDuringTheProcedure
* discharge.causeOfDeath
* discharge.dischargeMedicationReconciliationCompleted
* discharge.dischargeMedicationsReconciled
* discharge.dischargeMedication 1..1 BackboneElement
* discharge.dischargeMedication.code
* discharge.dischargeMedication.prescribed
* discharge.dischargeMedication.patientRationaleForNotTakingMedication
* discharge.dischargeMedication.dose
*/