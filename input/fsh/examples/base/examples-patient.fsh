Profile: PatientLt
Parent: PatientEu
Id: patient-lt
Title: "PatientLt"
Description: "Lithuanian Base Patient profile, used to represent patients administrative information"
* ^url = $patient-lt-url
* ^status = #active 

* identifier 1..* MS
  * extension contains data-absent-reason named data-absent-reason 0..1 MS
  * system and value MS
* identifier.system from PatientIdentifierLt (extensible)

* gender MS
* name MS
  * use and text and family and given and period MS
* active MS
* birthDate MS
* deceased[x] MS
* telecom MS
  * system and value and use MS
* generalPractitioner only Reference(PractitionerLt or OrganizationLt or PractitionerRoleLt)
* managingOrganization only Reference(OrganizationLt)
* link
  * other only Reference(PatientLt or RelatedPersonLt)
