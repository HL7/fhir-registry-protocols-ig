Profile: CREDSOperationOutcome
Parent: OperationOutcome
Id: CREDSOperationOutcome
Title: "CREDSOperationOutcome"
Description: """The Profile for validation responses for CREDS submitted bundles.  
Each Operation Outcome begins with the Submission identifier as the first issue entry.  Each following issue element contains a single validation message
"""
* issue ^slicing.discriminator.type = #pattern
* issue ^slicing.discriminator.path = "code"
* issue ^slicing.rules = #closed
* issue ^slicing.ordered = true
* issue ^slicing.description = "Slice based on code"
* issue contains Submission 1..1 and Validation 1..*
    
* issue[Submission].severity = #information (exactly)
* issue[Submission].code = #informational (exactly)
* issue[Submission].details 0..0
* issue[Submission].diagnostics ^comment = "Record ID of the Bundle within the Submission"
* issue[Submission].location 0..0
* issue[Submission].expression 0..0

* issue[Validation].code = #processing (exactly)
* issue[Validation].details ^comment = "Custom error code from Registry indivating validation issue"
* issue[Validation].diagnostics ^comment = "Full text of the error reason"
* issue[Validation].location 0..0
* issue[Validation].expression 1..*

Instance: ACCCathPCIOutcome
InstanceOf: CREDSOperationOutcome
Usage: #example
Title: "ACCCathPCIOutcome"
Description: "Example feedback from a CathPCI Submission"
* issue[Submission].diagnostics = "CPCIExample"

* issue[Validation][+]
  * severity = #error
  * details = $accerror#RX3485
  * expression = "Demographics"
* issue[Validation][+]
  * severity = #error
  * details = $accerror#DL3487
  * expression = "Demographics"
* issue[Validation][+]
  * severity = #error
  * details = $accerror#PC2850
  * expression = "historyAndRiskFactors.priorPercutaneousCoronaryIntervention"
* issue[Validation][+]
  * severity = #error
  * details = $accerror#RQ2425
  * expression = "Procedure.dateAndTime"
* issue[Validation][+]
  * severity = #error
  * details = $accerror#CM2916
  * expression = "Procedure.diagnosticCoronaryAngiographyProcedure"
