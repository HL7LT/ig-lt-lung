Profile: MediastinalMassLtLung
Parent: IncidentalFindingLtLung
Id: mediastinal-mass-lt-lung
Title: "Mediastinal Mass (LT Lung)"
Description: """
Mediastinal mass incidental finding detected during LDCT screening.
Multiple masses can be recorded as separate observation instances.
At least one of size, changed density, or calcification should be documented
per ADP dataset section 1.2.2.2 item 4.
"""
* ^url = $mediastinal-mass-lt-lung-url
* ^status = #active

* valueCodeableConcept = $sct#94147001 "Mass of mediastinum (finding)"

* component contains
    largestDimension 0..1 and
    changedDensity 0..1 and
    calcification 0..1

* component[largestDimension].code = $sct#396361002 "Lesion size, largest dimension (observable entity)"
* component[largestDimension].value[x] only Quantity
* component[largestDimension].valueQuantity.system = $ucum
* component[largestDimension].valueQuantity.code = #mm
* component[largestDimension] ^short = "Largest dimension in the axial plane (mm)"

* component[changedDensity].code = $sct#28328005 "Abnormal radiologic density (finding)"
* component[changedDensity].value[x] only boolean
* component[changedDensity] ^short = "Whether the mass shows changed (abnormal) density"

* component[calcification].code = $sct#129748009 "Radiographic calcification finding (finding)"
* component[calcification].value[x] only boolean
* component[calcification] ^short = "Whether calcification is present in the mass"
