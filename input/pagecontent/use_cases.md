The following use cases were used to identify the requirements addressed by this guide:

* [Define Submission](#define-submission)
* [Search and Read Submission Definition](#search-and-read-submission-definition)
* [Get or Refresh Patient Data](#get-or-refresh-patient-data)
* [Get PatientList](#get-patientlist)
* [Get Work Queue](#get-work-queue)
* [Get missing, or request clarification on existing patient data](#get-missing,-or-request-clarification-on-existing-patient-data)


These are described in more detail in the sections that follow.


### Define Submission

The registry authority defines the logical data model which describes the data to be submitted to the registry,
and the transforms
which format data stored using that model to the appropriate submission format.



This use case is supported by the following

* Actors

  - [Registry Submission Definition Creator](actors.html#registry-submission-definition-creator)

  - [Registry Submission Definition Repository](actors.html#registry-submission-definition-repository)

* Transactions

  - [Create / Update Registry Definition](transaction-1.html)

* Content

  - [](StructureDefinition-creds-.html)

#### Define Submission Process Flow 


<div>{% include usecase-DefineSubmission-processflow.svg%}

**Figure 2.3.1.1-1: Define Submission Process Flow**

</div>
1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="DefineSubmission-1">Create submission definition artifacts.</html:span>

   The Registry Authority creates the definition and submits it to a repository for distribution to registry
submitters.


   

1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="DefineSubmission-2">Update submission definition artifacts.</html:span>

   A previously submitted definition artifact is updated to add data submission requirements.


   

1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="DefineSubmission-3">Create submission definition artifacts.</html:span>

   The Registry Authority creates a transformation and submits it to a repository for distribution to registry
submitters.


   

1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="DefineSubmission-4">Update submission definition artifacts.</html:span>

   The Registry Authority updates a transformation and submits it to a repository for distribution to registry
submitters.


   

### Search and Read Submission Definition

A registry submitter reads the logical data model and transformations .


This use case is supported by the following

* Actors

  - [Registry Submission Definition Repository](actors.html#registry-submission-definition-repository)

  - [Registry Submitter](actors.html#registry-submitter)

#### Search and Read Submission Definition Process Flow 


<div>{% include usecase-ReadSubmission-processflow.svg%}

**Figure 2.3.1.2-1: Search and Read Submission Definition Process Flow**

</div>
1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="ReadSubmission-1">Read submission definition artifacts.</html:span>

   The Registry Submitter searches for registry submission definitions and transforms contained in a repository



   

1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="ReadSubmission-2">Read submission definition artifacts.</html:span>

   The Registry Submitter read the registry submission definitions and transforms contained in a repository
necessary
for creating a submission.



   

### Get or Refresh Patient Data

Collect new or refresh existing patient data from data sources.


This use case is supported by the following

* Actors

  - [Registry Submitter](actors.html#registry-submitter)

  - [Registry Submission Data Source](actors.html#registry-submission-data-source)

* Transactions

  - [Retrieve Registry Submission Data](transaction-1.html)

#### Get or Refresh Patient Data Process Flow 
<div>{% include usecase-GetOrRefreshPatientData-processflow.svg%}

**Figure 2.3.1.3-1: Get or Refresh Patient Data Process Flow**

</div>
1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="GetOrRefreshPatientData-1">Identify data sources to query for new, missing or stale data</html:span>

   

1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="GetOrRefreshPatientData-2">Retrieve data from selected data sources</html:span>

   

1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="GetOrRefreshPatientData-3">Extract essential data for submission from the selected data sources</html:span>

   

1. <html:span xmlns:html="http://www.w3.org/1999/xhtml" id="GetOrRefreshPatientData-4">Store essential data for later submission.</html:span>

   

### Get PatientList

A registry submitter retrieves the list of patients for whom a submission must be created.


This use case is supported by the following

* Actors

  - [Registry Submission Definition Creator](actors.html#registry-submission-definition-creator)

  - [Registry Submitter](actors.html#registry-submitter)

  - [Registry Submission Data Source](actors.html#registry-submission-data-source)

* Transactions

  - [Retrieve Registry Submission Data](transaction-1.html)

#### Get PatientList Process Flow 

The registry submitter identifies patients for who a submission is necessary from a data source.
[Need to determine how triggers for this are determined](#tbd)


<div>{% include usecase-GetPatientList-processflow.svg%}

**Figure 2.3.1.4-1: Get PatientList Process Flow**

</div>
### Get Work Queue

A registry submitter reads reads the work queue for submissions to be created.


This use case is supported by the following

* Actors

  - [Registry Submitter](actors.html#registry-submitter)

#### Get Work Queue Process Flow 

[This is likely needed by the Registry Submitter, but may be internal and not part of this profile](#tbd)

<div>{% include usecase-GetWorkQueue-processflow.svg%}

**Figure 2.3.1.5-1: Get Work Queue Process Flow**

</div>
### Get missing, or request clarification on existing patient data

A registry submitter requests missing information or clarification of existing information.


This use case is supported by the following

* Actors

  - [Registry Submitter](actors.html#registry-submitter)

  - [Registry Submission Data Source](actors.html#registry-submission-data-source)

#### Get missing, or request clarification on existing patient data Process Flow 

[This is likely an optional transaction using CommunicationRequest and Communication to a Data Source that does not
exist yet](#tbd)

<div>{% include usecase-RequestMissingOrClarifyExistingData-processflow.svg%}

**Figure 2.3.1.6-1: Get missing, or request clarification on existing patient data Process Flow**

</div>