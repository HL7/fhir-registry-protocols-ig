/*
    This content is automatically generated from CREDS.xml by actorsandtransactions.xslt
*/

Instance: RS
InstanceOf: CapabilityStatementWithSlices
Usage: #definition
Description: """
Defines the requirements for the Registry Submitter."""
* insert CREDSDefinitionContent
* name = "RS"
* title = "Registry Submitter."
* date = "2022-01-20"
* kind = #requirements
* description = "Defines the requirements for the Registry Submitter."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[clientSlice].mode = #client

* rest[clientSlice].resource[StructureDefinitionSlice].type = #StructureDefinition

* rest[clientSlice].resource[StructureDefinitionSlice].interaction[0].code = #read
* rest[clientSlice].resource[StructureDefinitionSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureDefinitionSlice].interaction[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[StructureDefinitionSlice].interaction[1].code = #search-type
* rest[clientSlice].resource[StructureDefinitionSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureDefinitionSlice].interaction[1].extension.valueCode = #SHALL

* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[0].name = "_id"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[0].type = #token
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[1].name = "url"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[1].type = #string
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[1].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[2].name = "name"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[2].type = #string
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[2].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[3].name = "identifier"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[3].type = #token
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[3].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[3].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[4].name = "publisher"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[4].type = #string
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[4].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[4].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[5].name = "context"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[5].type = #token
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[5].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[5].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[6].name = "status"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[6].type = #token
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[6].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[6].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[7].name = "_lastUpdated"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[7].type = #date
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[7].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[7].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[8].name = "date"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[8].type = #date
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[8].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[8].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[9].name = "_text"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[9].type = #string
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[9].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[9].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[10].name = "_content"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[10].type = #string
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[10].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureDefinitionSlice].searchParam[10].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureDefinitionSlice].searchInclude[0] = "*"
* rest[clientSlice].resource[StructureDefinitionSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureDefinitionSlice].searchInclude[0].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureMapSlice].type = #StructureMap

* rest[clientSlice].resource[StructureMapSlice].interaction[0].code = #read
* rest[clientSlice].resource[StructureMapSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureMapSlice].interaction[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[StructureMapSlice].interaction[1].code = #search-type
* rest[clientSlice].resource[StructureMapSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureMapSlice].interaction[1].extension.valueCode = #SHALL

* rest[clientSlice].resource[StructureMapSlice].searchParam[0].name = "_id"
* rest[clientSlice].resource[StructureMapSlice].searchParam[0].type = #token
* rest[clientSlice].resource[StructureMapSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureMapSlice].searchParam[0].extension.valueCode = #SHALL

* rest[clientSlice].resource[StructureMapSlice].searchParam[1].name = "url"
* rest[clientSlice].resource[StructureMapSlice].searchParam[1].type = #string
* rest[clientSlice].resource[StructureMapSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureMapSlice].searchParam[1].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureMapSlice].searchParam[2].name = "name"
* rest[clientSlice].resource[StructureMapSlice].searchParam[2].type = #string
* rest[clientSlice].resource[StructureMapSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureMapSlice].searchParam[2].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureMapSlice].searchParam[3].name = "identifier"
* rest[clientSlice].resource[StructureMapSlice].searchParam[3].type = #token
* rest[clientSlice].resource[StructureMapSlice].searchParam[3].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureMapSlice].searchParam[3].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureMapSlice].searchParam[4].name = "publisher"
* rest[clientSlice].resource[StructureMapSlice].searchParam[4].type = #string
* rest[clientSlice].resource[StructureMapSlice].searchParam[4].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureMapSlice].searchParam[4].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureMapSlice].searchParam[5].name = "context"
* rest[clientSlice].resource[StructureMapSlice].searchParam[5].type = #token
* rest[clientSlice].resource[StructureMapSlice].searchParam[5].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureMapSlice].searchParam[5].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureMapSlice].searchParam[6].name = "status"
* rest[clientSlice].resource[StructureMapSlice].searchParam[6].type = #token
* rest[clientSlice].resource[StructureMapSlice].searchParam[6].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureMapSlice].searchParam[6].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureMapSlice].searchParam[7].name = "_lastUpdated"
* rest[clientSlice].resource[StructureMapSlice].searchParam[7].type = #date
* rest[clientSlice].resource[StructureMapSlice].searchParam[7].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureMapSlice].searchParam[7].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureMapSlice].searchParam[8].name = "date"
* rest[clientSlice].resource[StructureMapSlice].searchParam[8].type = #date
* rest[clientSlice].resource[StructureMapSlice].searchParam[8].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureMapSlice].searchParam[8].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureMapSlice].searchParam[9].name = "_text"
* rest[clientSlice].resource[StructureMapSlice].searchParam[9].type = #string
* rest[clientSlice].resource[StructureMapSlice].searchParam[9].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureMapSlice].searchParam[9].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureMapSlice].searchParam[10].name = "_content"
* rest[clientSlice].resource[StructureMapSlice].searchParam[10].type = #string
* rest[clientSlice].resource[StructureMapSlice].searchParam[10].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureMapSlice].searchParam[10].extension.valueCode = #MAY

* rest[clientSlice].resource[StructureMapSlice].searchInclude[0] = "*"
* rest[clientSlice].resource[StructureMapSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[clientSlice].resource[StructureMapSlice].searchInclude[0].extension.valueCode = #MAY
