Profile: LungCompositionLtLung
Parent: ImagingCompositionLt
Id: lung-composition-lt-lung
Title: "Lung Composition (LT Lung)"
Description: "Lung-specific imaging composition extending the base imaging composition with lung-specific constraints on findings, impression, and recommendation sections. Designed for use in the Lithuanian lung cancer prevention programme LDCT screening."
* ^url = $lung-composition-lt-lung-url
* ^status = #active

// Findings section — add lung-specific finding slices
* section[findings].entry ^slicing.discriminator.type = #profile
* section[findings].entry ^slicing.discriminator.path = "$this"
* section[findings].entry ^slicing.ordered = false
* section[findings].entry ^slicing.rules = #open
* section[findings].entry contains
    pulmonaryNodule 0..* and
    incidentalFinding 0..*
* section[findings].entry[pulmonaryNodule] only Reference(PulmonaryNoduleObservationLtLung)
* section[findings].entry[pulmonaryNodule] ^short = "Pulmonary nodule observation"
* section[findings].entry[incidentalFinding] only Reference(IncidentalFindingLtLung)
* section[findings].entry[incidentalFinding] ^short = "Significant incidental finding (pulmonary or extra-pulmonary)"

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
