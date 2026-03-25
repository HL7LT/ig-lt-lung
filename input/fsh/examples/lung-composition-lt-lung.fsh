// =============================================================================
// Example: Lung LDCT Composition
// =============================================================================

Instance: lung-composition-ldct-example
InstanceOf: LungCompositionLtLung
Usage: #example
Title: "Composition: LDCT Screening Report (example)"
Description: "Example lung LDCT composition with findings (solid nodule, coronary calcification), LUNG-RADS 4A impression, and 3-month follow-up recommendation."
* status = #final
* type.coding[eu-template] = $Hl7EuDocumentTypes#imaging-report-v0-0-1 "Imaging Report V0.0.1"
* category[imaging] = $loinc#18748-4 "Diagnostic imaging study"
* identifier.system = "https://hl7.lt/fhir/lung/composition-id"
* identifier.value = "LDCT-2025-001"
* subject = Reference(example-patient-male)
* date = "2025-11-20T15:00:00Z"
* author[author] = Reference(PractitionerRole/example-practitioner-role)
* title = "Low-Dose Chest CT Screening Report"
* extension[diagnosticreport-reference].valueReference = Reference(diagnosticreport-lung-report-example)

// Events
* event[imagingstudy].detail = Reference(ImagingStudy/example-imaging-study-ldct)
* event[imagingstudy].detail.concept = $dicom-dcm#CT "Computed Tomography"
* event[procedure].detail = Reference(Procedure/example-procedure-ldct)
* event[procedure].detail.concept = $sct#16334891000119106 "Low dose computed tomography of chest without contrast (procedure)"

// Imaging Study section
* section[imagingstudy].code = $loinc#18726-0
* section[imagingstudy].title = "Imaging Study"
* section[imagingstudy].entry[imagingstudy] = Reference(ImagingStudy/example-imaging-study-ldct)

// Order section
* section[order].code = $loinc#55115-0 "Requested imaging studies information Document"
* section[order].title = "Order"
* section[order].emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#unavailable "Unavailable"

// History section
* section[history].code = $loinc#11329-0 "History general Narrative - Reported"
* section[history].title = "History"
* section[history].text.status = #generated
* section[history].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p>Active smoker, 30 pack-years. No prior chest CT.</p></div>"

// Procedure section
* section[procedure].code = $loinc#55111-9 "Current imaging procedure descriptions Document"
* section[procedure].title = "Procedure"
* section[procedure].entry[procedure] = Reference(Procedure/example-procedure-ldct)

// Comparison section
* section[comparison].code = $loinc#18834-2 "Radiology Comparison study (narrative)"
* section[comparison].title = "Comparison"
* section[comparison].emptyReason = http://terminology.hl7.org/CodeSystem/list-empty-reason#unavailable "Unavailable"

// Findings section
* section[findings].code = $loinc#59776-5 "Findings"
* section[findings].title = "Findings"
* section[findings].entry[pulmonaryNodule] = Reference(observation-pulmonary-nodule-solid-example)
* section[findings].entry[incidentalFinding] = Reference(observation-incidental-coronary-calcification-example)

// Impression section
* section[impression].code = $loinc#19005-8 "Radiology Imaging study [Impression] (narrative)"
* section[impression].title = "Impression"
* section[impression].entry[lungRads] = Reference(observation-lung-rads-4a-example)

// Recommendation section
* section[recommendation].code = $loinc#18783-1 "Radiology Study recommendation (narrative)"
* section[recommendation].title = "Recommendation"
* section[recommendation].entry[lungRecommendation] = Reference(observation-lung-recommendation-3m-example)

// --- Supporting resources referenced by composition ---

Instance: example-imaging-study-ldct
InstanceOf: ImagingStudy
Usage: #example
Title: "ImagingStudy: LDCT Screening (example)"
Description: "Example LDCT imaging study for lung cancer screening."
* status = #available
* subject = Reference(example-patient-male)
* started = "2025-11-20T14:30:00Z"
* modality = $dicom-dcm#CT "Computed Tomography"

Instance: example-procedure-ldct
InstanceOf: Procedure
Usage: #example
Title: "Procedure: LDCT Screening (example)"
Description: "Example LDCT screening procedure."
* status = #completed
* code = $sct#16334891000119106 "Low dose computed tomography of chest without contrast (procedure)"
* subject = Reference(example-patient-male)
* occurrenceDateTime = "2025-11-20T14:30:00Z"
