<!--
    This content is automatically generated from CREDS.xml by actorsandtransactions.xslt
-->
This section describes the SRRD of this guide. This transaction is used by the Registry Submission Definition Creator, Registry Submission Definition Repository and Registry Submitter actors.

### Scope

Search for and Retrieve Registry Submission Definitions




### Actors Roles

<figure>
{% include transaction-SRRD-uc.svg%}
<figcaption>Figure 2.1-1: Search / Retrieve Registry Definition Use Case Diagram </figcaption>
</figure>
<table border='1' borderspacing='0'>
<caption><b>Table 2.1-1: Actor Roles</b></caption>
<thead><tr><th>Actor</th><th>Role</th></tr></thead>
<tbody><tr><td><a href="actors.html#registry-submission-definition-creator">Registry Submission Definition Creator</a></td>
<td>Searches for or reads existing registry submission definition resources
</td>
</tr>
        <tr><td><a href="actors.html#registry-submission-definition-repository">Registry Submission Definition Repository</a></td>
<td>Responds to requests to search or read for registry submission definition resources
</td>
</tr>
        <tr><td><a href="actors.html#registry-submitter">Registry Submitter</a></td>
<td>Searches for or reads existing registry submission definition resources
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
        
<figure>
{% include transaction-SRRD-seq.svg%}
<figcaption>Figure 2.1-2: Search / Retrieve Registry Definition Interactions </figcaption>
</figure>

#### Search Request




##### Trigger Event - 





##### Message Semantics

The client sends a query using an HTTP GET or POST transaction to
the server requesting information on available resources.



The following are general requirements of the interaction.

<ol>

</ol>

###### Read on Required Resources

A client **shall** be able to read individual resources that are returned or referenced within resources
returned by a query.


The Registry Submission Definition Repository <b>shall</b> support the FHIR read operation on  the StructureDefinition and StructureMap resources.

###### Search on Definition Resources

A client system **shall** be able to retrieve the definition data by publisher, condition, description or
other text.



The Registry Submission Definition Repository <b>shall</b> support the FHIR search operation on  the StructureDefinition and StructureMap resources with the following parameters.

<ol>

</ol>

##### Expected Actions

### Conformance
See the following CapabilityStatement resources for conformance requirements:

* [CapabilityStatement-RSDR-SRRD](CapabilityStatement-RSDR-SRRD.html) Defines the requirements for the Registry Submission Definition Repository implementing the Search / Retrieve Registry Definition transaction.
* [CapabilityStatement-RS-SRRD](CapabilityStatement-RS-SRRD.html) Defines the requirements for the Registry Submitter implementing the Search / Retrieve Registry Definition transaction.