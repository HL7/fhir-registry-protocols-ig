Profile: CREDSStructureDefinition
Parent: StructureDefinition
Id: CREDSStructureDefinition
Title: "CREDS Structure Definition"
Description: "StructureDefinition for use with CREDS mapping creating the base mappings for FHIR, CDA and V2"
* identifier 1..1
/*
* mapping ^slicing.discriminator.type = #pattern
* mapping ^slicing.discriminator.path = "identity"
* mapping ^slicing.rules = #open
* mapping ^slicing.ordered = false
* mapping ^slicing.description = "Slice based on standard via identity"
* mapping 1..*

* mapping contains FHIR 0..1 
    and CDA 0..1
    and V2 0..1
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
*/
* kind = #logical
* abstract = false
* type 1..1 
* snapshot 0..0
* differential 0..0


Profile: CREDSElementDefinition
Parent: ElementDefinition
Id: CREDSElementDefinition
Title: "CREDSElementDefinition"
Description: "ElementDefinition for use within CREDS that sets the base requirements for creating the logical model"
* short 1..1
* comment 1..1
* type ^code = #canonical
* mapping 1..*
* mapping.identity 1..1
* mapping.language 1..1
* mapping.map 1..1

