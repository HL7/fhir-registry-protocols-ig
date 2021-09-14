Instance: CathPCI
InstanceOf: CREDSStructureDefinition
Usage: #example
Title: "Cath-PCI Submission StructureDefinition"
Description: "This is an example of the StructureDefinition that would be used for a Cath-PCI Submission"
* url = "http://acc.org/submissions/StructureDefinition/cathpci-map"
* identifier
  * use = #official
  * value = "Cath-PCI"
* name = "Cath-PCI-Data-Map"
* status = #draft
* experimental = false
* date = "2021-09-07"
* publisher = "American College of Cardiology"
* contact.name = "Jane Smith"
* contact.telecom.system = #email
* contact.telecom.value = "mailto:noreply@acc.org"
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
* abstract = true
* type = "cathPci" // same as .id
* snapshot // I'm using a mix of indentation and hard paths because it's easier for me
  * element.path = "cathPci.snapshot.lastName"
  * element.short = "Last Name" //Data Element Name
  * element.comment = "Indicate the patient's last name. Hyphenated names should be recorded with a hyphen." //Coding Instructions
  * element.type.code = #canonical
  * element.type.targetProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient" // profile for Bundle inclusion
  * element.mapping[0].identity = "FHIR.Demographics.LastName" // Always "Source Standard"."Section Name"."Data Element Name"
  * element.mapping[0].language = #application/fhir // mimetype of standard 
  * element.mapping[0].map = "Patient.name.family" // actual Xpath to data 
  * element.mapping[1].identity = "CDA.Demographics.LastName"
  * element.mapping[1].language = #application/hl7-sda+xml // actual registered mimetype
  * element.mapping[1].map = "/ClinicalDocument/recordTarget/patient/name/family"
  * element.mapping[2].identity = "V2.Demographics.LastName"
  * element.mapping[2].language = #application/edi-hl7v2 // discussed in InM but I don't know if it was registered
  * element.mapping[2].map = "ADT_A01:PID.5.1" // I could just put PID.5.1 but I'll need the message for other element mappings.  That being said, how do I wildcard ADT? How do I Xpath V2? Should I?

  * element.path = "cathPci.snapshot.firstName"
  * element.short = "First Name" 
  * element.comment = "Indicate the patient's first name."
  * element.type.code = #canonical 
  * element.type.targetProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
  * element.mapping[0].identity = "FHIR.Demographics.FirstName"
  * element.mapping[0].language = #application/fhir
  * element.mapping[0].map = "Patient.name.given[0]"
  * element.mapping[1].identity = "CDA.Demographics.FirstName"
  * element.mapping[1].language = #application/hl7-sda+xml
  * element.mapping[1].map = "/ClinicalDocument/recordTarget/patient/name/given[1]"
  * element.mapping[2].identity = "V2.Demographics.FirstName"
  * element.mapping[2].language = #application/edi-hl7v2
  * element.mapping[2].map = "ADT_A01:PID.5.2"

  * element.path = "cathPci.snapshot.middleName"
  * element.short = "Middle Name"
  * element.comment = "Indicate the patient's first name."
  * element.type.code = #canonical 
  * element.type.targetProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
  * element.mapping[0].identity = "FHIR.Demographics.FirstName"
  * element.mapping[0].language = #application/fhir
  * element.mapping[0].map = "Patient.name.given[0]"
  * element.mapping[1].identity = "CDA.Demographics.FirstName"
  * element.mapping[1].language = #application/hl7-sda+xml
  * element.mapping[1].map = "/ClinicalDocument/recordTarget/patient/name/given[position()>1]"  
  * element.mapping[2].identity = "V2.Demographics.FirstName"
  * element.mapping[2].language = #application/edi-hl7v2
  * element.mapping[2].map = "ADT_A01:PID.5.3"

  * element.path = "cathPci.snapshot.episodeUniqueKey"
  * element.short = "Episode Unique Key"
  * element.comment = "Indicate the unique key associated with each patient episode record as assigned by the EMR/EHR or your software application."
  * element.type.code = #canonical 
  * element.type.targetProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter"
  * element.mapping[0].identity = "FHIR.Episode-Information.Episode-Unique-Key"
  * element.mapping[0].language = #application/fhir
  * element.mapping[0].map = "iif(Encounter.identifier(type.code='VN').value, Encounter.identifier(type.code='VN').value, Encounter.identifier[0].value)"
  * element.mapping[1].identity = "CDA.Episode-Information.Episode-Unique-Key"
  * element.mapping[1].language = #application/hl7-sda+xml
  * element.mapping[1].map = "/ClinicalDocument/component/section/entry/encounter/id/extension"  
  * element.mapping[2].identity = "V2.Episode-Information.Episode-Unique-Key"
  * element.mapping[2].language = #application/edi-hl7v2
  * element.mapping[2].map = "ADT_A01:PV1.19.1"