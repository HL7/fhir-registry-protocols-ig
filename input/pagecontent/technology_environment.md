Information for submission may come from myriad sources, some of which are available for automatic retrieval, such as:

*  Electronic Health Record (EHR) systems
    * Departmental Systems
    * Emergency Department (ED) systems
    * ICU and/or Nursing Central Monitoring systems (or stations)
    * Labor and Delivery systems
    * Laboratory Information Systems (LIS)
    * Picture Archival and Communication Systems (PACS)
* Radiology Information Systems (RIS)
* Clinical Data Repository (CDR)
* Care Management Systems
* Electronic Laboratory Reporting Solutions

Other systems, such as EMS, may require manual intervention or interface development to convert the data to CREDS data sumission format.
<figure>
{%include datasources.svg %}
<figcaption>Data Sources Structure</figcaption>
</figure>
### Systems Having Clinical Data

Systems in this category have access to some or all of the health records (problems, medications, lab results, procedures, etc.) for a patient, and  provide information as well as associated problems, patient demographics, and patient acuity (severity of illness) data.

#### EHR Systems

Comprehensive Hospital EHR solutions may include the capabilities of the other systems listed above, or may be integrated with other systems but not have direct access to all data available to the other systems. Even when those capabilities are available in the comprehensive EHR solution, other solutions may still be chosen by the facility for a variety of reasons (features, cost, legacy, et cetera).

#### Departmental Systems

Departmental systems are specialized “EHR” systems facilitating the operations of a departmental setting. Several departmental systems are described in more detail in subsections below.

#### Emergency Department Systems

Emergency department systems are simply specialized EHR systems that facilitate patient care in an emergency room setting. They may also support or be integrated with central monitoring solutions enabling ED staff to monitor the status of patients.

#### Labour and Delivery Systems

Labour and Delivery systems are another form of specialized EHR system that facilitate treatment of mothers about to give birth in the hospital. They generally support the ongoing monitoring of the pregnant mother, and integrate with specialized equipment used to support newborn delivery (e.g., fetal heart rate monitors, infusion pumps used for anesthesia, et cetera), as well as routine charting while a mother is still in labor but not yet ready to deliver.

#### ICU/Central Monitoring Systems

These systems bring real-time data from the EHR together with a variety of monitoring and treatment equipment, often to provide clinical decision support for patients needing intensive ongoing treatment and monitoring. As a result, these systems have awareness of the use of medical equipment (e.g., ventilators), patient acuity, disease progression, as well as the in-use status of ICU beds, and perhaps the total bed capacity of an ICU (but not necessarily the availability).

#### Laboratory Information Systems (LIS)

These systems are used to track and control incoming laboratory orders, to manage laboratory automation equipment, and to manage outgoing reports on orders. They have some access to patient clinical and demographic data, usually enough to facilitate the interpretation of the laboratory test, but may not have access to more data. Some data available in an LIS might be used to assess patient acuity, but the EHR would be a better source of this assessment.

#### Picture Archival and Communication Systems (PACS)

Within an imaging center or department, the PACS provides storage for images generated from various imaging procedures (CT, MRI, Ultrasound, X-Ray, et cetera) and in some solutions, the diagnostic reports (structured or unstructured) that are generated based on those images.

These systems will generally be aware of the types of imaging studies performed, the patients on whose behalf these studies were performed, the dates and times of the procedure, and possibly the results (in structured reports) of the study.

#### Radiology Information Systems (RIS)

These RIS is a departmental systems used in imaging centers or departments to manage the imaging workflow in the department. The RIS provide a means by which imaging procedures are scheduled and coordinated across the necessary equipment, personnel (e.g., imaging technicians, reading radiologists), and patients, and through which orders are received, and results transmitted back to ordering providers.

These systems will generally be aware of the procedures being requested, the results of those procedures, the dates and times of those procedures, and the number and types of procedures performed on behalf of different parties (e.g., ordering physicians and organizations).

#### Care Management Systems

Care Management Systems support referral and transition between the hospital and follow-up care environments (e.g., post-acute care, rehabilitation referrals), or referrals to other types of care (tertiary care from ED, referral to behavioral health, etc.). These are often used to support discharge/transfer planning, and may also involve coordination with payers to ensure treatment will be covered at the referred to facility.