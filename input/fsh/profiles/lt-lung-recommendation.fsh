CodeSystem: LungRecommendationLt
Id: lung-recommendation-lt
Title: "Lung Screening Recommendation Codes"
Description: """
Recommendation codes used in the Lithuanian lung cancer early diagnosis
programme for follow-up and referral actions after LUNG-RADS assessment.

These codes represent the recommended next clinical action based on the
radiological conclusion and programme rules.
"""
* ^status = #active
* ^experimental = false
* ^content = #complete
* #repeat-36m "Repeat LDCT after 36 months"
* #insufficient-prior-images "Insufficient data - previous images required for comparison"
* #followup-12m "Follow-up LDCT after 12 months"
* #followup-6m "Follow-up LDCT after 6 months"
* #followup-3m "Follow-up LDCT after 3 months"
* #pulmonologist-consult "Refer for pulmonologist consultation in an oncology cluster institution"
* #specialist-consult "Refer for consultation to an appropriate specialist"


ValueSet: LungRecommendationVS
Id: lung-recommendation-vs
Title: "Lung Screening Recommendation Value Set"
Description: """
Allowed recommendation codes used in the Lithuanian lung cancer early
diagnosis programme for follow-up and referral decisions.
"""
* ^status = #active
* ^experimental = false
* include codes from system LungRecommendationLt


Profile: LungRecommendationObservationLt
Parent: LTBaseObservation
Id: lung-recommendation-observation-lt
Title: "Observation: Lung Screening Recommendation"
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
* valueCodeableConcept from LungRecommendationVS (required)
* performer 0..*
* performer only Reference(PractitionerLt)
* derivedFrom 0..*
* derivedFrom only Reference(LungRadsAssessmentLt)
* note 0..*


// Example Instance 1
Instance: observation-lung-recommendation-3m-example
InstanceOf: LungRecommendationObservationLt
Usage: #example
Title: "Observation: Lung Screening Recommendation - 3 Month Follow-up"
Description: "Example of a recommendation for follow-up LDCT after 3 months."
* status = #final
* code = $sct#424900004 "Recommendation - action"
* subject = Reference(example-patient-male)
* performer = Reference(example-practitioner)
* effectiveDateTime = "2025-09-22T10:35:00Z"
* valueCodeableConcept = LungRecommendationLt#followup-3m "Follow-up LDCT after 3 months"
* derivedFrom = Reference(observation-lung-rads-category-4a-example)
* note.text = "Short-term follow-up LDCT is recommended in 3 months based on the screening findings."


// Example Instance 2
Instance: observation-lung-recommendation-pulmonologist-example
InstanceOf: LungRecommendationObservationLt
Usage: #example
Title: "Observation: Lung Screening Recommendation - Pulmonologist Consultation"
Description: "Example of a recommendation to refer the patient for pulmonologist consultation."
* status = #final
* code = $sct#424900004 "Recommendation - action"
* subject = Reference(example-patient-male)
* performer = Reference(example-practitioner)
* effectiveDateTime = "2025-09-22T11:00:00Z"
* valueCodeableConcept = LungRecommendationLt#pulmonologist-consult "Refer for pulmonologist consultation in an oncology cluster institution"
* note.text = "Patient should be referred for pulmonologist consultation in an oncology cluster institution."