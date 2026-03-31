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

// --- Performer: reporting specialist and technologist ---
* performer 1..*
* performer only Reference(PractitionerLt or PractitionerRoleLt or OrganizationLt)
* performer ^short = "Specialist(s) involved in the LDCT screening (technologist, reporting radiologist)"

// --- Result slicing ---
* result MS
* result ^slicing.discriminator.type = #profile
* result ^slicing.discriminator.path = "$this"
* result ^slicing.ordered = false
* result ^slicing.rules = #open
* result contains
    lungRads 0..* and
    pulmonaryNodule 0..* and
    incidentalFinding 0..* and
    mediastinalMass 0..* and
    kidneyLesion 0..* and
    adrenalLesion 0..* and
    recommendation 0..*
* result[lungRads] only Reference(LungRadsAssessmentLtLung)
* result[lungRads] ^short = "LUNG-RADS assessment"
* result[pulmonaryNodule] only Reference(PulmonaryNoduleObservationLtLung)
* result[pulmonaryNodule] ^short = "Pulmonary nodule observation"
* result[incidentalFinding] only Reference(IncidentalFindingLtLung)
* result[incidentalFinding] ^short = "Incidental finding"
* result[mediastinalMass] only Reference(MediastinalMassLtLung)
* result[mediastinalMass] ^short = "Mediastinal mass"
* result[kidneyLesion] only Reference(KidneyLesionLtLung)
* result[kidneyLesion] ^short = "Kidney lesion"
* result[adrenalLesion] only Reference(AdrenalLesionLtLung)
* result[adrenalLesion] ^short = "Adrenal gland lesion"
* result[recommendation] only Reference(LungRecommendationObservationLtLung)
* result[recommendation] ^short = "Follow-up recommendation"
