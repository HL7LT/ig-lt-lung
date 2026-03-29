Profile: KidneyLesionLtLung
Parent: IncidentalFindingLtLung
Id: kidney-lesion-lt-lung
Title: "Kidney Lesion (LT Lung)"
Description: """
Kidney lesion incidental finding detected during LDCT screening.
Significant lesions are 1 cm or larger, or smaller ones where malignancy
cannot be excluded, per ADP dataset section 1.2.2.2 item 12.
Calcified density can co-occur with cystic, solid, or complex.
"""
* ^url = $kidney-lesion-lt-lung-url
* ^status = #active

* valueCodeableConcept = $sct#309088003 "Renal mass (finding)"

* bodySite 1..1
* bodySite from KidneyLateralityVS (required)
* bodySite ^short = "Location: right or left kidney"

* component contains
    largestDimension 0..1

* component[largestDimension].code = $sct#439933003 "Long axis length of structure by imaging measurement (observable entity)"
* component[largestDimension].value[x] only Quantity
* component[largestDimension].valueQuantity.system = $ucum
* component[largestDimension].valueQuantity.code = #mm
* component[largestDimension] ^short = "Largest dimension in the axial plane (mm)"

// Calcified can coexist with cystic, solid, or complex — use multiple codings in one CodeableConcept
* component[density].valueCodeableConcept from KidneyLesionDensityVS (required)
* component[density] ^short = "Density: cystic, solid, complex, calcified. Calcified can co-occur with others via multiple codings."
