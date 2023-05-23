### About This Guide
The IG demonstrates a process and workflow to support the needs of clinical registries to define how registry submissions can be automatically extracted from multiple data sources and combined into a registry submission. It profiles the definitional resources needed to collect data and construct a registry submission using existing FHIR resource profiles.

An example, included in this Implementation Guide, is the American College of Cardiology CathPCI registry.  This registry uses a large (375+) number of items collected from a patient's current and historical record.  Currently that information has to be manually entered into a data form.  The CREDS system converts the Excel-based data structure into a FHIR StructureDefinition, with data elements that outline possible queries expressed as FHIRPath, that allow for automated query of the data that may be stored in FHIR, CDA or HL7 V2. The application can query for the data and then prompt for those data elements that were not found. This data is then bundled and uploaded, automatically, to the registry for verification. 

### Organization of This Guide
This guide is organized into four main sections:
1. [Introduction and Scope](introduction.html) - General introduction to the CREDS use case.
   1. [Overview](overview.html) - Provides an overview of the challenges this effort is trying to address.
   1. [Use Cases](use_cases.html) - Illustrates key use cases.

2. [Architecture](Architecture_and_Implementation.html) - Illustrates the conversion steps and transactions
   1. [Technology Environment](technology_environment.html) - Describes the technology environment for uninitiated.
   2. [Security Considerations](security_considerations.html) - Documents security concerns and mitigations.
   3. [Actors](actors.html) - Provides an overview of technical components.
   4. [Profiles](profiles_and_extensions.html) - FHIR Resource Profiles created by this IG.

3. [Transactions](transactions.html)
   1. [Search / Retrieve Registry Definition ](transaction-SRRD.html)
   2. [Create / Update Registry Definition ](transaction-CURD.html)
   3. [Retrieve Registry Submission Data ](transaction-RRSD.html)
   4. [Create / Update Registry Submission ](transaction-CURS.html)
   5. [Validate Registry Submission ](transaction-VRS.html)

4. [Test Plan](test_plan.html) - Testing for a conformant system.
   1. [Conformance](conformance.html) - Conformance requirements.

Click on any of the links above or refer to the [table of contents](toc.html), or if you are looking for a specific artifact, refer to the [index](artifacts.html).

You can also download:

* [this entire guide](full-ig.zip),
* the definition resources in [json](definitions.json.zip), [xml](definitions.xml.zip), [ttl](definitions.ttl.zip), or [csv](csvs.zip) format, or
* the example resources in [json](examples.json.zip), [xml](examples.xml.zip) or [ttl](examples.ttl.zip) format.

The source code for this Implementation Guide can be found on
[https://github.com/HL7/fhir-registry-protocols-ig](https://github.com/HL7/fhir-registry-protocols-ig).


### CREDS and Content IGs
CREDS focuses on providing healthcare provider organizations information on how to collect the data needed to submit to registries. This may include but is not limited to data sources such as EHRs, HIEs and other sources using FHIR, HL7 CDA documents, and HL7 V3 messages that are not available via FHIR APIs.

Other content IGs such as MedMorph and UDS+ specify the use of standard FHIR APIs to collect data from EHRs and potentially other systems and exchange with systems that can receive data in FHIR format. This IG can support multiple use cases through content IGs, including but not limited to case-based surveillance, registry reporting, national health care surveys, and research.

Use cases that need to obtain data not available via FHIR APIs should consider the use of CREDS. Once there is a CREDS FHIR bundle, the MedMorph or UDS+ profiles could be used for transport.

### Legal Statements
 While this implementation guide and the underlying FHIR are licensed as public domain under the FHIR license. The license page also describes rules for the use of the FHIR name and logo.

This guide includes examples making use of terminologies such as LOINC, SNOMED CT and RxNorm codes that have more restrictive licensing requirements. Implementers should make themselves familiar with licensing and any other constraints of terminologies, questionnaires, and other components used as part of their implementation process. In some cases, licensing requirements may limit the systems that data captured using certain Definitions may be shared with. 

{% include ip-statements.xhtml %}