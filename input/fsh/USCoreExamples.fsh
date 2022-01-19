Alias: $v2-0203 = http://terminology.hl7.org/CodeSystem/v2-0203

Instance: USCorePractitionerexample
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner
Title: "Practitioner 1 Example"
Description: "This is a practitioner 1 example for the *US Core Practitioner Profile"
Usage: #example

* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner"
* identifier[NPI].value = "9941339108"
* identifier[1].system = "http://www.acme.org/practitioners"
* identifier[1].value = "25456"
* name.family = "Bone"
* name.given = "Ronald"
* name.prefix = "Dr"
* address.use = #home
* address.line = "1003 Healthcare Drive"
* address.city = "Amherst"
* address.state = "MA"
* address.postalCode = "01002"

Alias: RaceAndEthnicityCDC = urn:oid:2.16.840.1.113883.6.238

Instance: USCorePatientexample
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient
Title: "Patient Example"
Description: "This is a patient example for the *US Core Patient Profile"
Usage: #example

* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
* extension[0].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = RaceAndEthnicityCDC#2106-3 "White"
* extension[=].extension[+].url = "ombCategory"
* extension[=].extension[=].valueCoding = RaceAndEthnicityCDC#1002-5 "American Indian or Alaska Native"
* extension[=].extension[+].url = "ombCategory"
* extension[=].extension[=].valueCoding = RaceAndEthnicityCDC#2028-9 "Asian"
* extension[=].extension[+].url = "detailed"
* extension[=].extension[=].valueCoding = RaceAndEthnicityCDC#1586-7 "Shoshone"
* extension[=].extension[+].url = "detailed"
* extension[=].extension[=].valueCoding = RaceAndEthnicityCDC#2036-2 "Filipino"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "Mixed"
* extension[=].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
* extension[+].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = RaceAndEthnicityCDC#2135-2 "Hispanic or Latino"
* extension[=].extension[+].url = "detailed"
* extension[=].extension[=].valueCoding = RaceAndEthnicityCDC#2184-0 "Dominican"
* extension[=].extension[+].url = "detailed"
* extension[=].extension[=].valueCoding = RaceAndEthnicityCDC#2148-5 "Mexican"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "Hispanic or Latino"
* extension[=].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex"
* extension[=].valueCode = #F
* identifier.use = #usual
* identifier.type = $v2-0203#MR "Medical Record Number"
* identifier.type.text = "Medical Record Number"
* identifier.system = "http://hospital.smarthealthit.org"
* identifier.value = "1032702"
* active = true
* name[0].family = "Shaw"
* name[=].given[0] = "Amy"
* name[=].given[+] = "V."
* name[=].period.start = "2016-12-06"
* name[=].period.end = "2020-07-22"
* name[+].family = "Baxter"
* name[=].given[0] = "Amy"
* name[=].given[+] = "V."
* name[=].suffix = "PharmD"
* name[=].period.start = "2020-07-22"
* telecom[0].system = #phone
* telecom[=].value = "555-555-5555"
* telecom[=].use = #home
* telecom[+].system = #email
* telecom[=].value = "amy.shaw@example.com"
* gender = #female
* birthDate = "1987-02-20"
* address[0].line = "49 Meadow St"
* address[=].city = "Mounds"
* address[=].state = "OK"
* address[=].postalCode = "74047"
* address[=].country = "US"
* address[=].period.start = "2016-12-06"
* address[=].period.end = "2020-07-22"
* address[+].line = "183 Mountain View St"
* address[=].city = "Mounds"
* address[=].state = "OK"
* address[=].postalCode = "74048"
* address[=].country = "US"
* address[=].period.start = "2020-07-22"


Instance: VeterinariansHospital
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-organization
Title: "Veterinarian's Hospital"
Description: "Example of a US Core R4 Organization"
Usage:  #example

* active = true
* name = "Veterinarian's Hospital"

Instance: ExampleDischarge
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter
Title: "An Example Discharge Encounter"
Description: "Example of a US Core R4 Encounter"
Usage:  #example

* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#ACUTE
* type =  http://snomed.info/sct#448337001 "Telemedicine consultation with patient"
* subject = Reference(USCorePatientexample)
* reasonCode = http://snomed.info/sct#1917008 "Patient discharge, deceased, medicolegal case"

Instance: CREDSEncounter
InstanceOf: http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter
Title: "Example Encounter"
Description: "Example Encounter for use within the Example Notification Bundle"
Usage: #example

* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB
* type = http://www.ama-assn.org/go/cpt#99201
* subject = Reference(USCorePatientexample)
* participant.individual = Reference(USCorePractitionerexample)
* location.location = Reference(Enc-location)
* period.start = 2020-10-01T17:00:14-05:00
* period.end = 2020-10-01T18:00:14-05:00

Instance: Enc-location
InstanceOf: Location
Title: "Example Location"
Description: "Example Location for use within the Example Encounter"
Usage: #example
* status = #active
* name = "North Wing of Verteranairan's Hospital"
* managingOrganization = Reference(VeterinariansHospital)