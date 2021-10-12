Logical: CathPCI
Id: cathPCI
Title: "Cath-PCI Report Template"
Description: "This is the base structure of the Cath-PCI data for submission to the Registry"
* ^baseDefinition = "http://hl7.org/fhir/us/fhir-registry-protocols-ig/StructureDefinition/CREDSStructureDefinition"
* lastName 1..1 canonical "Last Name" "Indicate the patient's last name. Hyphenated names should be recorded with a hyphen."
* firstName 1..1 canonical "First Name" "Indicate the patient's first name."
* middleName 0..* canonical "Middle Name" "Indicate the patient's middle names."
* episodeUniqueKey 1..1 canonical "Episode Unique Key" "Indicate the unique key associated with each patient episode record as assigned by the EMR/EHR or your software application."
/*
Instance: CathPCI-Report
InstanceOf: StructureDefinition
Usage: #definition
Title: "Cath-PCI Submission Report"
Description: "This is an example of the data that would be used for a Cath-PCI Submission"

* url = "http://acc.org/submissions/StructureDefinition/cathpci-map"
* identifier
  * use = #official
  * value = "Cath-PCI"
* status = #draft
* experimental = false
* date = "2021-09-07"
* publisher = "American College of Cardiology"
* contact
  * name = "Jane Smith"
  * telecom.system = #email
  * telecom.value = "mailto:noreply@acc.org"

// Note: Mapping is open sliced with these three as the base
* mapping[FHIR].identity = "FHIR"
* mapping[CDA].identity = "CDA"
* mapping[V2].identity = "HL7V2"
* derivation = #specialization
* type = "cathPci-report"
* differential // I'm using a mix of indentation and hard paths because it's easier for me
  * lastName = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient" // profile for Bundle inclusion
  * lastName.mapping[0].identity = "FHIR.Demographics.LastName" // Always "Source Standard"."Section Name"."Data Element Name"
  * lastName.mapping[0].language = #application/fhir // mimetype of standard 
  * lastName.mapping[0].map = "Patient.name.family" // actual Xpath to data 
  * lastName.mapping[1].identity = "CDA.Demographics.LastName"
  * lastName.mapping[1].language = #application/hl7-sda+xml // actual registered mimetype
  * lastName.mapping[1].map = "/ClinicalDocument/recordTarget/patient/name/family"
  * lastName.mapping[2].identity = "V2.Demographics.LastName"
  * lastName.mapping[2].language = #application/edi-hl7v2 // discussed in InM but I don't know if it was registered
  * lastName.mapping[2].map = "ADT_A01:PID.5.1" // I could just put PID.5.1 but I'll need the message for other element mappings.  That being said, how do I wildcard ADT? How do I Xpath V2? Should I?

  * firstName = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
  * firstName.mapping[0].identity = "FHIR.Demographics.FirstName"
  * firstName.mapping[0].language = #application/fhir
  * firstName.mapping[0].map = "Patient.name.given[0]"
  * firstName.mapping[1].identity = "CDA.Demographics.FirstName"
  * firstName.mapping[1].language = #application/hl7-sda+xml
  * firstName.mapping[1].map = "/ClinicalDocument/recordTarget/patient/name/given[1]"
  * firstName.mapping[2].identity = "V2.Demographics.FirstName"
  * firstName.mapping[2].language = #application/edi-hl7v2
  * firstName.mapping[2].map = "ADT_A01:PID.5.2"

  * middleName = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
  * middleName.mapping[0].identity = "FHIR.Demographics.FirstName"
  * middleName.mapping[0].language = #application/fhir
  * middleName.mapping[0].map = "Patient.name.given[1]"
  * middleName.mapping[1].identity = "CDA.Demographics.FirstName"
  * middleName.mapping[1].language = #application/hl7-sda+xml
  * middleName.mapping[1].map = "/ClinicalDocument/recordTarget/patient/name/given[position()>1]"  
  * middleName.mapping[2].identity = "V2.Demographics.FirstName"
  * middleName.mapping[2].language = #application/edi-hl7v2
  * middleName.mapping[2].map = "ADT_A01:PID.5.3"

  * episodeUniqueKey = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter"
  * episodeUniqueKey.mapping[0].identity = "FHIR.Episode-Information.Episode-Unique-Key"
  * episodeUniqueKey.mapping[0].language = #application/fhir
  * episodeUniqueKey.mapping[0].map = "iif(Encounter.identifier(type.code='VN').value, Encounter.identifier(type.code='VN').value, Encounter.identifier[0].value)"
  * episodeUniqueKey.mapping[1].identity = "CDA.Episode-Information.Episode-Unique-Key"
  * episodeUniqueKey.mapping[1].language = #application/hl7-sda+xml
  * episodeUniqueKey.mapping[1].map = "/ClinicalDocument/component/section/entry/encounter/id/extension"  
  * episodeUniqueKey.mapping[2].identity = "V2.Episode-Information.Episode-Unique-Key"
  * episodeUniqueKey.mapping[2].language = #application/edi-hl7v2
  * episodeUniqueKey.mapping[2].map = "ADT_A01:PV1.19.1"
  */