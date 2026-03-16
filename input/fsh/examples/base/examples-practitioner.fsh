Profile: PractitionerLt
Parent: PractitionerEuCore
Id: practitioner-lt
Title: "PractitionerLt"
Description: "Lithuanian Base Practitioner profile, used to define healthcare practitioners"
* ^url = $practitioner-lt-url
* ^status = #active

* identifier 1.. MS
  * system and value MS
* name MS
  * family and given MS
* active MS
* telecom MS
  * system and use MS
  * value 1.. MS
* qualification MS
  * code and identifier and period and issuer MS
  * issuer only Reference(OrganizationLt)
