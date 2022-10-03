Profile: CREDSStructureDefinition
Parent: StructureDefinition
Id: CREDSStructureDefinition
Title: "CREDS Structure Definition"
Description: "StructureDefinition for use with CREDS mapping creating the base mappings for FHIR, CDA and V2"
* insert CREDSStructureDefinitionContent

* identifier 1..1

* date 1..1
* publisher 1..1
* contact 1..*

* kind = #logical
* abstract = false
* type 1..1 
// * snapshot 0..0
* differential 0..0

Profile: CREDSElementDefinition
Parent: ElementDefinition
Id: CREDSElementDefinition
Title: "CREDSElementDefinition"
Description: """ElementDefinition for use within CREDS that sets the base requirements for creating the logical model
Elements specific to a Creds model are:
.short Simple name of the data required
.comment full description of the data element required

Mappings are required for data extraction and inclusion in the submission bundle  Each mapping shows:
.identity as element path (e.g., Patient.Name.Given)
.langauge as the mime type of the language (e.g., application/edi-hl7v2 for V2 message)
.map as the FHIRPath expression for use to find the data required.
.comment = *Output mapping only* Resource/Profile for inclusion in the Submission Bundle.

Element mapping should include an Output mapping unless the mapping is in a parent element in the logical model.
"""
* insert CREDSStructureDefinitionContent

* short 1..1
* comment 1..1
* type ^code = http://hl7.org/fhir/data-types#canonical
* mapping ^slicing.discriminator.type = #pattern
* mapping ^slicing.discriminator.path = "identity"
* mapping ^slicing.rules = #open
* mapping ^slicing.ordered = false
* mapping ^slicing.description = "Slice based on standard via identity"
* mapping 1..*
* mapping contains FHIR 0..*
    and CDA 0..*
    and HL7V2 0..*
    and Output 0..*
* mapping[FHIR].identity 1..1 
* mapping[FHIR].identity = "FHIR"
* mapping[FHIR].language 1..1
* mapping[FHIR].map 1..1
* mapping[FHIR].language = #application/fhir
* mapping[CDA].identity 1..1 
* mapping[CDA].identity = "CDA"
* mapping[CDA].language 1..1
* mapping[CDA].language = #application/hl7-sda+xml
* mapping[CDA].map 1..1
* mapping[HL7V2].identity 1..1 
* mapping[HL7V2].identity = "HL7V2"
* mapping[HL7V2].language 1..1
* mapping[HL7V2].language = #application/edi-hl7v2
* mapping[HL7V2]..map 1..1
* mapping[Output].identity 1..1 
* mapping[Output].identity = "Output"
* mapping[Output].language 1..1
* mapping[Output].language = #application/fhir
* mapping[Output].map 1..1