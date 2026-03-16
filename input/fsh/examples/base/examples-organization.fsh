Profile: OrganizationLt
Parent: OrganizationEuCore
Id: organization-lt
Title: "OrganizationLt"
Description: "Lithuanian Base Organization profile, used to define healthcare organizations and sub-units"
* ^url = $organization-lt-url
* ^status = #active

* identifier 1.. MS
  * system and value MS
* identifier ^short = "Įstaigos identifikatorius"
* identifier.system from OrganizationIdentifierLt (extensible)

* active 1.. MS
* active ^short = "Ar įstaiga yra veikianti / Whether the organization's record is still in active use"

* name MS
* name ^short = "Įstaigos pavadinimas / Title"
* insert MultilingualName(organizations)

* contact  MS
* contact ^short = "Įstaigos kontaktinė informacija / Official contact details for the Organization"
* contact.telecom ^slicing.discriminator.type = #value
* contact.telecom ^slicing.discriminator.path = "system"
* contact.telecom ^slicing.rules = #open
* contact.telecom ^short = "Contact details (phone/email and more)"
* contact.telecom.system MS
* contact.telecom.use MS
* contact.telecom.value 1.. MS
* contact.telecom contains
    phone 0..* MS and
    email 0..* MS
* contact.telecom[phone] ^short = "Telefono numeris / Phone number"
* contact.telecom[phone].system = #phone (exactly)
* contact.telecom[email] ^short = "Elektroninio pašto adresas / Email"
* contact.telecom[email].system = #email (exactly)
* contact.address MS
* contact.address ^short = "Įstaigos adresas / Adress"

* partOf only Reference(OrganizationLt)
* partOf MS
* partOf ^short = "Įstaiga, kuriai priklausi ši įstaiga/padalinys / The organization of which this organization forms a part."
