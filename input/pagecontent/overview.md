The IG demonstrates a process and workflow to support the needs of clinical registries to define how registry submissions can be automatically extracted from multiple data sources and combined into a registry submission. It profiles the definitional resources needed to collect data and construct a registry submission using existing FHIR resource profiles.

The IG demonstrates a process and workflow to support the needs of clinical registries to define how registry submissions can be automatically extracted from multiple data sources and combined into a registry submission. It profiles the definitional resources needed to collect data and construct a registry submission using existing FHIR resource profiles.

This implementation guide used the HL7 FHIR Standard to:

1. Enable Clinical Registries hosted by organizations such as the American College of Cardiology to communicate their registry data dictionaries and/or information models to others,
2. Enable registry business analysts to define where information in the data dictionary can be found in standard formats used to access routine information stored or communicated between provider information systems (e.g., EHR systems, national and regional health information networks (e.g., Carequality, CommonWell), and Health Information Exchanges,
3. Enable health IT systems to query for the necessary information resources hosting that data from various sources, and
4. Capture and transform that information into a collection of FHIR Resources that can be collected by the registry in submissions.

The process most commonly used by registries today is to define a registry submission format that maps to their data dictionary/information model, and to specify the appropriate vocabulary (e.g., ICD-10-CM, SNOMED CT, CPT, et cetera) allowed in coded fields to submitters.

Business analysts within submitting facilities coordinate with their HIT information systems teams to map data from these systems to populate a registry submission. Not all data may be available within the local HIT information systems, so the integration teams often also enable
connections and queries through other health IT information systems to enable the abstractors to collect and copy data from those systems into the registry submission for a given patient.
Business analysts within submitting facilities coordinate with their HIT information systems teams to map data from these systems to populate a registry submission. Not all data may be available within the local HIT information systems, so the integration teams often also enable
connections and queries through other health IT information systems to enable the abstractors to collect and copy data from those systems into the registry submission for a given patient.

The collected data is then transformed into a registry submission and communicated to the clinical registry.

The framework proposed in this guide is one in which:
1. The Clinical Registry's data dictionary/information model is communicated as a FHIR Logical Model using the StructureDefinition resource.
2. The logical model describes how the data dictionary maps to standards artifacts such as FHIR resources, CDA documents or HL7 V2 messages.
3. Health Information Systems are able to query for the necessary artifacts from multiple sources to extract registry data.
4. The information collected for a logical model can be transformed into a FHIR Bundle for submission.

## The Logical Model
A logical model is a collection of metadata that describes the data used by an information system. It may alternatively be known as an information model, data dictionary, or schema. The logical model providing the names, identifiers, data types, terminology and cardinalities for the collected information.

FHIR uses the [StructureDefinition](http://www.hl7.org/fhir/structuredefinition.html) resource to define logical models for various purposes. The StructureDefinition.kind field indicates how the StructureDefinition is used. When kind is set to "logical", the StructureDefinition describes a logical model. This is the same resource used to define the structure of FHIR Resources, profiles and extensions.

## Mapping logical model elements to Standardized Artifacts
A logical model can be mapped to models for other artifacts, such as a CDA document or V2 message. The types of artifacts that the model is mapped to are described in the [StructureDefinition.mapping](http://www.hl7.org/fhir/structuredefinition-definitions.html#StructureDefinition.mapping) components.
The [identity](http://www.hl7.org/fhir/structuredefinition-definitions.html#StructureDefinition.mapping.identity) values for these mappings identify the mapping for later reference in the StructureDefinition. The uri for the mapping indicates the url defining the logical model for the mapped to model.
The mappings in this guide by convention use FHIR, CDA and HL7V2 as the identifiers for the HL7 FHIR R4, CDA Release 2.0, and HL7 Version 2 information models, and the URI references the specification that provides the StructureDefinition resources that have been created for these artifacts.

|Identifier|URL|
|---|---|
|FHIR| http://hl7.org/fhir |
|CDA| https://build.fhir.org/ig/HL7/cda-core-2.0/ |
|HL7V2| https://v2plus.hl7.org/ |

In expressing mappings to these standards, a clinical registry **shall** use the identifiers listed above when mapping from the standards they reference.

A StructureDefinition resource contains a collection [ElementDefinition](http://www.hl7.org/fhir/elementdefinition.html) components which describe the data elements in the logical model. Each ElementDefinition can map the field it describes to these information models by expressing a [mapping](http://www.hl7.org/fhir/elementdefinition-definitions.html#ElementDefinition.mapping) within the element definition. The identity of the element expresses the standard artifact used (e.g., FHIR, CDA, HL7V2). The computable language used to express mappings is text/fhirpath, as the [FHIRPath](http://hl7.org/fhirpath/) language can be used on any artifact for which there is a logical model.

The first part of the FHIRPath expression in the mapping.map field should indicate the type of resource to be retrieved in the case of FHIR or V2 messages, since these artifacts have different models depending on the resource or message. It should always be ClinicalDocument in the case of resources retrieved from a CDA document.

Registries may identify additional mapping types for example, to support queries for specializations of CDA documents (e.g., C-CDA) or other standard models (e.g., X12 or NCPDP messages) from repositories supporting those formats.

### Canonical Information Models
When mapping from the Registries information model to HL7 FHIR, CDA or Version 2 resources, this guide defines the canonical model used for the target resource type (FHIR, CDA or V2) to ensure consistent mappings. Registries may also define mappings for other sources of information (e.g., older versions of FHIR), but the mapping identifiers for FHIR, CDA, and V2 are defined based on specific versions of these standards expected to be in use at the time of publication of this guide.


## Extracting Registry Data Using the Logical Model
To extract the necessary data for a registry submission using the logical model, one must have (in addition to the logical model), a patient associated with the data to be collected, a time period associated with the registry submission, and possibly other constraints. One must also have access to repositories which can be queried to obtain access to the standardized artifacts.

A naive data collection algorithm would iterate through each element in the logical model, and for each artifact type (FHIR, CDA, HL7 Version 2), query the available repositories for matching records in the time period, extract the requested data elements (using FHIRPath) to populate these elements into an expression of the logical model for the given patient, and move on to the next element. This would repeatedly query the same repositories for the same data.

A more practical approach is to collect all the queries to perform, and the perform the extractions appropriate for each unique query.

### Resolving Patient Identity
This implementation guide does not specify how patient matches are performed across different information systems. The IHE PIXm and PDQm profiles provide a FHIR API which enables information systems to resolve patient identities using HL7 FHIR. Each repository endpoint may require different patient matching strategies when it is configured. The registry submitter may need to identify policies for how to deal with cases where there is more than one patient match, or no matches.

### Querying for Artifacts
FHIRPath allows an implementation to define environment variables.  This guide defines three variables associated with the FHIRPath expressions used in mappings:

|Environment Variable|Description|
|---|---|
|%patient| This variable is a FHIR [Patient](http://www.hl7.org/fhir/R4/Patient.html) resource that describes the patient for whom the data is being collected as they are known to the collecting system.|
|%period| This variable is a FHIR [Period]() data type that defines the period associated with the registry activity. |
|%encounter| This variable is a FHIR [Encounter](http://www.hl7.org/fhir/R4/Encounter.html) resource that describes the relevant encounter associated with the registry activity. |
|%procedure| This variable is a FHIR [Procedure](http://www.hl7.org/fhir/R4/Procedure.html) resource that describes the relevant procedure associated with the registry activity. |
|%condition| This variable is a FHIR [Condition](http://www.hl7.org/fhir/R4/Condition.html) resource that describes the relevant condition associated with the registry activity. |

In addition, this guide also allows an implementation to define environment variables to reference value sets which are used in FHIRPath expressions by placing the name of the variable in the Output mapping.

## Mapping the Logical Model Content to a Submission Bundle
To submit data, the Registry Submission Creator actor must map the logical model to a collection of resources submitted using a Bundle resource. These mappings are defined using the Output mapping identifier. If the Registry logical model is defined as if it were a collection of FHIR Resources, then this transformation is simply a matter of copying the resources in the registry logical model to resource into the submission Bundle.