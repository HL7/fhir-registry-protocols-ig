The CREDS IG relies on simple profiles to the StructureDefinition resource to require the type of definition and the mandatory mapping fields.  These are used to create logical models for the data flow.  These logical models are expressed as StructureDefinitions with the submitted data being a StructureDefinition with assigned values for the profiles to assign the data to in the resulting reporting bundle.

Additionally, the logical model shows the mappings for FHIR, CDA and/or HL7 V2 segments.  With none of these mappings, it is assumed that the data will need to be manually sourced from other systems or data exchange methods. Such methods should be included but may not have a direct mapping path.

### Resource Profiles
[CREDSStructureDefinition](StructureDefinition-CREDSStructureDefinition.html): The StructureDefinition for use with CREDS mapping creating the base mappings for FHIR, CDA and V2.  

<!--
[CREDSElementDefinition](StructureDefinition-CREDSElementDefinition.html): ElementDefinition for use within CREDS that sets the base requirements for creating the logical model including required mappings and Profile for Bundle inclusion.
-->
For proper setup of the logical model, the mapping choices (FHIR, CDA, V2, Output)  have entries in the StructureDefinition mapping elements and each element mapping sub-elements, where appropriate  For example, if there are to be FHIR and Output mappings (Output is required) in the logical model then the base mapping elements needs to include both FHIR and Output entries.  Please see the [CathPCI example](StructureDefinition-ACCNCDRCathPCI.html) for an example structure. The Profile defines the four basic ones but more can be added as needed.  

[CREDSSubmission](StructureDefinition-CREDSSubmission.html): The Primary Bundle for use with CREDS.  This includes basic structure to outline how submitter and subject information is used.  If not using the CREDS Bundle for submission due to the requirements of another FHIR IG, you should refer to that FHIR IG for details.