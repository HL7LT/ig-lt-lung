Instance: observation-pulmonary-nodule-solid-example
InstanceOf: PulmonaryNoduleObservationLtLung
Usage: #example
Title: "Observation: Solid pulmonary nodule (example)"
Description: "Example of a solid pulmonary nodule in the right upper lobe."
* status = #final
* code = $sct#786838002 "Nodule of lung"
* subject = Reference(example-patient-male)
* performer = Reference(example-practitioner)
* effectiveDateTime = "2025-09-22T10:20:00Z"
* valueCodeableConcept = $sct#35702001 "Solid"
* bodySite = $sct#42400003 "Structure of upper lobe of right lung"
* component[ctSliceNumber].valueInteger = 84
* component[spiculation].valueBoolean = true
* component[irregularMargins].valueBoolean = false
* component[pleuralAssociation].valueBoolean = false
* component[meanDiameter].valueQuantity = 11 'mm'
* component[longAxis].valueQuantity = 12 'mm'
* component[shortAxis].valueQuantity = 10 'mm'
* component[volume].valueQuantity = 610 'mm3'
* note.text = "Solid pulmonary nodule in the right upper lobe."


Instance: observation-pulmonary-nodule-part-solid-example
InstanceOf: PulmonaryNoduleObservationLtLung
Usage: #example
Title: "Observation: Part-solid pulmonary nodule (example)"
Description: "Example of a part-solid pulmonary nodule in the left upper lobe with solid component measurements."
* status = #final
* code = $sct#786838002 "Nodule of lung"
* subject = Reference(example-patient-male)
* performer = Reference(example-practitioner)
* effectiveDateTime = "2025-09-22T10:25:00Z"
* valueCodeableConcept = PulmonaryNoduleTypeLocalLtLung#part-solid "Part-solid"
* bodySite = $sct#44714003 "Structure of upper lobe of left lung"
* component[ctSliceNumber].valueInteger = 102
* component[spiculation].valueBoolean = false
* component[irregularMargins].valueBoolean = true
* component[pleuralAssociation].valueBoolean = true
* component[meanDiameter].valueQuantity = 18 'mm'
* component[longAxis].valueQuantity = 20 'mm'
* component[shortAxis].valueQuantity = 16 'mm'
* component[volume].valueQuantity = 1450 'mm3'
* component[solidPartMeanDiameter].valueQuantity = 7 'mm'
* component[solidPartLongAxis].valueQuantity = 8 'mm'
* component[solidPartShortAxis].valueQuantity = 6 'mm'
* component[solidPartVolume].valueQuantity = 180 'mm3'
* note.text = "Part-solid pulmonary nodule in the left upper lobe with pleural association."


Instance: observation-pulmonary-nodule-ground-glass-example
InstanceOf: PulmonaryNoduleObservationLtLung
Usage: #example
Title: "Observation: Ground-glass pulmonary nodule (example)"
Description: "Example of a ground-glass pulmonary nodule in the right middle lobe."
* status = #final
* code = $sct#786838002 "Nodule of lung"
* subject = Reference(example-patient-male)
* performer = Reference(example-practitioner)
* effectiveDateTime = "2025-09-22T10:28:00Z"
* valueCodeableConcept = $sct#1217294009 "Ground glass lung opacity"
* bodySite = $sct#72481006 "Structure of middle lobe of right lung"
* component[ctSliceNumber].valueInteger = 91
* component[spiculation].valueBoolean = false
* component[irregularMargins].valueBoolean = false
* component[pleuralAssociation].valueBoolean = false
* component[meanDiameter].valueQuantity = 9 'mm'
* component[volume].valueQuantity = 320 'mm3'
* note.text = "Ground-glass pulmonary nodule in the right middle lobe."
