Profile: CREDSSubmission
Parent: Bundle
Id: CREDSSubmission
Title: "CREDS Submission Bundle"
Description: "This is the standard Bundle to be used with a CREDS submission"
* insert CREDSStructureDefinitionContent
* type = #collection (exactly)
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.ordered = true
* entry ^slicing.description = "Slice based on resource"

* entry 2..*
* entry contains mHeader 1..1 MS
  and USPatient 1..1 MS
  
* entry[mHeader].resource only MessageHeader
* entry[USPatient].resource only http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
/*
Instance: StructDef4KEith
InstanceOf: Bundle
Usage: #example
Title: "Just for Keith"
Description: "None"
* type = #transaction
* entry.resource = CathPCI_Submission_Map_detailed
* entry.request.method = #POST
* entry.request.url = "urn:uuid:120679c4-443d-45cd-9d39-1bc431f4fb56"
*/