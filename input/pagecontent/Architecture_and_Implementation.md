This guide uses structures that define the report in steps from the base profile on StructureDefinition, to the Logical Model that defines the information requirements, to the final StructureDefinition that outlays the individual record and the mappings to the final bundle required.  
#### Major Components

The major design components described by this guide support the following functions:

1. Definition - gives an overall structure and requirements with references to major standards (FHIR, CDA, V2) and the relevant FHIR Profile (such as [USCore Patient](http://hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html) or [International Patient Summary Patient](http://hl7.org/fhir/uv/ips/StructureDefinition-Patient-uv-ips.html)) for final submission.
3. Retrieval - fetching the data from the listed sources or from non-automated locations requiring human intervention
3. Submission creation - Entering patient data in the elements in the FHIR Resources and/or profiles that will comprise the submission Bundle.
5. Submission - use of a base CREDSBundle or other FHIR IGs such as [Making EHR Data More Available for Research and Public Health (MedMorph)](http://hl7.org/fhir/us/medmorph/) for submission of the resulting Bundle.


The first four functions are described in more detail in the sections below.

#### Definition

The **Registry Submission Definition Creator** executes the **Create/Update Registry Definition [CURD]** transaction and uses a tool to create a logical model in the form of a StructureDefinition that references the data needed, the possible locations in FHIR, CDA or other locations, including manual input, and the local profile necessary to store the infomation for submission.

The overall StructureDefinition will have each datapoint as an element definition with mappings to the data locaitons and the resource or profile for storage within the submission Bundle.

THis information is given to the **Registry Submission Definition Repository** for storage and distribution.


#### Retrieval

<figure>{%include workflow.svg %}
<figcaption>Workflow for Retrival and Submission</figcaption>
</figure>

The **Registry Submitter** uses the **Search/Retrieve Registry Definition [SRRD]** transaction to find and retrieve the appropraite definition from the Repository,

Once the defintion has been ingested, the Registry Submitter or the **Registry Submission Data Source** fetches the required data (the **Retrieve Registry Submission Data [RRSD]** transaction) from those locations in the mappings within the StructureDefinition logical model or from appropriate locations within the EHR or other relevant system.

#### Submission Creation

The Registry Submitter executes the **Create / Update Registry Submission [CURS]** transaction, placing the data in the relevant resources/profiles and assembling the [CREDSSubmission](StructureDefinition-CREDSSubmission.html) Bundle or other FHIR IG mandated Bundle for submission.

Alternately, the **Registry Submission Consumer** may work with individual datapoints in the Regitry Definition and assemble the Submission itself, rather than relying on an external actor.

The actor then **Validate Registry Submission [VRS]** through automatic and/or manual process as defined by organization policy to ensure completeness and correctness.

#### Submission 

This may fall outside of this IG, if using MedMorph or another IG for submission requirements.

If not, then submission may use the following structure:
```
POST https://www.acc.org/fhir/Bundle?_format=application/fhir+xml HTTP/1.1
Host:example.org
<Bundle xmlns="http://hl7.org/fhir">
<!--CREDSSubmission metadata here, type MUST be collection -->
<!--First entry is MessageHeader with Submitter Information -->
<!--Second entry is Patient Resource -->
<!--Other entries with clinical data -->
</Bundle>
```

Submission responses may return only an http success code or may return a OperationOutcome resource depending on the needs of the submitter and registry and/or the requirements of the FHIR IG used for submission.

Submissions can be done on-demand by event-driving immediate submission or via a periodic submission.   Periodic (bulk) submissions can be managed by one of three ways:
1. a Bundle of type ```transaction``` comprised of Submission Bundles.  The receiver will accept or reject this Bundle of Bundles in total if one or more of the Submission Bundles is or is not accepted.
2. a Bundle of type ```batch``` comprised of Submission Bundles.  The receiver will only reject individual Submission Bundle entries within the Bundle of Bundles
3. Asynchronous submission of NDJSON files of Submission Bundles.  This would use a modified version of the [Bulk Data](https://hl7.org/fhir/uv/bulkdata/) FHIR IG.  The trigger in this case would be an NDJSON submission file of Submission Bundles instead of a query.

The first two options are suffient for low numbers of Submission Bundles. For larger periodic submissions (hundreds or thousands of submissions), option 3 is optimal. All three can be managed using [Asynchronous FHIR](https://www.hl7.org/fhir/async.html) or via immediate response.

All three will result in OperationOutcome resources, outlining the accepting or rejecting of the individual submissions. Option 1 or 2 would result in a Bundle of transaction-response or batch-response containing the OperationOutcomes, option 3 would create an NDJSON file of the OperationOutcome resources.
