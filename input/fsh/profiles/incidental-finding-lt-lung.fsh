Profile: IncidentalFindingLtLung
Parent: ObservationLt
Id: incidental-finding-lt-lung
Title: "Incidental Finding (LT Lung)"
Description: "Significant incidental finding detected during low-dose chest computed tomography (LDCT) screening. Covers both pulmonary incidental findings (emphysema, bronchiectasis, pleural changes, etc.) and extra-pulmonary findings (coronary calcification, aortic aneurysm, mediastinal mass, etc.) as defined in the MDKT dataset sections 1.2.2.1 and 1.2.2.2."
* ^url = $incidental-finding-lt-lung-url
* ^status = #active

* status = #final

* code = $sct#404684003 "Clinical finding (finding)"

* subject 1..1
* subject only Reference(PatientLt)

* encounter 0..1
* encounter only Reference(EncounterLt)

* effective[x] only dateTime
* effectiveDateTime 1..1

* value[x] only CodeableConcept
* valueCodeableConcept 1..1
* valueCodeableConcept from IncidentalFindingVS (extensible)

* bodySite 0..1

* performer 0..*
* performer only Reference(PractitionerLt)

* derivedFrom 0..*

* note 0..*

// --- Components ---
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.ordered = false
* component ^slicing.rules = #open

* component contains
    severity 0..1 and
    laterality 0..1 and
    size 0..1 and
    density 0..1 and
    multiplicity 0..1 and
    lymphNodeLocation 0..*

* component[severity].code = $sct#246112005 "Severity (attribute)"
* component[severity].value[x] only CodeableConcept
* component[severity].valueCodeableConcept from http://hl7.org/fhir/ValueSet/condition-severity (preferred)
* component[severity] ^short = "Severity: moderate or severe/expressed"

* component[laterality].code = $sct#272741003 "Laterality (qualifier value)"
* component[laterality].value[x] only CodeableConcept
* component[laterality] ^short = "Laterality: right, left, or bilateral"

* component[size].code = $sct#246115007 "Size (attribute)"
* component[size].value[x] only Quantity
* component[size].valueQuantity.system = $ucum
* component[size].valueQuantity.code = #mm
* component[size] ^short = "Size of finding in mm"

* component[density].code = $sct#28328005 "Abnormal radiologic density"
* component[density].value[x] only CodeableConcept
* component[density].valueCodeableConcept from FindingDensityVS (extensible)
* component[density] ^short = "Density: cystic, solid, complex"

* component[multiplicity].code = $sct#246454002 "Occurrence (attribute)"
* component[multiplicity].value[x] only CodeableConcept
* component[multiplicity].valueCodeableConcept from FindingMultiplicityVS (extensible)

* component[lymphNodeLocation].code = $sct#439985001 "Area of body region by imaging measurement"
* component[lymphNodeLocation].value[x] only CodeableConcept
* component[lymphNodeLocation].valueCodeableConcept from LymphNodeLocationVS (extensible)
* component[lymphNodeLocation] ^short = "Location of lymphadenopathy"