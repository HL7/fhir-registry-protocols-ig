
Instance: RSDR-Create/UpdateRegistryDefinition
InstanceOf: CapabilityStatementWithSlices
Usage: #definition
Description: """
Defines the requirements for the Registry Submission Definition Repository implementing the Create / Update Registry Definition transaction."""
* insert SanerDefinitionContent
* name = "RSDR_Create/UpdateRegistryDefinition"
* title = "Registry Submission Definition Repository implementing the Create / Update Registry Definition transaction."
* date = "2021-07-24"
* kind = #requirements
* description = "Defines the requirements for the Registry Submission Definition Repository implementing the Create / Update Registry Definition transaction."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[serverSlice].mode = #server

* rest[serverSlice].resource[StructureDefinitionSlice].type = #StructureDefinition

* rest[serverSlice].resource[StructureDefinitionSlice].interaction[0].code = #create
* rest[serverSlice].resource[StructureDefinitionSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureDefinitionSlice].interaction[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureDefinitionSlice].interaction[1].code = #update
* rest[serverSlice].resource[StructureDefinitionSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureDefinitionSlice].interaction[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureMapSlice].type = #StructureMap

* rest[serverSlice].resource[StructureMapSlice].interaction[0].code = #create
* rest[serverSlice].resource[StructureMapSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureMapSlice].interaction[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureMapSlice].interaction[1].code = #update
* rest[serverSlice].resource[StructureMapSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureMapSlice].interaction[1].extension.valueCode = #SHALL
