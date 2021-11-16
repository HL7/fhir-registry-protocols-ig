Profile: CREDSStructureDefinition
Parent: StructureDefinition
Id: CREDSStructureDefinition
Title: "CREDS Structure Definition"
Description: "StructureDefinition for use with CREDS mapping creating the base mappings for FHIR, CDA and V2"
* identifier 1..1


* kind = #logical
* abstract = false
* type 1..1 
* snapshot 0..0
* differential 0..0

Invariant:  MappingComment
Description: "Output mappings must have a comment"
Expression: "iff(mapping.identity.value = 'Output', mapping.comment.exists)"
Severity:   #error

Profile: CREDSElementDefinition
Parent: ElementDefinition
Id: CREDSElementDefinition
Title: "CREDSElementDefinition"
Description: """ElementDefinition for use within CREDS that sets the base requirements for creating the logical model
Elements specific to a Creds model are:
.short Simple name of the data required
.comment full description of the data element required
.requirements is used to hold the Resource/Profile to be used within the submission bundle

Mappings are required for data extraction and inclusion in the submission bundle  Each mapping shows:
.identity as element path (e.g., Patient.Name.Given)
.langauge as the mime type of the language (e.g., application/edi-hl7v2 for V2 message)
.map as the FHIRPath expression for use to find the data required.
.comment = *Output mapping only* Resource/Profile for inclusion in the Submission Bundle
"""
* obeys MappingComment
* short 1..1
* comment 1..1
* requirements 1..1
* type ^code = #canonical
* mapping ^slicing.discriminator.type = #pattern
* mapping ^slicing.discriminator.path = "identity"
* mapping ^slicing.rules = #open
* mapping ^slicing.ordered = false
* mapping ^slicing.description = "Slice based on standard via identity"
* mapping 1..4

* mapping contains FHIR 0..1 
    and CDA 0..1
    and HL7V2 0..1
    and Output 1..1

* mapping.identity 1..1 
* mapping.language 1..1
* mapping.map 1..1

// iff(mapping.identity.value = 'Output', mapping.comment.exists)

