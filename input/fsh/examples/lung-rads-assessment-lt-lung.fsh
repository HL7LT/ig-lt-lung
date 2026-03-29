Instance: observation-lung-rads-4a-example
InstanceOf: LungRadsAssessmentLtLung
Usage: #example
Title: "Observation: LUNG-RADS Category 4A (example)"
Description: "Final LUNG-RADS category 4A assessment indicating a suspicious pulmonary lesion requiring short-term follow-up."
* status = #final
* code = $sct#1362105002 "Lung Imaging Reporting and Data System category"
* subject = Reference(patient-male-example)
* performer = Reference(practitioner-radiologist-example)
* effectiveDateTime = "2025-09-22T10:30:00Z"
* valueCodeableConcept = LungRadsCategory#4A "Category 4A – Suspicious"
* method.text = "LUNG-RADS v2022"
* note.text = "Suspicious pulmonary lesion detected in the right upper lobe. Short-term follow-up LDCT is recommended."


Instance: observation-lung-rads-4as-example
InstanceOf: LungRadsAssessmentLtLung
Usage: #example
Title: "Observation: LUNG-RADS 4A with S modifier (example)"
Description: "Final LUNG-RADS category 4A assessment with S modifier indicating a suspicious pulmonary lesion and a significant incidental extrapulmonary finding."
* status = #final
* code = $sct#1362105002 "Lung Imaging Reporting and Data System category"
* subject = Reference(patient-male-example)
* performer = Reference(practitioner-radiologist-example)
* effectiveDateTime = "2025-09-22T10:45:00Z"
* valueCodeableConcept = LungRadsCategory#4A "Category 4A – Suspicious"
* method.text = "LUNG-RADS v2022"
* component.code = $sct#246513007 "Revision value"
* component.valueCodeableConcept = LungRadsModifier#S "Modifier S – Significant incidental finding"
* note.text = "Suspicious pulmonary lesion detected. Significant incidental extrapulmonary finding also present; overall assessment expressed as 4AS."
