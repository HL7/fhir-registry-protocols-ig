Instance: CATHPCI
InstanceOf: CREDSStructureDefinition
Usage: #example
Title: "CATHPCI Submission StructureDefinition"
Description: "This is an example of the StructureDefinition that would be used for a Cath-PCI Submission"
* url = "http://www.acc.org/cathpci/submission.json"
* identifier
  * use = #official
  * value = "Cath-PCI"
* status = #draft
* experimental = #false
* date = "2021-09-07"
* publisher = "American College of Cardiology"
* contact.name = "Jane Smith"
* contact.telecom = "noreply@acc.org"
* description = "StructureDefinition for use in CREDS-based data retrieval"
// Note: Mapping is open sliced with these three as the base
* mapping[FHIR].identity = "FHIR"
* mapping[FHIR].uri = "http://fhir.hl7.org"
* mapping[FHIR].name = "Fast Health Interoperability Resources"
* mapping[FHIR].comment = "FHIR based mapping is used"
* mapping[CDA].identity = "CDA"
* mapping[CDA].uri = "http://build.fhir.org/ig/HL7/cda-core-2.0/"
* mapping[CDA].name = "Clinical Document Architecture"
* mapping[CDA].comment = "CDA 2.0/CCDA 2.1 based mapping is used"
* mapping[V2].identity = "HL7V2"
* mapping[V2].uri = "http://www.hl7.eu/refactored/index.html"
* mapping[V2].name = "HL7 V2"
* mapping[V2].comment = "HL7 V2 based mapping is used"
* kind = #complex-type
* abstract = #true
* type = "CATHPCI" // same as .id
* snapshot // I'm using a mix of indentation and hard paths because it's easier for me
  * lastName.short = "Last Name" //Data Element Name
  * lastName.comment = "Indicate the patient's last name. Hyphenated names should be recorded with a hyphen." //Coding Instructions
  * lastName.type.code = #canonical
  * lastName.type.targetProfile = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient // profile for Bundle inclusion
  * lastName.mapping[0].identity = "FHIR.Demographics.LastName" // Always "Source Standard"."Section Name"."Data Element Name"
  * lastName.mapping[0].language = "application/fhir" // mimetype of standard 
  * lastName.mapping[0].map = "Patient.name.family" // actual Xpath to data 
  * lastName.mapping[1].identity = "CDA.Demographics.LastName"
  * lastName.mapping[1].language = "application/hl7-sda+xml" // actual registered mimetype
  * lastName.mapping[1].map = "/ClinicalDocument/recordTarget/patient/name/family"
  * lastName.mapping[2].identity = "V2.Demographics.LastName"
  * lastName.mapping[2].language = "application/edi-hl7v2" // discussed in InM but I don't know if it was registered
  * lastName.mapping[2].map = "ADT_A01:PID.5.1" // I could just put PID.5.1 but I'll need the message for other element mappings.  That being said, how do I wildcard ADT? How do I Xpath V2? Should I?

  * firstName.short = "First Name" 
  * firstName.comment = "Indicate the patient's first name."
  * firstName.type.code = #canonical 
  * firstName.type.targetProfile = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
  * firstName.mapping[0].identity = "FHIR.Demographics.FirstName"
  * firstName.mapping[0].language = "application/fhir"
  * firstName.mapping[0].map = "Patient.name.given[0]"
  * firstName.mapping[1].identity = "CDA.Demographics.FirstName"
  * firstName.mapping[1].language = "application/hl7-sda+xml"
  * firstName.mapping[1].map = "/ClinicalDocument/recordTarget/patient/name/given[1]"
  * firstName.mapping[2].identity = "V2.Demographics.FirstName"
  * firstName.mapping[2].language = "application/edi-hl7v2"
  * firstName.mapping[2].map = "ADT_A01:PID.5.2"

  * middleName.short = "Middle Name"
  * middleName.comment = "Indicate the patient's first name."
  * middleName.type.code = #canonical 
  * middleName.type.targetProfile = http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
  * middleName.mapping[0].identity = "FHIR.Demographics.FirstName"
  * middleName.mapping[0].language = "application/fhir"
  * middleName.mapping[0].map = "Patient.name.given[0]"
  * middleName.mapping[1].identity = "CDA.Demographics.FirstName"
  * middleName.mapping[1].language = "application/hl7-sda+xml"
  * middleName.mapping[1].map = "/ClinicalDocument/recordTarget/patient/name/given[position()>1]"  
  * middleName.mapping[2].identity = "V2.Demographics.FirstName"
  * middleName.mapping[2].language = "application/edi-hl7v2"
  * middleName.mapping[2].map = "ADT_A01:PID.5.3"

  * episodeUniqueKey.short = "Episode Unique Key"
  * episodeUniqueKey.comment = "Indicate the unique key associated with each patient episode record as assigned by the EMR/EHR or your software application."
  * episodeUniqueKey.type.code = #canonical 
  * episodeUniqueKey.type.targetProfile = http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter
  * episodeUniqueKey.mapping[0].identity = "FHIR.Episode Information.Episode Unique Key"
  * episodeUniqueKey.mapping[0].language = "application/fhir"
  * episodeUniqueKey.mapping[0].map = "iif(Encounter.identifier(type.code='VN').value, Encounter.identifier(type.code='VN').value, Encounter.identifier[0].value)"
  * episodeUniqueKey.mapping[1].identity = "CDA.Episode Information.Episode Unique Key"
  * episodeUniqueKey.mapping[1].language = "application/hl7-sda+xml"
  * episodeUniqueKey.mapping[1].map = "/ClinicalDocument/component/section/entry/encounter/id/extension"  
  * episodeUniqueKey.mapping[2].identity = "V2.Episode Information.Episode Unique Key"
  * episodeUniqueKey.mapping[2].language = "application/edi-hl7v2"
  * episodeUniqueKey.mapping[2].map = "ADT_A01:PV1.19.1"