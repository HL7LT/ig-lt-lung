Profile: LungRadsAssessmentLtLung
Parent: ObservationLt
Id: lung-rads-assessment-lt-lung
Title: "LUNG-RADS Assessment"
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
* ^url = $lung-rads-assessment-lt-lung-url
* status 1..1
* status = #final
* code 1..1
* code = $sct#1362105002 "Lung Imaging Reporting and Data System category"
* subject 1..1
* subject only Reference(PatientLt)
* encounter 0..1
* encounter only Reference(EncounterLt)
* effective[x] 1..1
* effective[x] only dateTime
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from LungRadsCategoryVSLtLung (required)
* performer 0..*
* performer only Reference(PractitionerLt)
* derivedFrom 0..*
* method 0..1
* method.text ^short = "LUNG-RADS version, e.g. LUNG-RADS v2022"
* component 0..1
* component.code 1..1
* component.code = $sct#246513007 "Revision value"
* component.value[x] 1..1
* component.value[x] only CodeableConcept
* component.valueCodeableConcept from LungRadsModifierVSLtLung (required)
* component ^short = "Optional LUNG-RADS modifier, e.g. S"
* note 0..*
