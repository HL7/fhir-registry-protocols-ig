/*
    This content is automatically generated from CREDS.xml by actorsandtransactions.xslt
*/

Instance: RSDC-CURD
InstanceOf: CapabilityStatementWithSlices
Usage: #definition
Description: """
Defines the requirements for the Registry Submission Definition Creator implementing the Create / Update Registry Definition transaction."""
* insert CREDSDefinitionContent
* name = "RSDC_CURD"
* title = "Registry Submission Definition Creator implementing the Create / Update Registry Definition transaction."
* date = "2022-01-26"
* kind = #requirements
* description = "Defines the requirements for the Registry Submission Definition Creator implementing the Create / Update Registry Definition transaction."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[clientSlice].mode = #client

* rest[clientSlice].resource[StructureDefinitionSlice].type = #StructureDefinition

* rest[clientSlice].resource[StructureDefinitionSlice].interaction[0].code = #create
* rest[clientSlice].resource[StructureDefinitionSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureDefinitionSlice].interaction[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[StructureDefinitionSlice].interaction[1].code = #update
* rest[clientSlice].resource[StructureDefinitionSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureDefinitionSlice].interaction[1].extension.valueCode = #SHALL

* rest[clientSlice].resource[StructureMapSlice].type = #StructureMap

* rest[clientSlice].resource[StructureMapSlice].interaction[0].code = #create
* rest[clientSlice].resource[StructureMapSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureMapSlice].interaction[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[StructureMapSlice].interaction[1].code = #update
* rest[clientSlice].resource[StructureMapSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureMapSlice].interaction[1].extension.valueCode = #SHALL
