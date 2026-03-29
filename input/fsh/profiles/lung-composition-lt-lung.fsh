Profile: LungCompositionLtLung
Parent: ImagingCompositionLt
Id: lung-composition-lt-lung
Title: "Lung Composition (LT Lung)"
Description: "Lung-specific imaging composition extending the base imaging composition with lung-specific constraints on findings, impression, and recommendation sections. Designed for use in the Lithuanian lung cancer prevention programme LDCT screening."
* ^url = $lung-composition-lt-lung-url
* ^status = #active

// --- Performer: technologist and reporting specialist ---
* author 1..*
* author only Reference(PractitionerLt or PractitionerRoleLt or OrganizationLt)
* author ^short = "Specialist(s) who authored the composition (radiologist, technologist)"

* attester 0..*
* attester.party only Reference(PractitionerLt or PractitionerRoleLt or OrganizationLt)
* attester ^short = "Specialist who attested the conclusion and recommendations"

// --- Custodian: healthcare institution ---
* custodian 1..1
* custodian only Reference(OrganizationLt)
* custodian ^short = "Healthcare institution where the LDCT was performed"

// Findings section — add lung-specific finding slices
* section[findings].entry ^slicing.discriminator.type = #profile
* section[findings].entry ^slicing.discriminator.path = "$this"
* section[findings].entry ^slicing.ordered = false
* section[findings].entry ^slicing.rules = #open
* section[findings].entry contains
    pulmonaryNodule 0..* and
    incidentalFinding 0..* and
    radiationDose 0..*
* section[findings].entry[pulmonaryNodule] only Reference(PulmonaryNoduleObservationLtLung)
* section[findings].entry[pulmonaryNodule] ^short = "Pulmonary nodule observation"
* section[findings].entry[incidentalFinding] only Reference(IncidentalFindingLtLung)
* section[findings].entry[incidentalFinding] ^short = "Significant incidental finding (pulmonary or extra-pulmonary)"
* section[findings].entry[radiationDose] only Reference(Observation)
* section[findings].entry[radiationDose] ^short = "Radiation dose observation (CTDIvol, DLP)"
// TODO: constrain radiationDose to ObservationRadiationDoseEuImaging once available in lt.hl7.fhir.eu dependency

// Impression section — add LUNG-RADS assessment slice
* section[impression].entry contains
    lungRads 0..*
* section[impression].entry[lungRads] only Reference(LungRadsAssessmentLtLung)
* section[impression].entry[lungRads] ^short = "LUNG-RADS assessment category"

// Recommendation section — add lung recommendation slice
* section[recommendation].entry contains
    lungRecommendation 0..*
* section[recommendation].entry[lungRecommendation] only Reference(LungRecommendationObservationLtLung)
* section[recommendation].entry[lungRecommendation] ^short = "Follow-up recommendation based on LUNG-RADS"
