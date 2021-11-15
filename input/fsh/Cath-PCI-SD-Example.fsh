/*Logical: CathPCI
Id: cathPCI
Title: "Cath-PCI Submission Mappings Base Template"
Description: """This is the base structure of the Cath-PCI data for submission to the Registry
This StructureDefinition sets the basic structure of the logical model.  The Backbone Elements are the CathPCI data sections.
The only things in the base model are the elements, cardinality, short names and full descriptions.
A section (such as Demographics) is a BackboneElement (holds no values).  All subordinate elements are CREDSElementDefinitions.
"""
* ^baseDefinition = "http://hl7.org/fhir/us/fhir-registry-protocols-ig/StructureDefinition/CREDSStructureDefinition"

* demographics 1..1 BackboneElement "Patient Demographics"
* demographics.lastName 1..1 CREDSElementDefinition "Last Name" "Indicate the patient's last name. Hyphenated names should be recorded with a hyphen."
* demographics.firstName 1..1 CREDSElementDefinition "First Name" "Indicate the patient's first name."
* demographics.middleName 0..* CREDSElementDefinition "Middle Name" "Indicate the patient's middle names."
* episodeInformation 1..1 BackboneElement "CathPCI Episode Information"
* episodeInformation.episodeUniqueKey 1..1 CREDSElementDefinition "Episode Unique Key" "Indicate the unique key associated with each patient episode record as assigned by the EMR/EHR or your software application."
*/

Logical: CathPCI_Submission_Map
Id: cathPCISubmissionMap
//Parent: CathPCI 
Title: "Cath-PCI Submission Map"
Description: """This is an example of the data that would be used for a Cath-PCI Submission
The full map is a logical model as that allows conformance to the FHIR Standard the way a custom Resource would not.
Each element has the short name of the data, a full description and the paths to fetch and place the information, by data standard type, for each.
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
* ^mapping[2].name = "HL7 V2"
* ^mapping[2].comment = "Path to where in a HL7 V2 Message the data element is found"
* ^mapping[3].uri = "http://hl7.org/fhir/us/core"
* ^mapping[3].name = "Output"
* ^mapping[3].comment = "Location within the requirements profile to place the data for submission in US Core or FHIR Core Resources"

* demographics 1..1 BackboneElement "Patient Demographics"

* demographics.lastName 1..1 CREDSElementDefinition "Last Name" "Indicate the patient's last name. Hyphenated names should be recorded with a hyphen."
* demographics.lastName ^requirements = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient" // profile for Bundle inclusion
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
* demographics.firstName 1..1 CREDSElementDefinition "First Name" "Indicate the patient's first name."

* demographics.firstName ^requirements = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
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
* demographics.middleName 0..* CREDSElementDefinition "Middle Name" "Indicate the patient's middle names."

* demographics.middleName ^requirements = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
* demographics.middleName ^mapping[0].identity = "FHIR"
* demographics.middleName ^mapping[0].language = #application/fhir
* demographics.middleName ^mapping[0].map = "Patient.name.given[1]"
* demographics.middleName ^mapping[1].identity = "CDA"
* demographics.middleName ^mapping[1].language = #application/hl7-sda+xml
* demographics.middleName ^mapping[1].map = "ClinicalDocument.recordTarget.patient.name.given[position()>1]"  
* demographics.middleName ^mapping[2].identity = "HL7V2"
* demographics.middleName ^mapping[2].language = #application/edi-hl7v2
* demographics.middleName ^mapping[2].map = "ADT_A01.PID.5.3"
* demographics.middleName ^mapping[3].identity = "Output"
* demographics.middleName ^mapping[3].language = #application/fhir // mimetype of standard 
* demographics.middleName ^mapping[3].map = "Patient.name.given" // actual Xpath to data within profile in requirements

* episodeInformation 1..1 BackboneElement "CathPCI Episode Information"

* episodeInformation.episodeUniqueKey 1..1 CREDSElementDefinition "Episode Unique Key" "Indicate the unique key associated with each patient episode record as assigned by the EMR/EHR or your software application."
* episodeInformation.episodeUniqueKey ^requirements = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter"
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
