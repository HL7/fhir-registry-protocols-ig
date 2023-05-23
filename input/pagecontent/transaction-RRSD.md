<!--
    This content is automatically generated from CREDS.xml by actorsandtransactions.xslt
-->
This section describes the RRSD of this guide. This transaction is used by the Registry Submitter and Registry Submission Data Source actors.
### Scope
Search for and Retrieve Registry Submission Data


### Actors Roles
<figure>
{% include transaction-RRSD-uc.svg%}
<figcaption>Figure 2.3-1: Retrieve Registry Submission Data Use Case Diagram </figcaption>
</figure>
<table border='1' borderspacing='0'>
<caption><b>Table 2.3-1: Actor Roles</b></caption>
<thead><tr><th>Actor</th><th>Role</th></tr></thead>
<tbody><tr><td><a href="actors.html#registry-submitter">Registry Submitter</a></td>
<td>Searches for or reads registry submission data
</td>
</tr>
        <tr><td><a href="actors.html#registry-submission-data-source">Registry Submission Data Source</a></td>
<td>Responds to requests to searches for or reads registry submission data
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
{% include transaction-RRSD-seq.svg%}
<figcaption>Figure 2.3-2: Retrieve Registry Submission Data Interactions </figcaption>
</figure>
#### 

### Conformance
See the following CapabilityStatement resources for conformance requirements:
