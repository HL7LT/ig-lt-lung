Profile: EncounterLt
Parent: Encounter
Id: encounter-lt
Title: "EncounterLt"
Description: "Lithuanian Base Encounter profile, used to represent clinical encounters"
* ^url = $encounter-lt-url
* ^status = #active
* ^date = "2025-10-15"

* identifier 0..1 MS
* status MS
// * status from EncounterStatusVS (required)

* class MS
// * class from EncounterClassVS (required)

* priority MS
// * priority from EncounterPriorityVS (required)

* type MS
// * type from EncounterTypeVS (required)
* serviceType MS

* subject MS
* subject only Reference(PatientLt)

* subjectStatus MS
// * subjectStatus from EncounterSubjectStatusVS (required)

* episodeOfCare MS
* basedOn MS
* careTeam MS
* partOf MS
* serviceProvider MS

* participant MS
* participant.actor MS
* participant.period MS
* participant
  * type MS
  // * type from EncounterParticipantTypeVS (extensible)

* appointment MS

* reason MS
* reason.use MS
// * reason.use from EncounterReasonUseVS (preferred)

* reason.value MS
* reason.value only CodeableReference (ConditionLt or DiagnosticReport or Procedure or ObservationLt)
* virtualService MS
* actualPeriod MS
* plannedStartDate MS
* plannedEndDate MS
* length MS

* diagnosis MS
* diagnosis.condition MS
* diagnosis.use MS

* account MS

* admission MS
* admission.origin MS
* admission.admitSource MS
// * admission.admitSource from EncounterAdmitSourceVS (required)
* admission.reAdmission MS
// * admission.reAdmission from EncounterReAdmissionVS (required)
* admission.destination MS
* admission.dischargeDisposition MS
// * admission.dischargeDisposition from EncounterDischargeDispositionVS (required)

* location MS
* location.location 1..1 MS
