Instance: registryUpload
InstanceOf: OperationDefinition
Usage: #example
Title: "The Registry Upload of NDJSON data"
Description: "When the Registry periodic submission upload would exceed timeout limits or is requested as an [NDJSON](https://www.hl7.org/fhir/nd-json.html) file, use of this Bulk Upload operation is suggested"
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
  * documentation = """The POST will be Binary resource consisting of the contentType element listing the mime type of
  application/fhir+ndjson and the data element consisting of a NDJOSN file with each line comprising a 
  single patient Submission Bundle
  The POST will have the Prefer header set to respond-async and the Accept header set to the 
  application/fhir+ndjson format"""
* parameter[1]
  * name = #output
  * use = #out
  * min = 1
  * max = "1"
  * type = #OperationOutcome
  * documentation = """The result of a successful submission will be a 202 Accepted with the Content-Location pointing to a polling 
  location of the NDJOS file of OperationOutcomes that gives the results of a validation exercise 
  for the individual lines within the submission file.
  The attached OperationOutcome will solely be the result of the validation that the submission file is a valid NDJON file
  and will not have information regarding the content sumbitted."""

