<!--
    This content is automatically generated from CREDS.xml by actorsandtransactions.xslt
-->

This section defines the actors in this implementation guide.

Figure 1.1-1 below shows the actors directly
involved in the CREDS
Profile and the relevant transactions between them.



<figure>
{% include ActorsAndTransactions.svg%}
<figcaption>Figure 3-1: CREDS Actor Diagram </figcaption>
</figure>
Table 3-1 lists the transactions for each actor directly involved in the CREDS Implementation Guide. To claim compliance with this guide, an actor shall
support all required transactions (labeled "R").


<table border="1" borderspacing="0" style='border: 1px solid black; border-collapse: collapse'>
<caption>
<b>
Table 3-1: CREDS Implementation Guide - Actors and Transactions
</b>
</caption>
<thead>
<tr class="odd" style='background: gray;'>
<th>Actors</th>
<th>Transactions</th>
<th>Optionality</th>
</tr>
</thead>
<tbody>
                
<tr>
                        
<td rowspan="2">
<a href="#registry-submission-definition-creator">Registry Submission Definition Creator</a>
</td>
                        
<td>
<a href='transaction-CURD.html'>
                        Create / Update Registry Definition [CURD]</a>
</td>
<td align='center'>
                        R
</td>
</tr>
                    
<tr>
                        
<td>
<a href='transaction-SRRD.html'>
                        Search / Retrieve Registry Definition [SRRD]</a>
</td>
<td align='center'>
                        R
</td>
</tr>
                    
<tr>
                        
<td rowspan="2">
<a href="#registry-submission-definition-repository">Registry Submission Definition Repository</a>
</td>
                        
<td>
<a href='transaction-CURD.html'>
                        Create / Update Registry Definition [CURD]</a>
</td>
<td align='center'>
                        R
</td>
</tr>
                    
<tr>
                        
<td>
<a href='transaction-SRRD.html'>
                        Search / Retrieve Registry Definition [SRRD]</a>
</td>
<td align='center'>
                        R
</td>
</tr>
                    
<tr>
                        
<td rowspan="4">
<a href="#registry-submitter">Registry Submitter</a>
</td>
                        
<td>
<a href='transaction-SRRD.html'>
                        Search / Retrieve Registry Definition [SRRD]</a>
</td>
<td align='center'>
                        R
</td>
</tr>
                    
<tr>
                        
<td>
<a href='transaction-RRSD.html'>
                        Retrieve Registry Submission Data [RRSD]</a>
</td>
<td align='center'>
                        R
</td>
</tr>
                    
<tr>
                        
<td>
<a href='transaction-CURS.html'>
                        Create / Update Registry Submission [CURS]</a>
</td>
<td align='center'>
                        R
</td>
</tr>
                    
<tr>
                        
<td>
<a href='transaction-VRS.html'>
                        Validate Registry Submission [VRS]</a>
</td>
<td align='center'>
                        O
</td>
</tr>
                    
<tr>
                        
<td rowspan="1">
<a href="#registry-submission-data-source">Registry Submission Data Source</a>
</td>
                        
<td>
<a href='transaction-RRSD.html'>
                        Retrieve Registry Submission Data [RRSD]</a>
</td>
<td align='center'>
                        R
</td>
</tr>
                    
<tr>
                        
<td rowspan="2">
<a href="#registry-submission-consumer">Registry Submission Consumer</a>
</td>
                        
<td>
<a href='transaction-CURS.html'>
                        Create / Update Registry Submission [CURS]</a>
</td>
<td align='center'>
                        R
</td>
</tr>
                    
<tr>
                        
<td>
<a href='transaction-VRS.html'>
                        Validate Registry Submission [VRS]</a>
</td>
<td align='center'>
                        R
</td>
</tr>
                    
</tbody>
</table>
        
        
### Actor Descriptions
The actors in this profile are described in more detail in the sections below.

#### Registry Submission Definition Creator


The
[Registry Submission Definition Creator](actors.html#registry-submission-definition-creator)
manages the definitional artifacts (logical model and transforms) supporting a clinical registry






##### Registry Submission Definition Creator Conformance

See the following CapabilityStatement resources for conformance requirements:
* [CapabilityStatement-RSDC](CapabilityStatement-RSDC.html) Defines the requirements for the Registry Submission Definition Creator.
#### Registry Submission Definition Repository


The Registry Submission Definition Repository holds the definitions for the registry submission logical model
and the tranformations data conforming to that logical model to the submission format.






##### Registry Submission Definition Repository Conformance

See the following CapabilityStatement resources for conformance requirements:
* [CapabilityStatement-RSDR](CapabilityStatement-RSDR.html) Defines the requirements for the Registry Submission Definition Repository.
#### Registry Submitter

The Registry Submitter is responsible for submitting data to a clinical registry.





##### Registry Submitter Conformance

See the following CapabilityStatement resources for conformance requirements:
* [CapabilityStatement-RS](CapabilityStatement-RS.html) Defines the requirements for the Registry Submitter.
#### Registry Submission Data Source


The Registry Submission Data Source makes clinical data available to a registry submitter so that it can be
submitted to a registry.






##### Registry Submission Data Source Conformance

See the following CapabilityStatement resources for conformance requirements:
#### Registry Submission Consumer


The Registry Submission Consumer accepts and validates registry submissions on behalf of a clinical registry.






##### Registry Submission Consumer Conformance

See the following CapabilityStatement resources for conformance requirements: