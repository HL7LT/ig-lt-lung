CodeSystem: PulmonaryNoduleTypeLocalLt
Id: pulmonary-nodule-type-local-lt
Title: "Pulmonary Nodule Type Local Codes"
Description: """
Local codes for pulmonary nodule types used in the Lithuanian lung cancer
early diagnosis programme when no suitable SNOMED CT code is available
in the source dataset.
"""
* ^status = #active
* ^experimental = false
* ^content = #complete
* #part-solid "Part-solid"


CodeSystem: PulmonaryNoduleComponentCodeLt
Id: pulmonary-nodule-component-code-lt
Title: "Pulmonary Nodule Observation Component Codes"
Description: """
Local component codes for pulmonary nodule observation elements used in the
Lithuanian lung cancer early diagnosis programme when no suitable SNOMED CT
code is available in the source dataset.
"""
* ^status = #active
* ^experimental = false
* ^content = #complete
* #ct-slice-number "CT slice number"
* #pleural-association "Associated with pleura"


ValueSet: PulmonaryNoduleTypeVS
Id: pulmonary-nodule-type-vs
Title: "Pulmonary Nodule Type"
Description: """
Allowed pulmonary nodule type values used in the Lithuanian lung cancer
early diagnosis programme.
"""
* ^status = #active
* ^experimental = false
* $sct#35702001 "Solid"
* $sct#1217294009 "Ground glass lung opacity"
* $sct#255347005 "Hollow"
* $sct#255003 "Calcified nodule"
* PulmonaryNoduleTypeLocalLt#part-solid "Part-solid"


ValueSet: LungLobeVS
Id: lung-lobe-vs
Title: "Lung Lobe"
Description: """
Allowed lung lobe body structure codes for localisation of pulmonary nodules
in the Lithuanian lung cancer early diagnosis programme.
"""
* ^status = #active
* ^experimental = false
* $sct#42400003 "Structure of upper lobe of right lung"
* $sct#72481006 "Structure of middle lobe of right lung"
* $sct#266005 "Structure of lower lobe of right lung"
* $sct#44714003 "Structure of upper lobe of left lung"
* $sct#41224006 "Structure of lower lobe of left lung"


ValueSet: PulmonaryNoduleMorphologyVS
Id: pulmonary-nodule-morphology-vs
Title: "Pulmonary Nodule Morphology"
Description: """
Allowed morphology characteristics for pulmonary nodules in the Lithuanian
lung cancer early diagnosis programme.
"""
* ^status = #active
* ^experimental = false
* $sct#129742005 "Lesion with spiculated margin"
* $sct#129739004 "Lesion with microlobulated margin"


Profile: PulmonaryNoduleObservationLt
Parent: LTBaseObservation
Id: pulmonary-nodule-observation-lt
Title: "Observation: Pulmonary Nodule"
Description: """
Pulmonary nodule identified on low-dose chest CT (LDCT) in the Lithuanian
lung cancer early diagnosis programme.

One observation represents one pulmonary nodule (Židinys). Multiple nodules
are represented as multiple Observation instances.

The observation captures the nodule type, localisation, CT slice number,
morphological features, measurements, and optional note.
"""
* status 1..1
* status = #final
* code 1..1
* code = $sct#786838002 "Nodule of lung"
* subject 1..1
* subject only Reference(PatientLt)
* encounter 0..1
* encounter only Reference(EncounterLt)
* effective[x] 1..1
* effective[x] only dateTime
* performer 0..*
* performer only Reference(PractitionerLt)
* derivedFrom 0..*
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from PulmonaryNoduleTypeVS (required)
* valueCodeableConcept ^short = "Nodule type"
* bodySite 1..1
* bodySite from LungLobeVS (required)
* bodySite ^short = "Lung lobe where the nodule is located"
* note 0..*
* note ^short = "Optional free-text note about the nodule"
* component 0..*
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains
    ctSliceNumber 0..1 and
    spiculation 0..1 and
    irregularMargins 0..1 and
    pleuralAssociation 0..1 and
    meanDiameter 0..1 and
    longAxis 0..1 and
    shortAxis 0..1 and
    volume 0..1 and
    solidPartMeanDiameter 0..1 and
    solidPartLongAxis 0..1 and
    solidPartShortAxis 0..1 and
    solidPartVolume 0..1
* component[ctSliceNumber].code = PulmonaryNoduleComponentCodeLt#ct-slice-number "CT slice number"
* component[ctSliceNumber].value[x] only integer
* component[ctSliceNumber] ^short = "CT slice number"

* component[spiculation].code = $sct#129742005 "Lesion with spiculated margin"
* component[spiculation].value[x] only boolean
* component[spiculation] ^short = "Whether the nodule has spiculated margins"

* component[irregularMargins].code = $sct#129739004 "Lesion with microlobulated margin"
* component[irregularMargins].value[x] only boolean
* component[irregularMargins] ^short = "Whether the nodule has irregular / microlobulated margins"

* component[pleuralAssociation].code = PulmonaryNoduleComponentCodeLt#pleural-association "Associated with pleura"
* component[pleuralAssociation].value[x] only boolean
* component[pleuralAssociation] ^short = "Whether the nodule is associated with pleura"

* component[meanDiameter].code = $sct#255586005 "Mean"
* component[meanDiameter].value[x] only Quantity
* component[meanDiameter].valueQuantity.unit = "mm"
* component[meanDiameter].valueQuantity.system = "http://unitsofmeasure.org"
* component[meanDiameter].valueQuantity.code = #mm
* component[meanDiameter] ^short = "Mean nodule diameter"

* component[longAxis].code = $sct#103339001 "Long axis"
* component[longAxis].value[x] only Quantity
* component[longAxis].valueQuantity.unit = "mm"
* component[longAxis].valueQuantity.system = "http://unitsofmeasure.org"
* component[longAxis].valueQuantity.code = #mm
* component[longAxis] ^short = "Long axis of the nodule"

* component[shortAxis].code = $sct#103340004 "Short axis"
* component[shortAxis].value[x] only Quantity
* component[shortAxis].valueQuantity.unit = "mm"
* component[shortAxis].valueQuantity.system = "http://unitsofmeasure.org"
* component[shortAxis].valueQuantity.code = #mm
* component[shortAxis] ^short = "Short axis of the nodule"

* component[volume].code = $sct#118565006 "Volume"
* component[volume].value[x] only Quantity
* component[volume].valueQuantity.unit = "mm3"
* component[volume].valueQuantity.system = "http://unitsofmeasure.org"
* component[volume].valueQuantity.code = #mm3
* component[volume] ^short = "Nodule volume"

* component[solidPartMeanDiameter].code = $sct#255586005 "Mean"
* component[solidPartMeanDiameter].value[x] only Quantity
* component[solidPartMeanDiameter].valueQuantity.unit = "mm"
* component[solidPartMeanDiameter].valueQuantity.system = "http://unitsofmeasure.org"
* component[solidPartMeanDiameter].valueQuantity.code = #mm
* component[solidPartMeanDiameter] ^short = "Mean diameter of the solid component in a part-solid nodule"

* component[solidPartLongAxis].code = $sct#103339001 "Long axis"
* component[solidPartLongAxis].value[x] only Quantity
* component[solidPartLongAxis].valueQuantity.unit = "mm"
* component[solidPartLongAxis].valueQuantity.system = "http://unitsofmeasure.org"
* component[solidPartLongAxis].valueQuantity.code = #mm
* component[solidPartLongAxis] ^short = "Long axis of the solid component"

* component[solidPartShortAxis].code = $sct#103340004 "Short axis"
* component[solidPartShortAxis].value[x] only Quantity
* component[solidPartShortAxis].valueQuantity.unit = "mm"
* component[solidPartShortAxis].valueQuantity.system = "http://unitsofmeasure.org"
* component[solidPartShortAxis].valueQuantity.code = #mm
* component[solidPartShortAxis] ^short = "Short axis of the solid component"

* component[solidPartVolume].code = $sct#118565006 "Volume"
* component[solidPartVolume].value[x] only Quantity
* component[solidPartVolume].valueQuantity.unit = "mm3"
* component[solidPartVolume].valueQuantity.system = "http://unitsofmeasure.org"
* component[solidPartVolume].valueQuantity.code = #mm3
* component[solidPartVolume] ^short = "Volume of the solid component"


// Example Instance 1
Instance: observation-pulmonary-nodule-solid-example
InstanceOf: PulmonaryNoduleObservationLt
Usage: #example
Title: "Observation: Solid Pulmonary Nodule Example"
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


// Example Instance 2
Instance: observation-pulmonary-nodule-part-solid-example
InstanceOf: PulmonaryNoduleObservationLt
Usage: #example
Title: "Observation: Part-solid Pulmonary Nodule Example"
Description: "Example of a part-solid pulmonary nodule in the left upper lobe with solid component measurements."
* status = #final
* code = $sct#786838002 "Nodule of lung"
* subject = Reference(example-patient-male)
* performer = Reference(example-practitioner)
* effectiveDateTime = "2025-09-22T10:25:00Z"
* valueCodeableConcept = PulmonaryNoduleTypeLocalLt#part-solid "Part-solid"
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


// Example Instance 3
Instance: observation-pulmonary-nodule-ground-glass-example
InstanceOf: PulmonaryNoduleObservationLt
Usage: #example
Title: "Observation: Ground-glass Pulmonary Nodule Example"
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