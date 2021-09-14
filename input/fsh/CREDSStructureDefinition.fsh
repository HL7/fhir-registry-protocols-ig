Profile: CREDSStructureDefinition
Parent: StructureDefinition
Id: CREDSStructureDefinition
Title: "CREDSStructureDefiniStructureDefinitiontion"
Description: "StructureDefinition for use with CREDS mapping"
* identifier 1..1
* mapping ^slicing.discriminator.type = #pattern
* mapping ^slicing.discriminator.path = "identity"
* mapping ^slicing.rules = #open
* mapping ^slicing.ordered = false
* mapping ^slicing.description = "Slice based on standard via identity"
* mapping 1..*
* mapping contains FHIR 0..1 
    and CDA 0..1
    and V2 0..1
* mapping[FHIR].identity = "FHIR" (exactly)
* mapping[FHIR].uri = "http://fhir.hl7.org"  (exactly)
* mapping[FHIR].name = "Fast Health Interoperability Resources"  (exactly)
* mapping[FHIR].comment = "FHIR based mapping is used"  (exactly)
* mapping[CDA].identity = "CDA" (exactly)
* mapping[CDA].uri = "http://build.fhir.org/ig/HL7/cda-core-2.0/" (exactly)
* mapping[CDA].name = "Clinical Document Architecture" (exactly)
* mapping[CDA].comment = "CDA 2.0/CCDA 2.1 based mapping is used" (exactly)
* mapping[V2].identity = "HL7V2" (exactly)
* mapping[V2].uri = "http://www.hl7.eu/refactored/index.html" (exactly)
* mapping[V2].name = "HL7 V2" (exactly)
* mapping[V2].comment = "HL7 V2 based mapping is used" (exactly)

* kind = #complex-type
* abstract = true
* type 1..1 
* snapshot 1..1
* snapshot.element only CREDSElementDefinition
* differential 0..0 // Should we allow this as a PATCH equivalent?

Profile: CREDSElementDefinition
Parent: ElementDefinition
Id: CREDSElementDefinition
Title: "CREDSElementDefiniElementDefinition"
Description: "ElementDefinition for use within CREDS"
* short 1..1
* comment 1..1
* type.code 1..1
* type.code = #canonical (exactly)
* type.targetProfile 1..1
* mapping 1..*
* mapping.identity 1..1
* mapping.language 1..1
* mapping.map 1..1
