Instance: CREDSBundle-Example
InstanceOf: CREDSSubmission
Usage: #example
Title: "CREDS Submission Bundle Example"
Description: "A simple example of the CREDS Submission Bundle"

* entry[mHeader].fullUrl = "urn:uuid:a4bab684-4bc2-43b7-82a0-199034a5a5b2"
* entry[mHeader].resource = CREDSMHExample
* entry[USPatient].fullUrl = "urn:uuid:261989c3-688c-4941-b767-d8d4c871217c"
* entry[USPatient].resource = 261989c3-688c-4941-b767-d8d4c871217c
* entry[2].fullUrl = "urn:uuid:ba651db0-7b10-4465-a5c4-411ced9e8254"
* entry[2].resource = CREDSEncounter

Instance: CREDSMHExample
InstanceOf: MessageHeader
Usage: #example
Title: "MessageHeader for CREDSSubmission Example"
Description: "An example MessageHeader for use within a CREDS Submission Bundle"
* eventUri = "urn:uuid:26aa1208-589a-4978-9cb7-728cc51520aa" 
* sender = Reference(VeterinariansHospital)
* enterer = Reference(USCorePractitionerexample)
* source.name = "CREDS Implementation #2"
* source.endpoint = "https://example.org/fhir"
* reason = http://terminology.hl7.org/CodeSystem/message-reasons-encounter#discharge
* focus = Reference(261989c3-688c-4941-b767-d8d4c871217c)
