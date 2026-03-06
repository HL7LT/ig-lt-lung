CodeSystem: LungRadsCategoryLt
Id: lung-rads-category-lt
Title: "LUNG-RADS Assessment Categories"
Description: """
Categories used in the Lithuanian lung cancer early diagnosis programme
based on the LUNG-RADS classification system.
"""
* ^status = #active
* ^experimental = false
* ^content = #complete
* #0  "Category 0 – Incomplete"
* #1  "Category 1 – Negative"
* #2  "Category 2 – Benign appearance"
* #3  "Category 3 – Probably benign"
* #4A "Category 4A – Suspicious"
* #4B "Category 4B – Very suspicious"
* #4X "Category 4X – Extremely suspicious"
* #S  "Category S – Significant incidental finding"


ValueSet: LungRadsCategoryVS
Id: lung-rads-category-vs
Title: "LUNG-RADS Assessment Category"
Description: """
Allowed LUNG-RADS assessment categories used in the Lithuanian
lung cancer early diagnosis programme.
"""
* ^status = #active
* ^experimental = false
* include codes from system LungRadsCategoryLt


Profile: LungRadsAssessmentLt
Parent: LTBaseObservation
Id: lung-rads-assessment-lt
Title: "Observation: LUNG-RADS Assessment"
Description: """
LUNG-RADS assessment category assigned to a low-dose CT (LDCT)
screening examination in the Lithuanian lung cancer early diagnosis programme.

The observation represents the final radiological assessment that determines
the follow-up recommendation and screening pathway.
"""
* status 1..1
* status = #final
* code 1..1
* code = $sct#1362105002 "Lung Imaging Reporting and Data System category"
* subject 1..1
* subject only Reference(LTBasePatient)
* encounter 0..1
* encounter only Reference(LTBaseEncounter)
* effective[x] 1..1
* effective[x] only dateTime
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from LungRadsCategoryVS (required)
* performer 0..1
* performer only Reference(LTBasePractitioner)
* derivedFrom 0..1
* derivedFrom only Reference(ImagingStudy)
* note 0..*


// Example Instance
Instance: observation-lung-rads-example
InstanceOf: LungRadsAssessmentLt
Usage: #example
Title: "Observation: LUNG-RADS Assessment Example"
* status = #final
* subject = Reference(example-patient-male)
* performer = Reference(example-practitioner)
* effectiveDateTime = "2025-09-22T10:30:00Z"
* valueCodeableConcept = LungRadsCategoryLt#4A
* note.text = "Suspicious pulmonary nodule detected in right upper lobe. Short-term follow-up CT recommended."