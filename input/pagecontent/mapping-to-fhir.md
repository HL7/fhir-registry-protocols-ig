
## Assumptions
CREDS assumes that mappings are performed by executing the FHIR Path expressions found in the mapping against all of the available relevant data for the patient.
For each information model supported (FHIR, V2 and CDA), there may be different ways of collecting the relevant data.

The mappings assume that the data collecting actor has some way of collecting all of the relevant data (e.g., in FHIR, patient/{id}/$everything)

## Canonical Model
The FHIR Canonical Model for mapping in CREDS consists of the following:

* [FHIR US Core](https://hl7.org/fhir/us/core/STU4)
* [FHIR Release 4](http://hl7.org/fhir/R4/)

FHIRPath expressions mapping to this model should be written in the following form:

    ResourceName '.' ... where(queryPart) ... '.' ... where(filteringPart)

    Ejection Fraction: Observation.where(code='ejection fraction' & date.gt(%period.start - 2 weeks)).where(value.lte(6%))
    Vital Signs: Observation.component.where(code.memberOf('http://hl7.org/fhir/ValueSet/observation-vitalsignresult'))
    Lymph Nodes Collected : Observation.where(code='lymph nodes collected' & effective.equals(%encounter.start).value  [Not quite semantically correct](#tbd)
    Date of Finding for Lymph Nodes Collected : Observation.where(code='lymph nodes collected').date
    Date of Surgery : Observation.where(code='lymph nodes collected').effectiveDate
    Condition : Condition.where(code.memberOf(%HeartAttackValueSet))

[Need to address](#todo):
1. What is allowed in first part (and relationship to US Core required search parameters)
2. When not defined in US Core, what is expected minimum set (e.g., code, date) using lt/gt/eq
3. Convert FHIRPath to query string

### Resource Name

### Query Part

### Filtering Part

## Extensions to the Canonical Model
The canonical model can be extended using US Realm FHIR Profiles, or other FHIR Implementation Guides.

The extensions that can be used for CREDS must be declared in the capability statement [How ?](#tbd)
{we will need to look in the capability statement to see where this would be expressed},
the consumer of FHIR Resources will express which queries it is capable of supporting by referencing other IGs
