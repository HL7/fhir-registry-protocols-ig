### Scope
Create / Update Registry Definition (CURD)
This section describes the CURD of this guide. This transaction is used by the Registry Submission Definition Creator and Registry Submission Definition Repository actors.


### Actors Roles
<figure>
{% include transaction-CURD-uc.svg%}
<figcaption>Figure 2.2-1: Create / Update Registry Definition Use Case Diagram </figcaption>
</figure>
<table border='1' borderspacing='0'>
<caption><b>Table 2.2-1: Actor Roles</b></caption>
<thead><tr><th>Actor</th><th>Role</th></tr></thead>
<tbody><tr><td><a href="actors.html#registry-submission-definition-creator">Registry Submission Definition Creator</a></td>
<td>Creates or updates registry submission definition resources
</td>
</tr>
        <tr><td><a href="actors.html#registry-submission-definition-repository">Registry Submission Definition Repository</a></td>
<td>Stores registry submission definition resources
</td>
</tr>
        
</tbody>
</table>
### Referenced Standards
<table border='1' borderspacing='0'>
<caption><b>Table 3.71.3-1: Referenced Standards</b></caption>
<thead><tr><th>Standard</th><th>Name</th></tr></thead>
<tbody>
            <tr><td>FHIR-R4</td><td><a href='http://www.hl7.org/FHIR/R4'>HL7 FHIR Release 4</a></td></tr>
        
            <tr><td>RFC-7230</td><td><a href='https://ietf.org/rfc/rfc7230.html'>Hypertext Transfer Protocol - HTTP/1.1</a></td></tr>
        
</tbody>
</table>
### Interactions
        
<figure>
{% include transaction-CURD-seq.svg%}
<figcaption>Figure 2.2-2: Create / Update Registry Definition Interactions </figcaption>
</figure>
#### Create or Update Registry Submission Definition

##### Trigger Event - Create or Update Registry Submission Definition
A Registry Submission Definition Creator requests creation of a new Submission Definition. A logical model or submission transformation created by the Registry Submission Definition Creator is communicated to the Registry Submission Definition Source.

##### Message Semantics
The [Registry Submission Definition Creator](actors.html#registry-submission-definition-creator) creates or updates StructureDefinition on the [Registry Submission Definition Repository](actors.html#registry-submission-definition-repository).

The following are general requirements of the interaction.

Formats 
<table class='grid'>
<thead><tr>
<th>Parameter</th><th>Cardinality</th><th>
Registry Submission Definition Repository Expectation</th><th>
Registry Submitter Expectation</th>
</tr></thead>
<tbody>
<tr>
<td>
_format=application/fhir+xml|application/fhir+json
</td>
<td>
0..1
</td>
<td>
<b>shall</b>
</td>
<td>
<b>shall</b>
</td>
</tr>
<tr>
<td>
_format=xml|json|text/xml|application/json|application/xml|application/xml+fhir|application/json+fhir
</td>
<td>
0..1
</td>
<td>
<b>should</b>
</td>
<td>
<b>should not</b>
</td>
</tr>
<tr>
<td>
Accept:=application/fhir+xml|application/fhir+json
</td>
<td>
0..1
</td>
<td>
<b>shall</b>
</td>
<td>
<b>shall</b>
</td>
</tr>
<tr>
<td>
Accept:=xml|json|text/xml|application/json|application/xml|application/xml+fhir|application/json+fhir
</td>
<td>
0..1
</td>
<td>
<b>should</b>
</td>
<td>
<b>should not</b>
</td>
</tr>
</tbody>
</table>

###### create
The Registry Submission Definition Repository <b>shall</b> support the FHIR create operation on  the StructureDefinition resource.
###### update
The Registry Submission Definition Repository <b>shall</b> support the FHIR update operation on  the StructureDefinition resource.
##### Expected Actions
###### Create StructureDefinition Resource
The
[Registry Submission Definition Creator](actors.html#registry-submission-definition-creator)
creates or updates StructureDefinition resources and sends them to a
[Registry Submission Definition Repository](actors.html#registry-submission-definition-repository)

The [Registry Submission Definition Creator](actors.html#registry-submission-definition-creator) performs the FHIR create
operation on the StructureDefinition resource at a [Registry Submission Definition Repository](actors.html#registry-submission-definition-repository).

#### Accept Resource
The [Registry Submission Consumer](actors.html#registry-submission-consumer) reports success using 200 OK, 201 Created, or 202 Accepted to indicate a successful create or update.

### Conformance
See the following CapabilityStatement resources for conformance requirements:
* [CapabilityStatement-RSDC-CURD](CapabilityStatement-RSDC-CURD.html) Defines the requirements for the Registry Submission Definition Creator implementing the Create / Update Registry Definition transaction.
* [CapabilityStatement-RSDR-CURD](CapabilityStatement-RSDR-CURD.html) Defines the requirements for the Registry Submission Definition Repository implementing the Create / Update Registry Definition transaction.