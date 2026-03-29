Instance: observation-pulmonary-nodule-solid-example
InstanceOf: PulmonaryNoduleObservationLtLung
Usage: #example
Title: "Observation: Solid Nodule – Right Upper Lobe, 11 mm (example)"
Description: "Solid pulmonary nodule in the right upper lobe (11 mm mean diameter, 610 mm3) with spiculated margin detected during LDCT screening."
* status = #final
* code = $sct#427359005 "Solitary nodule of lung"
* subject = Reference(patient-male-example)
* performer = Reference(practitioner-radiologist-example)
* effectiveDateTime = "2025-09-22T10:20:00Z"
* component[noduleType].valueCodeableConcept = $sct#35702001 "Solid"
* bodySite = $sct#42400003 "Structure of upper lobe of right lung"
* component[ctSliceNumber].valueInteger = 84
* component[morphology][0].valueCodeableConcept = $sct#129742005 "Lesion with spiculated margin"
* component[meanDiameter].valueQuantity = 11 'mm'
* component[longAxis].valueQuantity = 12 'mm'
* component[shortAxis].valueQuantity = 10 'mm'
* component[volume].valueQuantity = 610 'mm3'

Instance: observation-pulmonary-nodule-part-solid-example
InstanceOf: PulmonaryNoduleObservationLtLung
Usage: #example
Title: "Observation: Part-Solid Nodule – Left Upper Lobe, 18 mm (example)"
Description: "Part-solid pulmonary nodule in the left upper lobe (18 mm total, 7 mm solid component) with microlobulated margin and subpleural tissue abnormality detected during LDCT screening."
* status = #final
* code = $sct#427359005 "Solitary nodule of lung"
* subject = Reference(patient-male-example)
* performer = Reference(practitioner-radiologist-example)
* effectiveDateTime = "2025-09-22T10:25:00Z"
* component[noduleType].valueCodeableConcept = $pulmonary-nodule-type-local-cs-url#part-solid "Part-solid"
* bodySite = $sct#44714003 "Structure of upper lobe of left lung"
* component[ctSliceNumber].valueInteger = 102
* component[morphology][0].valueCodeableConcept = $sct#129739004 "Lesion with microlobulated margin"
* component[morphology][1].valueCodeableConcept = $sct#896998003 "Structural abnormality of subpleural tissue"
* component[meanDiameter].valueQuantity = 18 'mm'
* component[longAxis].valueQuantity = 20 'mm'
* component[shortAxis].valueQuantity = 16 'mm'
* component[volume].valueQuantity = 1450 'mm3'
* component[solidPartMeanDiameter].valueQuantity = 7 'mm'
* component[solidPartLongAxis].valueQuantity = 8 'mm'
* component[solidPartShortAxis].valueQuantity = 6 'mm'
* component[solidPartVolume].valueQuantity = 180 'mm3'


Instance: observation-pulmonary-nodule-ground-glass-example
InstanceOf: PulmonaryNoduleObservationLtLung
Usage: #example
Title: "Observation: Ground Glass Nodule – Right Middle Lobe, 9 mm (example)"
Description: "Ground glass pulmonary nodule in the right middle lobe (9 mm mean diameter, 320 mm3) with subpleural tissue abnormality detected during LDCT screening."
* status = #final
* code = $sct#427359005 "Solitary nodule of lung"
* subject = Reference(patient-male-example)
* performer = Reference(practitioner-radiologist-example)
* effectiveDateTime = "2025-09-22T10:28:00Z"
* component[noduleType].valueCodeableConcept = $sct#1217294009 "Ground glass lung opacity"
* bodySite = $sct#72481006 "Structure of middle lobe of right lung"
* component[ctSliceNumber].valueInteger = 91
* component[morphology][0].valueCodeableConcept = $sct#896998003 "Structural abnormality of subpleural tissue"
* component[meanDiameter].valueQuantity = 9 'mm'
* component[volume].valueQuantity = 320 'mm3'
