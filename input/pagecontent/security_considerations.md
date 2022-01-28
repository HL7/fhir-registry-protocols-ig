The logical models used for creating the submission definition will be, at most, [Business Sensitive](https://www.hl7.org/fhir/security.html#Business).  Most should be [Anonymous Read](https://www.hl7.org/fhir/security.html#Anonymous) as they represent data needs, not patient data.

The submission map will have specific patient identifying information including Name and/or MRN and should be classified [Patient Sensitive](https://www.hl7.org/fhir/security.html#Patient) and all interchange should use TLS 1.2 or greater encryption following [BCP 195](https://www.rfc-editor.org/info/bcp195).  The final Bundle of patient resources with completed patient data is [Patient Sensitive](https://www.hl7.org/fhir/security.html#Patient) and should be treated as should be done with PHI.

In some cases, the use of this data may require user authentication for purposes unrelated to the sensitivity of the data.

Given this assessment, the main Security Considerations are focused on:

* Assuring the data published is authentic to the organization publishing the data. That is that a consumer of the API can be given assurances that they are connecting to the authentic service endpoint they intended to connect to. This functionally is provided by common use of TLS with server sided authentication, commonly used in HTTPS.
* Taking care to validate that the server certificate validated and authenticated by TLS/HTTPS is the server intended to connect to. This is important management of client side certificate trust store.
* Assuring the data communicated is not modified in transit. The consumer of the API can be given assurances that they are retrieving exactly the data that is published. This functionality is provided by common use of TLS with integrity cyphers such as SHA256.
* Encrypting the data. When evaluated or supplemental data is not used, the confidentiality of the communicated data is not critical, but having it encrypted may prevent unidentified risks. Given that common use of TLS includes common use of encryption cyphers such as AES256, encryption is strongly recommended for consistency sake.
* The service may choose to request a security token be obtained to provide identity of the client. When a client token is provided the server will have more rich information to make an access control decision or record in an audit log.
* The client and server should record an Audit Log event such as FHIR [AuditEvent](http://hl7.org/fhir/auditevent.html). 
#### Local Access Control
The maintenance of the data on the client or server is not specified in this implementation guide. Security considerations must be applied in systems design to assure that the data is appropriately protected from inappropriate use and modification. 
#### Purpose Of Use restrictions

Given that the use-case for this implementation guide is to support Registry reporting, the use of client context PurposeOfUse of [PUBHLTH](http://hl7.org/fhir/R4/v3/ActReason/cs.html#v3-ActReason-PUBHLTH) is recommended. 

The use of data returned by this API should be limited to the Public Health use-case. Re-purposing the data for other uses, such as re-identification, should be considered a violation of the API intention.

The setting of the PurposeOfUse to PUBHLTH may be addressed through policy agreements and thus not communicated in the API communications.