// =============================================================================
// Examples: Adrenal gland lesion from LDCT screening
// =============================================================================

Instance: observation-adrenal-lesion-right-example
InstanceOf: AdrenalLesionLtLung
Usage: #example
Title: "Observation: Right Adrenal Lesion, 18mm, 12 HV (example)"
Description: "Incidental finding of a right adrenal gland lesion detected during LDCT screening with size and density in Hounsfield units."
* status = #final
* subject = Reference(patient-male-example)
* effectiveDateTime = "2025-11-20T14:30:00Z"
* performer = Reference(practitioner-radiologist-example)
* valueCodeableConcept = $sct#237783006 "Mass of adrenal gland (finding)"
* bodySite = $sct#53085002 "Right adrenal gland structure (body structure)"
* component[largestDimension].valueQuantity = 18 'mm' "mm"
* component[densityHU].valueQuantity.value = 12
* component[densityHU].valueQuantity.unit = "HU"
* component[densityHU].valueQuantity.system = "http://unitsofmeasure.org"
* component[densityHU].valueQuantity.code = #[hnsf'U]
