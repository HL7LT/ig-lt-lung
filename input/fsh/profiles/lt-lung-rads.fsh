CodeSystem: LungRadsCategoryLt
Id: lung-rads-category-lt
Title: "LUNG-RADS Assessment Categories"
Description: """
Main LUNG-RADS assessment categories used in the Lithuanian lung cancer
early diagnosis programme.

These codes represent the primary final assessment category assigned
to the low-dose chest CT screening examination.
"""
* ^status = #active
* ^experimental = false
* ^content = #complete
* #0  "Category 0 – Incomplete"
* #1  "Category 1 – Negative"
* #2  "Category 2 – Benign appearance or behavior"
* #3  "Category 3 – Probably benign"
* #4A "Category 4A – Suspicious"
* #4B "Category 4B – Very suspicious"
* #4X "Category 4X – Extremely suspicious"


CodeSystem: LungRadsModifierLt
Id: lung-rads-modifier-lt
Title: "LUNG-RADS Assessment Modifier"
Description: """
Additional modifier used together with the main LUNG-RADS assessment
category in the Lithuanian lung cancer early diagnosis programme.

The modifier S indicates clinically significant incidental findings that
contribute to the overall assessment string, for example 0S or 4AS.
"""
* ^status = #active
* ^experimental = false
* ^content = #complete
* #S "Modifier S – Significant incidental finding"


ValueSet: LungRadsCategoryVS
Id: lung-rads-category-vs
Title: "LUNG-RADS Assessment Category"
Description: """
Allowed primary LUNG-RADS assessment categories used in the Lithuanian
lung cancer early diagnosis programme.
"""
* ^status = #active
* ^experimental = false
* include codes from system LungRadsCategoryLt


ValueSet: LungRadsModifierVS
Id: lung-rads-modifier-vs
Title: "LUNG-RADS Assessment Modifier"
Description: """
Allowed LUNG-RADS assessment modifier codes used in the Lithuanian
lung cancer early diagnosis programme.
"""
* ^status = #active
* ^experimental = false
* include codes from system LungRadsModifierLt


Profile: LungRadsAssessmentLt
Parent: LTBaseObservation
Id: lung-rads-assessment-lt
Title: "Observation: LUNG-RADS Assessment"
Description: """
LUNG-RADS assessment category assigned to a low-dose chest CT (LDCT)
screening examination in the Lithuanian lung cancer early diagnosis programme.

The observation represents the final radiological assessment that determines
the follow-up recommendation and screening pathway.

SNOMED CT code 1362105002 is used for the observable concept
'Lung Imaging Reporting and Data System category (observable entity)'.
The actual assessment value is represented using a local code system for the
main category values 0, 1, 2, 3, 4A, 4B, and 4X, because separate SNOMED CT
codes for those category values are not provided in the source dataset.
The optional S modifier is represented as a component.
"""
* status 1..1
* status = #final
* code 1..1
* code = $sct#1362105002 "Lung Imaging Reporting and Data System category"
* subject 1..1
* subject only Reference(LTBasePatient)
* encounter 0..1
* encounter only Reference(EncounterLt)
* effective[x] 1..1
* effective[x] only dateTime
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from LungRadsCategoryVS (required)
* performer 0..*
* performer only Reference(LTBasePractitioner)
* derivedFrom 0..*
* method 0..1
* method.text ^short = "LUNG-RADS version, e.g. LUNG-RADS v2022"
* component 0..1
* component.code 1..1
* component.code = $sct#246513007 "Revision value"
* component.value[x] 1..1
* component.value[x] only CodeableConcept
* component.valueCodeableConcept from LungRadsModifierVS (required)
* component ^short = "Optional LUNG-RADS modifier, e.g. S"
* note 0..*


// Example Instance 1
Instance: observation-lung-rads-category-4a-example
InstanceOf: LungRadsAssessmentLt
Usage: #example
Title: "Observation: LUNG-RADS Assessment Category 4A Example"
Description: "Example of a final LUNG-RADS assessment with primary category 4A."
* status = #final
* code = $sct#1362105002 "Lung Imaging Reporting and Data System category"
* subject = Reference(example-patient-male)
* performer = Reference(example-practitioner)
* effectiveDateTime = "2025-09-22T10:30:00Z"
* valueCodeableConcept = LungRadsCategoryLt#4A "Category 4A – Suspicious"
* method.text = "LUNG-RADS v2022"
* note.text = "Suspicious pulmonary lesion detected in the right upper lobe. Short-term follow-up LDCT is recommended."


// Example Instance 2
Instance: observation-lung-rads-category-4as-example
InstanceOf: LungRadsAssessmentLt
Usage: #example
Title: "Observation: LUNG-RADS Assessment Category 4A with S Modifier Example"
Description: "Example of a final LUNG-RADS assessment with primary category 4A and modifier S."
* status = #final
* code = $sct#1362105002 "Lung Imaging Reporting and Data System category"
* subject = Reference(example-patient-male)
* performer = Reference(example-practitioner)
* effectiveDateTime = "2025-09-22T10:45:00Z"
* valueCodeableConcept = LungRadsCategoryLt#4A "Category 4A – Suspicious"
* method.text = "LUNG-RADS v2022"
* component.code = $sct#246513007 "Revision value"
* component.valueCodeableConcept = LungRadsModifierLt#S "Modifier S – Significant incidental finding"
* note.text = "Suspicious pulmonary lesion detected. Significant incidental extrapulmonary finding also present; overall assessment expressed as 4AS."