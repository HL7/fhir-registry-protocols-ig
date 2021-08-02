
The IG demonstrates a process and workflow to support the needs of clinical registries
to define how registry
submissions can be automatically extracted from multiple data sources and combined into a
registry submission. It profiles the
definitional resources needed to collect data and construct a registry
submission using existing FHIR resource profiles.




### About This Guide


### Organization of This Guide
This guide is organized into four main sections:

1. Volume I: [Overview](overview.html) - Provides an overview of the challenges this effort is trying to address.
   1. [Technology Environment](technology_environment.html) - Describes the technology environment for uninitiated.
   2. [Architecture](architecture.html) - Illustrates the Microservice Architecture
   3. [Security Considerations](security_considerations.html) - Documents security concerns and mitigations
   4. [Use Cases](use_cases.html) - Illustrates key use cases
   5. [Actors](actors.html) - Provides an overview of technical components

2. Volume II: [Transactions](transactions.html)
   1. [Search / Retrieve Registry Definition ](transaction-SRRD.html)
   2. [Create / Update Registry Definition ](transaction-CURD.html)
   3. [Retrieve Registry Submission Data ](transaction-RRSD.html)
   4. [Create / Update Registry Submission ](transaction-CURS.html)
   5. [Validate Registry Submission ](transaction-VRS.html)

3. Volume III: Content Profiles
   1. [](StructureDefinition-creds-RegistryLogicalModel.html)
   2. [](StructureDefinition-creds-RegistrySubmissionTransformation.html)

4. Volume IV: Terminology

Click on any of the links above, head on over the [table of contents](toc.html), or
if you are looking for a specific artifact, check out the [index](artifacts.html).

You can also download:

* [this entire guide](full-ig.zip),
* the definition resources in [json](definitions.json.zip), [xml](definitions.xml.zip), [ttl](definitions.ttl.zip), or [csv](csvs.zip) format, or
* the example resources in [json](examples.json.zip), [xml](examples.xml.zip) or [ttl](examples.ttl.zip) format.

The source code for this Implementation Guide can be found on
[https://github.com/HL7/fhir-registry-protocols-ig](https://github.com/HL7/fhir-registry-protocols-ig).


        