
The IG demonstrates a process and workflow to support the needs of clinical registries to define how registry submissions can be automatically extracted from multiple data sources and combined into a registry submission. It profiles the definitional resources needed to collect data and construct a registry submission using existing FHIR resource profiles.

This guide is organized into four main sections:
1. Introduction
   1. [Scope](introduction.html)
   2. [Use Cases](usecases.html) - Illustrates key use cases

1. [Architecture and Implementation](overview.html) - Provides an overview of the challenges this effort is trying to address.
   1. [Architecture](architecture.html) - Illustrates the Microservice Architecture
   2. [Technology Environment](technology_environment.html) - Describes the technology environment for uninitiated.
   3. [Security Considerations](security_considerations.html) - Documents security concerns and mitigations
   4. [Actors](actors.html) - Provides an overview of technical components
   5. [Profiles and Extensions](profiles_and_extensions.html) - An overview of the constraints and extensions used
   6. [Terminology](vocabulary.html) - Valuesets and custom codesystems used

2. [Transactions](transactions.html)
   1. [Search / Retrieve Registry Definition ](transaction-SRRD.html)
   2. [Create / Update Registry Definition ](transaction-CURD.html)
   3. [Retrieve Registry Submission Data ](transaction-RRSD.html)
   4. [Create / Update Registry Submission ](transaction-CURS.html)
   5. [Validate Registry Submission ](transaction-VRS.html)

4.  [Testing &amp; Conformance](test_plan.html)



Click on any of the links above, head on over to the [table of contents](toc.html), or
if you are looking for a specific artifact, check out the [artifact index](artifacts.html).

You can also download:

* [this entire guide](full-ig.zip),
* the definition resources in [json](definitions.json.zip), [xml](definitions.xml.zip), [ttl](definitions.ttl.zip), or [csv](csvs.zip) format, or
* the example resources in [json](examples.json.zip), [xml](examples.xml.zip) or [ttl](examples.ttl.zip) format.

The source code for this Implementation Guide can be found on
[https://github.com/HL7/fhir-registry-protocols-ig](https://github.com/HL7/fhir-registry-protocols-ig).


        