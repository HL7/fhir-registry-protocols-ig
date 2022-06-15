This page defines how Logical Models are structured and the expectations for elements CREDS profiles. It provides guidance on how a system may support the StructureDefinitions as profiled by CREDS to represent data requirements for registries. 

Note: the key words "MUST", "MUST NOT", "SHALL", "SHALL NOT", "SHOULD","SHOULD NOT", "MAY", and "OPTIONAL" in this IG are to be interpreted as described in  [IETF BCP 14](https://www.rfc-editor.org/info/bcp14).

### Conformance Artifacts

The [Profiles and Extensions](profiles_and_extensions.html) page lists the FHIR resource profiles as used in this Implementation Guide.  

The Profile elements consist of both Mandatory and Must Support elements. Mandatory elements are elements with an minimum cardinality of 1 (min=1).  The sections below illustrate how these elements are displayed and define the rules for interpreting profile elements and subelements labeled Mandatory and Must Support for requesters and responders.

This Implementation Guide follows [US Core requirements for Must Support elements](https://build.fhir.org/ig/HL7/US-Core/conformance-expectations.html#must-support-elements)

#### Logical Model Requirements

Each Repository's data requiements are expressed as a FHIR Logical Models using a CREDSStructureDefinition.  Each of these models will create a structure as a [Profile](https://www.hl7.org/fhir/profiling.html) of CREDSStructureDefinition.  This profile is what will be given to a Registry Submitter to use as a map to fetch and compile the data.

Each Logical Model will follow this basic structure:
**Publisher information:**
The following elements MUST be populated
* date: publishing date of the current version 
* publisher: The organization publishing the data requirements
* contact.name: Name of the primary contact for questions regarding the data map
* contact.telecom.system: either email and/or telephone

**Core Map Information**
The mapping elements MUST be populated as follows:
_Output_: location where data is entered into a resource or profile for inclusion into the Submission Bundle

    mapping.identity MUST be "Output"
    mapping.uri MUST be "http://hl7.org/fhir/us/core" 
    mapping.name MUST be "Submission Data Output location"

Each of the other mapping entries are OPTIONAL unless mapping to that standard.
If FHIR mapping is used in *any* mapping element, the following MUST be included in the root of the CREDSStructureDefinition:

    mapping.identity = "FHIR"
    mapping.uri = "http://fhir.hl7.org"
    mapping.name = "Fast Health Interoperability Resources"

If CDA mapping is used in *any* mapping element, the following MUST be included in the root of the CREDSStructureDefinition:

    mapping.identity = "CDA"
    mapping.uri = "http://build.fhir.org/ig/HL7/cda-core-2.0/"
    mapping.name = "Clinical Document Architecture"

If HL7 V2 message mapping is used in *any* mapping element, the following MUST be included in the root of the CREDSStructureDefinition:

    mapping.identity = "HL7V2"
    mapping.uri = "http://www.hl7.eu/refactored/index.html"
    mapping.name = "HL7 V2 Messages"

### Mapping Elements
Each datapoint in the Registry data map corresponds to an element in the logical model.  Elements may be categorized through the use of a BackboneElement which holds no value. Each data point is named with a [camelCase](https://en.wikipedia.org/wiki/Camel_case) version of a short datapoint name without whitespace or punctuation.

Each element has a base definition of cardinality (how many of that element there can be) a short name and a full definition.  The definition may give guidance on the datapoint's formatting or other requirements.  The element also gives specifics on the source mapping (i.e., where the data can be found)in zero or more standards-based formats (e.g., FHIR, CDA).  If no "Source Standard" mappings are supplied, it should be assumed that the data is only available through a manual process.


Each mapping MUST contain the following elements:
~~~~
mapping.identity: the "Source Standard" such as FHIR, CDA, HL7V2
mapping.language the mimetype of standard (e.g., application/fhir, application/hl7-sda+xml [CDA], application/edi-hl7v2 [HL7 V2])
mapping.map the actual Xpath to data 
~~~~

In addition to the source mapping, the destination element (Output) is structured the same as a FHIR Source Standard element with addition of a Comment that lists the full path to the FHIR resource or Profile that will be used in the submission Bundle.
~~~~
mapping.identity: MUST be FHIR
mapping.language: MUST be application/fhir
mapping.map: the actual Xpath for the data to be entered
mapping.comment: the resource name (e.g., Observation) or the full path to the destionation profile (e.g., http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient for the USCore Patient profile)
~~~~

#### Query ValueSet Binding
Where needed a Logical Model may have a binding to a ValueSet that outlines the codes needed for a query.  For example, a bound ValueSet may have a list of SNOMED and/or LOINC, etc. codes that would match a condition that a needed may have in their history.  This may allow for better targetted queries from the Submitter to its sources.

### Submission Bundle
The [CREDS submission bundle](StructureDefinition-CREDSSubmission.html) is a FHIR Bundle of type "Collection".  
* The first entry in the Bundle MUST be a MessageHeader indicating who is sumbitting this data
* The second entry MUST be the [US Core Patient](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-patient.html) resource for the subject of the submission.

All other entries are dictated by the Registry data dictionary.

When using the CREDS submission bundle, the Resources for all Data Dictionary elements should have the element(s) path as a tag within the Resource .meta.tag elements.  This will allow the Registry to better map the Bundle entries back to the data dictionary.  As example:
```
 "tag": [
    {
      "system": "http://www.acc.org/CathPCIelement",
      "value": "discharge.discharge.datetime"
    },
    {
      "system": "http://www.acc.org/CathPCIelement",
      "value": "discharge.dischargeProvider.firstName"
    },
    {
      "system": "http://www.acc.org/CathPCIelement",
      "value": "discharge.dischargeProvider.lastName"
    },
    {
      "system": "http://www.acc.org/CathPCIelement",
      "value": "discharge.dischargeProvider.npi"
    },
    {
      "system": "http://www.acc.org/CathPCIelement",
      "value": "discharge.discharge.location"
    }
  ],
  ```
  This would be the entries for location, date and time and the provider within the Discharge encounter. 