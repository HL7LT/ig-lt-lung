// =============================================================================
// Example: Lung LDCT Diagnostic Report
// =============================================================================

Instance: diagnosticreport-lung-report-example
InstanceOf: LungReportLtLung
Usage: #example
Title: "DiagnosticReport: LDCT Screening Report (example)"
Description: "LDCT screening report aggregating LUNG-RADS 4A assessment, solid nodule in right upper lobe, moderate coronary calcification, and 3-month follow-up recommendation."
* status = #final
* code.coding[doc-type] = $sct#4321000179101 "Computed tomography imaging report (record artifact)"
* code.coding[eu-template] = $Hl7EuDocumentTypes#imaging-report-v0-0-1 "Imaging Report V0.0.1"
* category[imaging] = $loinc#18748-4 "Diagnostic imaging study"
* subject = Reference(patient-male-example)
* effectiveDateTime = "2025-11-20T14:30:00Z"
* issued = "2025-11-20T16:00:00+02:00"
* performer[author] = Reference(PractitionerRole/practitionerrole-radiologist-example)
* composition = Reference(lung-composition-ldct-example)
* result[lungRads] = Reference(observation-lung-rads-4a-example)
* result[pulmonaryNodule] = Reference(observation-pulmonary-nodule-solid-example)
* result[incidentalFinding] = Reference(observation-incidental-coronary-calcification-example)
* result[recommendation] = Reference(observation-lung-recommendation-3m-example)
* conclusion = "LUNG-RADS 4A: Suspicious solid nodule in right upper lobe (9mm). Moderate coronary artery calcification. Recommend 3-month follow-up LDCT."

Instance: practitionerrole-radiologist-example
InstanceOf: PractitionerRoleLt
Usage: #example
Title: "PractitionerRole: Radiologist (example)"
Description: "Radiologist practitioner role responsible for LDCT screening interpretation and reporting."
* practitioner = Reference(practitioner-radiologist-example)
* code = $sct#66862007 "Radiologist (occupation)"
