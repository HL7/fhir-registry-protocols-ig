Instance: RegistryUpload
InstanceOf: OperationDefinition
Usage: #definition
Title: "The Registry Upload of NDJSON data"
Description: """When the Registry periodic submission upload would exceed timeout limits or 
is requested as an [NDJSON](https://www.hl7.org/fhir/nd-json.html) file, use of this Upload operation is suggested.
 See the FHIR [Asynchronous API](https://www.hl7.org/fhir/async.html) for more details on asynchronous FHIR exchange.
"""
* name = "RegistryUpload"
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
  application/fhir+ndjson and the data element consisting of a NDJSON file. Each line of the NDJSON file will comprising a 
  single patient Submission Bundle.
  The http POST will have: 
  1. the Prefer header set to respond-async and 
  2. the Accept header set to the application/fhir+ndjson format"""
* parameter[1]
  * name = #output
  * use = #out
  * min = 1
  * max = "1"
  * type = #OperationOutcome
  * documentation = """The optionally attached OperationOutcome will solely be the result of the validation that the submission file is a valid NDJSON file
  and will not have information regarding the content sumbitted.
  The result of a successful submission will be a 202 Accepted with the Content-Location pointing to a polling 
  location of the NDJSON file of OperationOutcomes. 
  Each OperationOutcome in the fetched NDJSON file will give the results of a validation exercise 
  for the individual lines within the submission file.
  """

