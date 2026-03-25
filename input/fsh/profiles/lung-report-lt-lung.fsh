Profile: LungReportLtLung
Parent: ImagingReportLt
Id: lung-report-lt-lung
Title: "Lung LDCT Report (LT Lung)"
Description: "Overall lung LDCT diagnostic report covering the low-dose chest computed tomography screening pathway. Wraps a LungCompositionLtLung and aggregates structured results including LUNG-RADS assessments, pulmonary nodule observations, incidental findings, and follow-up recommendations."
* ^url = $lung-report-lt-lung-url
* ^status = #active

* code.coding contains doc-type 1..1
* code.coding[doc-type] = $sct#4321000179101 "Computed tomography imaging report (record artifact)"

* encounter only Reference(EncounterLt)

* composition only Reference(LungCompositionLtLung)

* result MS
* result ^short = "Lung screening results: LUNG-RADS assessments, nodule observations, incidental findings, recommendations"
* result ^definition = "References to Observation resources that carry the structured findings of the LDCT screening process."
