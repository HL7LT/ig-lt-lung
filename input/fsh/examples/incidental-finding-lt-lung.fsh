// =============================================================================
// Examples: Incidental findings from LDCT screening
// =============================================================================

Instance: observation-incidental-coronary-calcification-example
InstanceOf: IncidentalFindingLtLung
Usage: #example
Title: "Observation: Coronary Artery Calcification, Moderate (example)"
Description: "Incidental finding of moderate coronary artery calcification detected during LDCT screening."
* status = #final
* code = $sct#404684003 "Clinical finding (finding)"
* subject = Reference(example-patient-male)
* effectiveDateTime = "2025-11-20T14:30:00Z"
* performer = Reference(example-practitioner)
* valueCodeableConcept = $sct#445512009 "Calcification of coronary artery (disorder)"
* component[severity].code = $sct#246112005 "Severity (attribute)"
* component[severity].valueCodeableConcept = $sct#6736007 "Moderate (severity modifier) (qualifier value)"

Instance: observation-incidental-emphysema-example
InstanceOf: IncidentalFindingLtLung
Usage: #example
Title: "Observation: Pulmonary Emphysema, Severe (example)"
Description: "Incidental finding of severe (>50%) pulmonary emphysema detected during LDCT screening."
* status = #final
* code = $sct#404684003 "Clinical finding (finding)"
* subject = Reference(example-patient-male)
* effectiveDateTime = "2025-11-20T14:30:00Z"
* performer = Reference(example-practitioner)
* valueCodeableConcept = $sct#87433001 "Pulmonary emphysema (disorder)"
* component[severity].code = $sct#246112005 "Severity (attribute)"
* component[severity].valueCodeableConcept = $sct#24484000 "Severe (severity modifier) (qualifier value)"

Instance: observation-incidental-pleural-effusion-example
InstanceOf: IncidentalFindingLtLung
Usage: #example
Title: "Observation: Bilateral Pleural Effusion (example)"
Description: "Incidental finding of bilateral pleural effusion detected during LDCT screening."
* status = #final
* code = $sct#404684003 "Clinical finding (finding)"
* subject = Reference(example-patient-male)
* effectiveDateTime = "2025-11-20T14:30:00Z"
* performer = Reference(example-practitioner)
* valueCodeableConcept = $sct#365664001 "Finding of pleural fluid appearance (finding)"
* component[laterality].code = $sct#272741003 "Laterality (qualifier value)"
* component[laterality].valueCodeableConcept = $sct#51440002 "Right and left (qualifier value)"
