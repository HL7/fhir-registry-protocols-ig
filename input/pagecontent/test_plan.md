Overall this guide provides an API between multiple [actors](actors.html), and [transaction](transactions.html) types. The tests that can be executed are limited to the functionality of the system-under-test (SUT), and the transaction type it implements. Where that SUT has a specific function, it can be tested.
### Test Plan

The following is the overall test plan for this guide:

1. Unit Tests – automation of testing of the actor alone using a simulator and validator tool
2. Integration Tests – automation of actors interacting through defined communications mechanism
3. Validation Tests – user expectation based testing

Tests below support testing for the following actors:
* Registry Submission Definition Creator: manages the definitional artifacts 
* Registry Submission Definition Repository: holds the definitions for the registry submission 
* Registry Submitter: responsible for submitting data to a clinical registry
* Registry Submission Data Source: makes clinical data available to a registry submitter
* Registry Submission Consumer: accepts and validates registry submissions

### Actor Requirements

#### Registry Submission Definition Creator
The Registry Submission Definition Creator creates abd manages the definitional artifacts (logical model and transforms) supporting a clinical registry

**Registry Submission Definition Creator Preparation**

 * Be able to produce a CREDS Logical Model StructureDefinition resource for the example Registry Data Dictionary as per Create / Update Registry Definition 
 * The Logical Model should conform to the CREDSStructureDefinition as a profile.  
 * THe Logical Model should conform to the registry Data Dictionary
 * The Model should have mappings to at least the FHIR standard and include all Output mappings.
 * If you’re doing the publication scenario, have a client that can do a  fetch of the Logical Model.
 
**Registry Submission Definition Creator Success Criteria**

* For the publication scenario, the StructureDefinition based on the sample data dictionary is created at a Registry Submission Definition Repository system

#### Registry Submission Definition Repository

**Registry Submission Definition Repository Preparation**
 * Be able to search for a CREDS Logical Model StructureDefinition resource from the Registry Submission Definition Creator RESTful endpoint as per Search / Retrieve Registry Definition 
 * Be able to fetch the discovered resource and store it locally. 

 **Registry Submission Definition Repository Success Criteria**
* The example CREDS StructureDefinition is found in a list of available resources
* The example CREDS StructureDefinition is retrieved and made available to the Registry Sumbitter

#### Registry Submitter

**Registry Submitter Preparation**

* Be able to fetch the CREDS Logical Model StructureDefinition resource from the Registry Submission Definition Repository
* Be able to decode the Logical Model and  FHIRPath mapping definitions
* Retrieve the appropriate data as listed in the FHIRPath mapping definitions from the Registry Submission Data Source(s)
* Provide a manual interface or process for data points without a source standard
* Create the Submission Bundle as defined in the CREDS Logical Model StructureDefinition and populated it as defined in the Output mappings
* Push the completed Bundle to the Registry Submission Consumer

 **Registry Submitter Success Criteria**
