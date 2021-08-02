This section describes the CURD of this guide. This transaction is used by the Registry Submission Definition Creator and Registry Submission Definition Repository actors.

### Scope





### Actors Roles
{% include transaction-CURD-uc.svg%}

**Figure 2.2-1: Create / Update Registry Definition Use Case Diagram**

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
            <tr><td>FHIR-R4</td><td><a href='http://www.hl7.org/FHIR/R4'>HL7 FHIR Release 4.0</a></td></tr>
        
            <tr><td>RFC-7230</td><td><a href='https://ietf.org/rfc/rfc7230.html'>Hypertext Transfer Protocol - HTTP/1.1</a></td></tr>
        
</tbody>
</table>

### Interactions
        {% include transaction-CURD-seq.svg%}

**Figure 2.2-2: Create / Update Registry Definition Interactions**


#### Create or Update Registry Submission Definition




##### Trigger Event - Create or Update Registry Submission Definition

A SubmissionDefinitionCreator requests creation of a new Submission Definition


A logical model or submission transformation created by the Registry Submission Definition Creator
is communicated to the Registry Submission Definition Source.



##### Message Semantics


A StructureDefinition is created or updated by the
[](s.html#)
on the
[](s.html#)
.



The MeasureReport sends a MeasureReport to the MeasureConsumer using the FHIR
[create](https://www.hl7.org/fhir/http.html#create) or [update](https://www.hl7.org/fhir/http.html#update) interactions.
A MeasureSource supporting the CSV option sends the CSV file to the MeasureConsumer using the $report-csv operation.



The following are general requirements of the interaction.

<ol>

<li>
Formats
<div>

All servers **shall** support the _format parameter for any read or search and the standard values
defined by FHIR for JSON and XML output. This value **shall** override the Accept: header when present in an exchange.
Servers **shall** also support the Accept: header, and **shall** support any value in Accept: that can be given to _format
for consistency. Servers are also free to support other output formats (e.g. turtle as defined in the base FHIR
specifications, or other formats such as CSV which might be easier for clients to present or use). Servers
should support other commonly used expressions representing JSON or XML outputs without complaint, including
those specified in prior releases (e.g., the DSTU2 application/xml+fhir or application/json+fhir types that
have since changed in R4).



</div>


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

        
</li>

<li>

<div>

</div>

</li>

</ol>

###### 
The Registry Submission Definition Repository <b>shall</b> support the FHIR create operation on  the StructureDefinition and StructureMap resources.

###### 
The Registry Submission Definition Repository <b>shall</b> support the FHIR update operation on  the StructureDefinition and StructureMap resources.

##### Expected Actions

###### Send StructureDefinition Resource


The
[Registry Submission Definition Creator](actors.html#registry-submission-definition-creator)
creates resources and sends them to a
[Registry Submission Definition Repository](actors.html#registry-submission-definition-repository)



The Measure Source performs the FHIR create
operation on the MeasureReport resource at a Measure Consumer.



#### Accept Resource


The Measure Consumer reports success using 200 OK, 201 Created, or 204 No Content to indicate a successful
create or update.




##### Trigger Event - 

##### Message Semantics

##### Expected Actions

### Conformance
See the following CapabilityStatement resources for conformance requirements:

* [CapabilityStatement-RSDC-CURD](CapabilityStatement-RSDC-CURD.html) Defines the requirements for the Registry Submission Definition Creator implementing the Create / Update Registry Definition transaction.
* [CapabilityStatement-RSDR-CURD](CapabilityStatement-RSDR-CURD.html) Defines the requirements for the Registry Submission Definition Repository implementing the Create / Update Registry Definition transaction.