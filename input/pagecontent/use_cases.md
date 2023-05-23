The following use cases were used to identify the requirements addressed by this guide:
* [Define Submission](#define-submission)
* [Search and Read Submission Definition](#search-and-read-submission-definition)
* [Get or Refresh Patient Data](#get-or-refresh-patient-data)
* [Get Patient List](#get-patient-list)

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
  - [Create / Update Registry Definition](transaction-CURD.html)
* Content
  - [Registry Logical Model](StructureDefinition-CREDSStructureDefinition.html)
#### Define Submission Process Flow 

<figure>
{% include usecase-DefineSubmission-processflow.svg%}
<figcaption>Figure 2.3.1.1-1: Define Submission Process Flow </figcaption>
</figure>
1. Create submission definition artifacts.
   The Registry Authority creates the definition and submits it to a repository for distribution to registry
submitters.

   
1. Update submission definition artifacts.
   A previously submitted definition artifact is updated to add data submission requirements.

   
1. Create submission definition transformation.
   The Registry Authority creates a transformation and submits it to a repository for distribution to registry
submitters.

   
1. Update submission definition transformation.
   The Registry Authority updates a transformation and submits it to a repository for distribution to registry
submitters.

   
### Search and Read Submission Definition
A registry submitter reads the logical data model and transformations.

This use case is supported by the following
* Actors
  - [Registry Submission Definition Repository](actors.html#registry-submission-definition-repository)
  - [Registry Submitter](actors.html#registry-submitter)
#### Search and Read Submission Definition Process Flow 

<figure>
{% include usecase-ReadSubmission-processflow.svg%}
<figcaption>Figure 2.3.1.2-1: Search and Read Submission Definition Process Flow </figcaption>
</figure>
1. Search submission definition artifacts.
   The Registry Submitter searches for registry submission definitions and transforms contained in a repository

   
1. Read submission definition artifacts.
   The Registry Submitter reads the registry submission definitions and transforms contained in a repository
necessary for creating a submission.

   
### Get or Refresh Patient Data
Collect new or refresh existing patient data from data sources.

This use case is supported by the following
* Actors
  - [Registry Submitter](actors.html#registry-submitter)
  - [Registry Submission Data Source](actors.html#registry-submission-data-source)
* Transactions
  - [Retrieve Registry Submission Data](transaction-RRSD.html)
#### Get or Refresh Patient Data Process Flow 
<figure>
{% include usecase-GetOrRefreshPatientData-processflow.svg%}
<figcaption>Figure 2.3.1.3-1: Get or Refresh Patient Data Process Flow </figcaption>
</figure>
1. Identify data sources to query for new, missing or stale data
   
1. Retrieve data from selected data sources
   
1. Extract essential data for submission from the selected data sources
   
1. Store essential data for later submission.
   
### Get Patient List
A registry submitter retrieves the list of patients for whom a submission must be created.

This use case is supported by the following
* Actors
  - [Registry Submission Definition Creator](actors.html#registry-submission-definition-creator)
  - [Registry Submitter](actors.html#registry-submitter)
  - [Registry Submission Data Source](actors.html#registry-submission-data-source)
* Transactions
  - [Retrieve Registry Submission Data](transaction-RRSD.html)
#### Get Patient List Process Flow 
The registry submitter identifies patients for whom a submission is necessary.

<figure>
{% include usecase-GetPatientList-processflow.svg%}
<figcaption>Figure 2.3.1.4-1: Get Patient List Process Flow </figcaption>
</figure>
