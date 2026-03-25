Profile: PulmonaryNoduleObservationLtLung
Parent: ObservationLt
Id: pulmonary-nodule-observation-lt-lung
Title: "Pulmonary Nodule (LT Lung)"
Description: """
Pulmonary nodule identified on low-dose chest CT (LDCT) in the Lithuanian
lung cancer early diagnosis programme.

One observation represents one pulmonary nodule (Židinys). Multiple nodules
are represented as multiple Observation instances.

The observation captures the nodule type, localisation, CT slice number,
morphological features, measurements, and optional note.
"""
* ^url = $pulmonary-nodule-observation-lt-lung-url
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
* component[ctSliceNumber].code = PulmonaryNoduleComponentCode#ct-slice-number "CT slice number"
* component[ctSliceNumber].value[x] only integer
* component[ctSliceNumber] ^short = "CT slice number"

* component[spiculation].code = $sct#129742005 "Lesion with spiculated margin"
* component[spiculation].value[x] only boolean
* component[spiculation] ^short = "Whether the nodule has spiculated margins"

* component[irregularMargins].code = $sct#129739004 "Lesion with microlobulated margin"
* component[irregularMargins].value[x] only boolean
* component[irregularMargins] ^short = "Whether the nodule has irregular / microlobulated margins"

* component[pleuralAssociation].code = PulmonaryNoduleComponentCode#pleural-association "Associated with pleura"
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
