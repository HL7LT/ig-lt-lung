Profile: LungRecommendationObservationLtLung
Parent: ObservationLt
Id: lung-recommendation-observation-lt-lung
Title: "Lung Screening Recommendation"
Description: """
Recommendation for follow-up or referral after low-dose chest CT (LDCT)
screening examination in the Lithuanian lung cancer early diagnosis programme.

This observation captures the recommended next action following the final
LUNG-RADS assessment.

SNOMED CT code 424900004 is used for the observation concept
'Recommendation - action (qualifier value)'.
The actual recommendation value is represented using a local code system,
because the source dataset provides programme-specific recommendation options.
"""
* ^url = $lung-recommendation-observation-lt-lung-url
* status 1..1
* status = #final
* code 1..1
* code = $sct#424900004 "Recommendation - action"
* subject 1..1
* subject only Reference(PatientLt)
* encounter 0..1
* encounter only Reference(EncounterLt)
* effective[x] 1..1
* effective[x] only dateTime
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from LungRecommendationVSLtLung (required)
* performer 0..*
* performer only Reference(PractitionerLt)
* derivedFrom 0..*
* derivedFrom only Reference(LungRadsAssessmentLtLung)
* note 0..*
