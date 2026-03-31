Profile: AdrenalLesionLtLung
Parent: IncidentalFindingLtLung
Id: adrenal-lesion-lt-lung
Title: "Adrenal Lesion (LT Lung)"
Description: """
Adrenal gland lesion incidental finding detected during LDCT screening,
per ADP dataset section 1.2.2.2 item 14.
Captures laterality, largest dimension, and density in Hounsfield units (HV).
"""
* ^url = $adrenal-lesion-lt-lung-url
* ^status = #active

* valueCodeableConcept = $sct#237783006 "Mass of adrenal gland (finding)"

* bodySite 1..1
* bodySite from AdrenalLateralityVS (required)
* bodySite ^short = "Location: right or left adrenal gland"

* component contains
    largestDimension 0..1 and
    densityHU 0..1

* component[largestDimension].code = $sct#439933003 "Long axis length of structure by imaging measurement (observable entity)"
* component[largestDimension].value[x] only Quantity
* component[largestDimension].valueQuantity.system = $ucum
* component[largestDimension].valueQuantity.code = #mm
* component[largestDimension] ^short = "Largest dimension in the axial plane (mm)"

* component[densityHU].code = $sct#28328005 "Abnormal radiologic density (finding)"
* component[densityHU].value[x] only Quantity
* component[densityHU].valueQuantity.system = $ucum
* component[densityHU].valueQuantity.code = #[hnsf'U]
* component[densityHU] ^short = "Density in Hounsfield units (HV)"

// Override the inherited categorical density component — not used for adrenal lesions.
// Adrenal density is quantitative (HV), captured via densityHU above.
* component[density] 0..0
