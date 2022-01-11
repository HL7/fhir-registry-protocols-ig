Instance: RegistryUpload
InstanceOf: OperationDefinition
Usage: #example
Title: "The Registry Upload of NDJSON data"
Description: "When the Registry periodic submission upload would exceed timeout limits or is requested as an NDJSON file, use of this Bulk Upload operation is suggested"
* name = "registryUpload"
* status = #active
* kind = http://hl7.org/fhir/operation-kind#operation
* code = #registryUpload
* resource = #Binary
* system = true
* type = false
* instance = false 
* parameter[0]
  * name = #input
  * use = #in
  * min = 1
  * max = "1"
  * type = #Binary
* parameter[1]
  * name = #output
  * use = #out
  * min = 1
  * max = "1"
  * type = #OperationOutcome

