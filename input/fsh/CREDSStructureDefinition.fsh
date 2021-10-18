Profile: CREDSStructureDefinition
Parent: StructureDefinition
Id: CREDSStructureDefinition
Title: "CREDS Structure Definition"
Description: "StructureDefinition for use with CREDS mapping"
* identifier 1..1
//* baseDefinition = "http://hl7.org/fhir/StructureDefinition/Base"
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

* kind = #logical
* abstract = false
* type 1..1 
* differential 1..1
/*
Profile: CREDSElementDefinition
Parent: ElementDefinition
Id: CREDSElementDefinition
Title: "CREDSElementDefiniElementDefinition"
Description: "ElementDefinition for use within CREDS"
* short 1..1
* comment 1..1
* type.code 1..1
* type.code = #canonical 
* type.targetProfile 1..1
* mapping 1..*
* mapping.identity 1..1
* mapping.language 1..1
* mapping.map 1..1
*/