* The data model is retrieved from the repository
* Data is mapped from the model to data sources
* Data is successfully retrieved from the Registry Submission Data Source(s)
* The submission Bundle is created and populated correctly accorind to the data model
* The submission Bundle is pushed to the Registry Submission Consumer and validates correctly using a FHIR-based transaction using [MEDMORPH](http://hl7.org/fhir/us/medmorph/) or similar FHIR Implementation Guides

#### Registry Submission Consumer

**Registry Submission Consumer Preparation**
* A RESTful endpoint exists to accept the submission Bundle
* Be able to fetch the CREDS Logical Model StructureDefinition resource from the Registry Submission Definition Repository or Registry Submission Definition Creator
* Be able to read and parse the CREDS Logical Model StructureDefinition Output section
* Be able to validate a submission Bundle against the CREDS Logical Model StructureDefinition Output section

### Integration Test Scenarios

The following integration test scenarios included in this test plan:
1. Logical Model/StructureDefinition creation
1. Retrieval of the StructureDefinition
1. Parsing of the Logical Model mappings
1. Data retrieval
1. Submission Bundle creation
1. Submission Bundle submission

#### Logical Model/StructureDefinition Creation

##### Preconditions
* The Registry has a defined Data Dictionary for data used within the registry
* The Registry fully supports the CREDSStructureDefinition profile
* Each element in the Data Dictionary has been mapped to a relevant profile both on input and output
* The Registry has a RESTful enpoint that enables search and retrieval of the CREDSStructureDefinition Logical Models

##### Test Steps
1. Using a manual or tooled process, the data dictionary mappings are transferred to a CREDSStructureDefinition profile creating the Logical Model of all data points needed for registry ingestion
2. The Logical Model is validated to have all elements including source standard mappings (where possible) and Output resource or profile element mappings inlcuding full path to any referenced FHIR Profiles

* A fully complete Logical Model is created with both input and output mappings
* The Logical Model validates as a FHIR CREDSStructureDefinition profile
* The FHIR endpoint responds successfully to a search query
* The FHIR endpoint responds successfully to a retrieve request  

#### Retrieval of the StructureDefinition

##### Preconditions
* The Registry has implemented the Registry Submission Definition Creator or Registry Submission Definition Repository actor
* The Logical Model/StructureDefinition is available for search and retrieval
* The Registry Submission Definition Repository or Registry Submitter have knowedge of the model to be retrieved (identifier, name, etc.)

##### Test Steps
1. Using a FHIR query, the actor queries for available logical models, e.g., :
```GET https://www.acc.org/fhir/StructureDefinition?kind=logical&_profile=CREDSStructureDefinition```
2. Using a manual or automated process, the actor requests the appropriate logical model from those listed in the search results Bundle e.g.,:
```GET https://www.acc.org/fhir/StructureDefinition/CathPCI?_format=application/fhir+xml```
   * Note: the _format can be either fhir+xml, fhir+json or unspecified depending on preference of the actor


##### Success Criteria
* The actor has the list of available logical models in a searchset Bundle as a response to Test Step 1. 
* The actor has a validated StructureDefinition of the Logical model of the Registry data dictionary

#### Parsing of the Logical Model mappings

##### Preconditions
* The Registry Submitter has a valid CREDS StructureDefinition of the Logical model of the Registry data dictionary

##### Test Steps
1. The Submitter validates that all the logical model mappings have FHIRPath map elements for each Logical model data dictionary elements for the expected Source Standard where such mappings exist
1. Each FHIRPath validates as a correct statement for each of the desired Source Standard documents
1. The Submitter validates that all Logical model data dictionary elements have an Output mapping with the required information and FHIRPath map elements
1. The Submitter validates that all the FHIRPath statements are able to be converted to a FHIR query

##### Success Criteria
* All data dictionary elements validate with complete and valid information in each of the mappings
* All data dictionary elements have correct and valid Output mappings
* All FHIRPath mappings are convertable to a FHIR query

#### Data retrieval

##### Preconditions
* The Registry Submitter has a valid Logical Model and is able to correctly parse it
* A method to input the manually created data (i.e., data not mapped to a standard) has been created or emulated

##### Test Steps
1. Determine the Registry Submission Data Source for each element, including those that will require manual input
2. Identify the data dictionary mappings for each Source Standard and their relationship to FHIR, CDA and/or V2 sources available
2. Have unmapped data entered as appropriate
3. De-duplicate the mapping sources so that no FHIR resource/CDA document/V2 message is queried more than once
3. Construct FHIR queries necessary to retrieve the relevant FHIR resources/CDA documents/V2 messages
4. Execute the queries from the previous step

##### Success Criteria
* All relevant FHIR resources/CDA documents/V2 messages have been retrieved


#### Submission Bundle creation

##### Preconditions
* The Registry Submitter has successfully retrieved all necessary data
* All Output mappings are valid and needed Profiles are supported (e.g., US Core, other FHIR IG Profiles)

##### Test Steps
* Transfer data from the retreived resources/documents/messages according to the Source Standards mapping and Output mapping requirements.
* Create a MessageHeader resource with all relevant submitter information
* Ensure the Patient resource exists and is based on the US Core Patient Profile
* Assemble a Bundle that conforms to the CREDSSubmission Bundle profile
* Validate the Bundle and all entries

##### Success Criteria
* A fully validated CREDSSubmission Bundle exists