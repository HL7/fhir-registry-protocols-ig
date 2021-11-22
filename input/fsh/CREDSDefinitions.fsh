// Define a rule set for commonly used rules for definition resources using other Sushi features
RuleSet: CREDSStructureDefinitionContent
* ^status = #draft      // draft until final published
* ^experimental = true  // true until ready for pilot, then false
* ^version = "0.1.0"    // Follow IG Versioning rules
* ^publisher = "HL7 International"
* ^contact[0].name = "HL7 Clinical Interoperability Council"
* ^contact[0].telecom.system = #url
* ^contact[0].telecom.value = "http://hl7.org/Special/committees/cic/index.cfm"
* ^contact[1].name = "David Pyke"
* ^contact[1].telecom.system = #email
* ^contact[1].telecom.value = "mailto:dpyke@ainq.com"
* ^jurisdiction.coding =  http://unstats.un.org/unsd/methods/m49/m49.htm#001

RuleSet: CREDSCapabilityStatementContent
* status = #draft
* experimental = true
* publisher = "HL7 Clinical Interoperability Council"
* contact[0].name = "HL7 Clinical Interoperability Council"
* contact[0].telecom.system = #web
* contact[0].telecom.value = "http://hl7.org/Special/committees/cic/index.cfm"
* contact[1].name = "David Pyke"
* contact[1].telecom.system = #email
* contact[1].telecom.value = "dpyke@ainq.com"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json
* format[1] = #xml
* implementationGuide = "http://hl7.org/fhir/uv/fhir-registry-protocols-ig/ImplementationGuide/hl7.fhir.uv.fhir-registry-protocols-ig"