Profile: CREDSSubmission
Parent: Bundle
Id: CREDSSubmission
Title: "CREDS Submission Bundle"
Description: "Tis is the standard Bundle to be used with a CREDS submission"
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

