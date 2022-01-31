### About This Guide
The IG demonstrates a process and workflow to support the needs of clinical registries to define how registry submissions can be automatically extracted from multiple data sources and combined into a registry submission. It profiles the definitional resources needed to collect data and construct a registry submission using existing FHIR resource profiles.

### Organization of This Guide
This guide is organized into four main sections:
1. [Introduction and Scope](introduction.html) - General introduction to the CREDS use case
   1. [Overview](overview.html) - Provides an overview of the challenges this effort is trying to address.
   1. [Use Cases](use_cases.html) - Illustrates key use cases

2. [Architecture](Architecture_and_Implementation.html) - Illustrates the conversion steps and transactions
   1. [Technology Environment](technology_environment.html) - Describes the technology environment for uninitiated.
   2. [Security Considerations](security_considerations.html) - Documents security concerns and mitigations
   3. [Actors](actors.html) - Provides an overview of technical components
   4. [Profiles](profiles_and_extensions.html) - FHIR Resource Profiles created by this IG

3. [Transactions](transactions.html)
   1. [Search / Retrieve Registry Definition ](transaction-SRRD.html)
   2. [Create / Update Registry Definition ](transaction-CURD.html)
   3. [Retrieve Registry Submission Data ](transaction-RRSD.html)
   4. [Create / Update Registry Submission ](transaction-CURS.html)
   5. [Validate Registry Submission ](transaction-VRS.html)

4. [Test Plan](test_plan.html) - Testing for a conformant system
   1. [Conformance](conformance.html) - Conformance requirements

Click on any of the links above or refer to the [table of contents](toc.html), or if you are looking for a specific artifact, refer to the [index](artifacts.html).

You can also download:

* [this entire guide](full-ig.zip),
* the definition resources in [json](definitions.json.zip), [xml](definitions.xml.zip), [ttl](definitions.ttl.zip), or [csv](csvs.zip) format, or
* the example resources in [json](examples.json.zip), [xml](examples.xml.zip) or [ttl](examples.ttl.zip) format.

The source code for this Implementation Guide can be found on
[https://github.com/HL7/fhir-registry-protocols-ig](https://github.com/HL7/fhir-registry-protocols-ig).
