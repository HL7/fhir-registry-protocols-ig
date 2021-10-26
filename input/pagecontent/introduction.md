### Introduction
This guide profiles how a registry says what needs to be sent, and how a healthcare provider organization can use that to automate the collection and formatting the data into a submission, conforming to registry or FHIR implementation guide defined profiles and protocols.
This guide describes the steps to:
* Define the data needed in a registry submission, relying on existing FHIR resources, profiles, and implementation guides
* Describe how this data can be collected and organized through FHIR APIs
* Transform the collected data into content suitable for a registry submission
* Use applicable FHIR operations defined in existing FHIR Implementation Guides to submit the content
* Coordinate with other systems to validate and refine registry submissions, as necessary.

The goal of this Implementation Guide is to advance the health IT ecosystem through the accelerated adoption of modern standards in the acquisition of clinical data for registry submission as well as the subsequent use of clinical data to improve care decisions

 Protocols for Clinical Registry Extraction and Data Submission addresses the need to provide a common way to describe data collection and submission requirements for disease registries that enables a disease registry to:
1. Describe the data they wish to collect.
2. Define the constraints on the submission to indicate how data should be submitted.
3. Identifying the trigger events that might indicate a submission is needed.

And a healthcare provider organization to:
1. Identify sources of data that might appear within a disease registry submission.
2. Support processes to automatically extract data from information systems.
3. Support processes to transform extracted data into appropriate formats for a registry submission.

### Journey Map of Registry Process
The Journey from a patient discharge to data being merged into the Registry is complex.  There are several important steps and related challenges presented to create the final report and ingest it.

#### Actors
__Registry Documenter__
Profile: 
* Not medically trained
* Medical terminology
* On-the-job awareness
^
* At beginning of encounter, I gather patient information to support consult and procedure.
* After an encounter is closed, I create a ‘report’ to send to the registry, I need to find the data
* I wish all the data was readily available, so I didn’t have to search all over the place 

__Cath Team__
Profile: 
* Medically trained
* Clinically focused
* Specialty medicine
^
* I enter clinical data associated with a specialty encounter
* I may not be aware of my impact on downstream data quality

__Registry Data Validator__
Profile: 
* HealthIT orientation: interoperability
* Data quality compliance against expected standards
* Reporting and Analytics
^
* I validate data received from reporting health centers in order to perform data analysis

{%include journeymap.svg %}

### Challenges
#### Data Collection

* If data exists in the EHR, retrieval can be relatively easy: extract data from EHR records and populate report
* Documenter may be unclear on meaning of clinical data
* Documenter may not know how/where to locate data.
* Complexity of encounter and past patient history
* Event dates 
* Data sleuthing: delays, quality concerns

#### Quality Control 
* How to reduce quality deviation earlier in the process?
* Vendor adoption and business models can complicate data representation
