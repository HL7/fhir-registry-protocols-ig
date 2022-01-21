### Introduction
This guide profiles how a registry says what needs to be sent, and how a healthcare provider organization can use that to automate the collection and formatting the data into a submission, conforming to registry or FHIR implementation guide defined profiles and protocols.
This guide describes the steps to:
* Define the data needed in a registry submission, relying on existing FHIR resources, profiles, and implementation guides
* Describe how this data can be collected and organized through FHIR APIs
* Transform the collected data into content suitable for a registry submission
* Use applicable FHIR operations defined in existing FHIR Implementation Guides to submit the content
* Coordinate with other systems to validate and refine registry submissions, as necessary.

The goal of this Implementation Guide is to advance the health IT ecosystem through the accelerated adoption of modern standards in the acquisition of clinical data for registry submission as well as the subsequent use of clinical data to improve care decisions.  Each definition of the needed data is done via a FHIR-defined Logical model that gives information on where the data may be located and what FHIR resource will be the repository for that data inside a submission Bundle resource.

 Protocols for Clinical Registry Extraction and Data Submission addresses the need to provide a common way to describe data collection and submission requirements for disease registries that enables a disease registry to:
1. Describe the data they wish to collect.
2. Define the constraints on the submission to indicate how data should be submitted.
3. Identifying the trigger events that might indicate a submission is needed.

And a healthcare provider organization to:
1. Identify sources of data that might appear within a disease registry submission.
2. Support processes to automatically extract data from information systems.
3. Support processes to transform extracted data into appropriate formats for a registry submission.

### Journey Map of Registry Process
The Journey from a patient discharge to data being merged into the Registry is complex.  There are several important steps and related challenges presented to create the final report and ingest it.  At each stage, challenges exist that increase the possibility of errors.

<div  style="float:left; margin: 10px;">
{%include journeymap.svg %}
</div>
Each record starts with the patient discharge event.  This creates the record and begins the review process for the data needed for submission.  The Demographics are collected as part of the Worklist addition process

Once the worklist item is opened for data collection the Registry Documenter collects Procedure information and begins the process of determining data elements and sources needed for completing the submission record.

Each data source, including manual sources, is reviewed and entered into the submission record.  This data may be collected through the EHR system, an EMS system or legacy systems which may or may not be connected to the EHR.  Unconnected systems may require transcription into the registry submission record.
Consultation with the Treatment team may be required to interpret or collect data that may not be part of the data entered during the treatment interval.
Once complete, the data is packaged and added to the submission queue for immediate or periodic submission to the registry.

Upon receipt, the Registry Data Validator conducts a review to ensure that required information is included and that all information is coded and formatted as necessary for ingestion.  A report is generated with the outcomes of that review.  In case of partial data, the record may be held until an updated record is received.

Finally, the data is ingested into the registry for analysis

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

__Treatment Team__
Profile: 
* Medically trained
* Clinically focused
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