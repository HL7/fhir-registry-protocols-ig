
Instance: RSDR-SRRD
InstanceOf: CapabilityStatementWithSlices
Usage: #definition
Description: """
Defines the requirements for the Registry Submission Definition Repository implementing the Search / Retrieve Registry Definition transaction."""
* insert CREDSDefinitionContent
* name = "RSDR_SRRD"
* title = "Registry Submission Definition Repository implementing the Search / Retrieve Registry Definition transaction."
* date = "2021-07-27"
* kind = #requirements
* description = "Defines the requirements for the Registry Submission Definition Repository implementing the Search / Retrieve Registry Definition transaction."
* format[0] = #xml
* format[1] = #json
* fhirVersion = #4.0.1

* rest[serverSlice].mode = #server

* rest[serverSlice].resource[StructureDefinitionSlice].type = #StructureDefinition

* rest[serverSlice].resource[StructureDefinitionSlice].interaction[0].code = #read
* rest[serverSlice].resource[StructureDefinitionSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureDefinitionSlice].interaction[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureDefinitionSlice].interaction[1].code = #search-type
* rest[serverSlice].resource[StructureDefinitionSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureDefinitionSlice].interaction[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[0].name = "_id"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[0].type = #token
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[1].name = "url"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[1].type = #string
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[2].name = "name"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[2].type = #string
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[2].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[3].name = "identifier"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[3].type = #token
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[3].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[3].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[4].name = "publisher"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[4].type = #string
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[4].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[4].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[5].name = "context"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[5].type = #token
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[5].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[5].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[6].name = "status"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[6].type = #token
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[6].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[6].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[7].name = "_lastUpdated"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[7].type = #date
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[7].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[7].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[8].name = "date"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[8].type = #date
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[8].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[8].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[9].name = "_text"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[9].type = #string
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[9].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[9].extension.valueCode = #SHOULD

* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[10].name = "_content"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[10].type = #string
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[10].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureDefinitionSlice].searchParam[10].extension.valueCode = #SHOULD

* rest[serverSlice].resource[StructureDefinitionSlice].searchInclude[0] = "*"
* rest[serverSlice].resource[StructureDefinitionSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureDefinitionSlice].searchInclude[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureMapSlice].type = #StructureMap

* rest[serverSlice].resource[StructureMapSlice].interaction[0].code = #read
* rest[serverSlice].resource[StructureMapSlice].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureMapSlice].interaction[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureMapSlice].interaction[1].code = #search-type
* rest[serverSlice].resource[StructureMapSlice].interaction[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureMapSlice].interaction[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureMapSlice].searchParam[0].name = "_id"
* rest[serverSlice].resource[StructureMapSlice].searchParam[0].type = #token
* rest[serverSlice].resource[StructureMapSlice].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureMapSlice].searchParam[0].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureMapSlice].searchParam[1].name = "url"
* rest[serverSlice].resource[StructureMapSlice].searchParam[1].type = #string
* rest[serverSlice].resource[StructureMapSlice].searchParam[1].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureMapSlice].searchParam[1].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureMapSlice].searchParam[2].name = "name"
* rest[serverSlice].resource[StructureMapSlice].searchParam[2].type = #string
* rest[serverSlice].resource[StructureMapSlice].searchParam[2].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureMapSlice].searchParam[2].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureMapSlice].searchParam[3].name = "identifier"
* rest[serverSlice].resource[StructureMapSlice].searchParam[3].type = #token
* rest[serverSlice].resource[StructureMapSlice].searchParam[3].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureMapSlice].searchParam[3].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureMapSlice].searchParam[4].name = "publisher"
* rest[serverSlice].resource[StructureMapSlice].searchParam[4].type = #string
* rest[serverSlice].resource[StructureMapSlice].searchParam[4].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureMapSlice].searchParam[4].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureMapSlice].searchParam[5].name = "context"
* rest[serverSlice].resource[StructureMapSlice].searchParam[5].type = #token
* rest[serverSlice].resource[StructureMapSlice].searchParam[5].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureMapSlice].searchParam[5].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureMapSlice].searchParam[6].name = "status"
* rest[serverSlice].resource[StructureMapSlice].searchParam[6].type = #token
* rest[serverSlice].resource[StructureMapSlice].searchParam[6].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureMapSlice].searchParam[6].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureMapSlice].searchParam[7].name = "_lastUpdated"
* rest[serverSlice].resource[StructureMapSlice].searchParam[7].type = #date
* rest[serverSlice].resource[StructureMapSlice].searchParam[7].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureMapSlice].searchParam[7].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureMapSlice].searchParam[8].name = "date"
* rest[serverSlice].resource[StructureMapSlice].searchParam[8].type = #date
* rest[serverSlice].resource[StructureMapSlice].searchParam[8].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureMapSlice].searchParam[8].extension.valueCode = #SHALL

* rest[serverSlice].resource[StructureMapSlice].searchParam[9].name = "_text"
* rest[serverSlice].resource[StructureMapSlice].searchParam[9].type = #string
* rest[serverSlice].resource[StructureMapSlice].searchParam[9].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureMapSlice].searchParam[9].extension.valueCode = #SHOULD

* rest[serverSlice].resource[StructureMapSlice].searchParam[10].name = "_content"
* rest[serverSlice].resource[StructureMapSlice].searchParam[10].type = #string
* rest[serverSlice].resource[StructureMapSlice].searchParam[10].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureMapSlice].searchParam[10].extension.valueCode = #SHOULD

* rest[serverSlice].resource[StructureMapSlice].searchInclude[0] = "*"
* rest[serverSlice].resource[StructureMapSlice].searchInclude[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest[serverSlice].resource[StructureMapSlice].searchInclude[0].extension.valueCode = #SHALL
