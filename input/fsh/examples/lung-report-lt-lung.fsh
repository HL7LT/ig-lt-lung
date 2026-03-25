// =============================================================================
// Example: Lung LDCT Diagnostic Report
// =============================================================================

Instance: diagnosticreport-lung-report-example
InstanceOf: LungReportLtLung
Usage: #example
Title: "DiagnosticReport: LDCT Screening Report (example)"
Description: "Complete LDCT screening report with composition, LUNG-RADS 4A assessment, solid nodule observation, incidental coronary calcification, and 3-month follow-up recommendation."
* status = #final
* code.coding[doc-type] = $sct#4321000179101 "Computed tomography imaging report (record artifact)"
* code.coding[eu-template] = $Hl7EuDocumentTypes#imaging-report-v0-0-1 "Imaging Report V0.0.1"
* category[imaging] = $loinc#18748-4 "Diagnostic imaging study"
* subject = Reference(example-patient-male)
* effectiveDateTime = "2025-11-20T14:30:00Z"
* issued = "2025-11-20T16:00:00+02:00"
* performer[author] = Reference(PractitionerRole/example-practitioner-role)
* composition = Reference(lung-composition-ldct-example)
* result[0] = Reference(observation-lung-rads-4a-example)
* result[+] = Reference(observation-pulmonary-nodule-solid-example)
* result[+] = Reference(observation-incidental-coronary-calcification-example)
* result[+] = Reference(observation-lung-recommendation-3m-example)
* conclusion = "LUNG-RADS 4A: Suspicious solid nodule in right upper lobe (9mm). Moderate coronary artery calcification. Recommend 3-month follow-up LDCT."

Instance: example-practitioner-role
InstanceOf: PractitionerRoleLt
Usage: #example
Title: "PractitionerRole: Radiologist (example)"
Description: "Example radiologist practitioner role for LDCT reporting."
* practitioner = Reference(example-practitioner)
* code = $sct#66862007 "Radiologist (occupation)"
