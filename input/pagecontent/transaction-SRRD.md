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
            <tr><td>FHIR-R4</td><td><a href='http://www.hl7.org/FHIR/R4'>HL7 FHIR Release 4</a></td></tr>
        
            <tr><td>RFC-7230</td><td><a href='https://ietf.org/rfc/rfc7230.html'>Hypertext Transfer Protocol - HTTP/1.1</a></td></tr>
        
</tbody>
</table>
### Interactions
        
<figure>
{% include transaction-SRRD-seq.svg%}
<figcaption>Figure 2.1-2: Search / Retrieve Registry Definition Interactions </figcaption>
</figure>
#### Search Request


##### Message Semantics
The client sends a query using an HTTP GET or POST transaction to
the server requesting information on available resources.

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
The server **shall** support the _count parameter for queries. Servers **should** use a default
value for _count if no value is provided to avoid server overloading. This guide recommends a default value of 100 based on
existing implementation experience.

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
_count
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
</tbody>
</table>
        
</li>
<li>
Include Support
<div>
To reduce transaction overhead, a client system may wish to retrieve all the resources referenced by the
selected resource when obtaining it. This can be accomplished by using a search with an _id parameter, combined with
_include=*.

This guide does not further specify specify resource includes beyond required support for *.
Systems that support _include generally handle _include=*, in fact, in some ways it is easier to implement
than more selective _include operations. Recursive includes can be a source of server loading issues, as
an incorrectly implemented include with recursive includes could wind up retrieving far more data than
the client expected. Thus, these are not recommended.

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
_include=*
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
_include:iterate
</td>
<td>

</td>
<td>
<b>should not</b>
</td>
<td>
<b>should not</b>
</td>
</tr>
</tbody>
</table>
        
</li>
</ol>
###### read
A client **shall** be able to read individual resources that are returned or referenced within resources
returned by a query.

The Registry Submission Definition Repository <b>shall</b> support the FHIR read operation on  the StructureDefinition resource.
###### search
A client system **shall** be able to retrieve the definition data by publisher, condition, description or
other text.
The Registry Submission Definition Repository <b>shall</b> support the FHIR search operation on  the StructureDefinition resource with the following parameters.
<ol>
<li>
Search by _id
<div>
A client **shall** be able to read individual resources that are returned or referenced within resources
returned by a query. Client systems may save resource references for future use, retrieving them later as
needed. To reduce overhead, a client system may also wish to retrieve the resources referenced by the
selected resource. This can be accomplished by using a search with an _id parameter, combined with _include=*

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
_id
</td>
<td>
1..*
</td>
<td>
<b>shall</b>
</td>
<td>
<b>shall</b>
</td>
</tr>
</tbody>
</table>
        
</li>
<li>
Search by url, name, identifier, publisher, condition or status
<div>
A client **shall** be able to query for resources by url, name, identifier, publisher, condition or status.

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
url
</td>
<td>
0..*
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
name
</td>
<td>
0..*
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
identifier
</td>
<td>
0..*
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
publisher
</td>
<td>
0..*
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
context
</td>
<td>
0..*
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
status
</td>
<td>
0..*
</td>
<td>
<b>shall</b>
</td>
<td>
<b>shall</b>
</td>
</tr>
</tbody>
</table>
        
</li>
<li>
Search by Date
<div>
A client **shall** be able to search by relevant dates,
e.g., the date of _lastUpdate of a previously retrieved resource to see if it has changed (e.g., in cases
where data needs to be refreshed).

All date searches **shall** allow a range to be specified, but need not allow more than one range. Approximate
ranges are not required
to be supported because server support for these is not commonly available, nor implemented in readily reproducable
fashions (the definition of an approximate date can have different meanings for different servers). Simple eq, le, lt,
ge, and gt **should** be sufficient to specify date ranges.

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
_lastUpdated
</td>
<td>
0..2
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
date
</td>
<td>
0..2
</td>
<td>
<b>shall</b>
</td>
<td>
<b>shall</b>
</td>
</tr>
</tbody>
</table>
        
</li>
<li>
Search by Text or Code
<div>
A client system **should** be able to search for definition resources
associated with by text within the definition. This requirement can be met through support of the
<a href='http://hl7.org/fhir/search.html#text'>_text or _content search parameters</a>.

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
_text
</td>
<td>
0..*
</td>
<td>
<b>should</b>
</td>
<td>
<b>should</b>
</td>
</tr>

<tr>
<td>
_content
</td>
<td>
0..*
</td>
<td>
<b>should</b>
</td>
<td>
<b>should</b>
</td>
</tr>
</tbody>
</table>
        
</li>
</ol>
### Conformance
See the following CapabilityStatement resources for conformance requirements:
* [CapabilityStatement-RSDR-SRRD](CapabilityStatement-RSDR-SRRD.html) Defines the requirements for the Registry Submission Definition Repository implementing the Search / Retrieve Registry Definition transaction.
* [CapabilityStatement-RS-SRRD](CapabilityStatement-RS-SRRD.html) Defines the requirements for the Registry Submitter implementing the Search / Retrieve Registry Definition transaction.