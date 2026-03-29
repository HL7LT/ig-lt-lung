// =============================================================================
// Questionnaire: LDCT ESPBI Form (ADP Table 7.1)
// =============================================================================
// Narrative mapping (Questionnaire item -> FHIR resource):
//   Date of LDCT             -> LungReportLtLung.effectiveDateTime
//   Radiation dose (CTDIvol) -> ObservationLt (radiation dose)
//   Radiation dose (DLP)     -> ObservationLt (dose length product)
//   Technologist             -> PractitionerLt
//   Facility                 -> OrganizationLt
//   Nodule type              -> PulmonaryNoduleObservationLtLung.valueCodeableConcept
//   Nodule lobe              -> PulmonaryNoduleObservationLtLung.bodySite
//   Nodule morphology        -> PulmonaryNoduleObservationLtLung.component[spiculation/irregularMargins/pleuralAssociation]
//   Nodule size/volume       -> PulmonaryNoduleObservationLtLung.component[meanDiameter/longAxis/shortAxis/volume]
//   Incidental findings      -> IncidentalFindingLtLung.valueCodeableConcept
//   LUNG-RADS category       -> LungRadsAssessmentLtLung.valueCodeableConcept
//   Recommendations          -> LungRecommendationObservationLtLung.valueCodeableConcept
//   Reporting specialist     -> PractitionerLt
//   Institution              -> OrganizationLt
// =============================================================================

Instance: questionnaire-ldct-lt-lung
InstanceOf: Questionnaire
Usage: #definition
Title: "Questionnaire: LDCT ESPBI Form (LT Lung)"
Description: "Structured data-capture form for low-dose chest computed tomography (LDCT) reporting based on ADP Table 7.1 (MDKT dataset)."
* name = "LdctQuestionnaireLtLung"
* status = #active
* url = "https://hl7.lt/fhir/lung/Questionnaire/questionnaire-ldct-lt-lung"

// ---------------------------------------------------------------------------
// Group 1 – General information
// ---------------------------------------------------------------------------
* item[0].linkId = "grp-general"
* item[0].text = "General information"
* item[0].type = #group

* item[0].item[0].linkId = "exam-date"
* item[0].item[0].text = "LDCT examination date"
* item[0].item[0].type = #dateTime

* item[0].item[1].linkId = "previous-exam-date"
* item[0].item[1].text = "Date of last performed chest LDCT examination (if known)"
* item[0].item[1].type = #dateTime
* item[0].item[1].required = false

* item[0].item[2].linkId = "ctdivol"
* item[0].item[2].text = "Volume CT Dose Index – CTDIvol (mGy)"
* item[0].item[2].type = #quantity

* item[0].item[3].linkId = "dlp"
* item[0].item[3].text = "Dose Length Product – DLP (mGy x cm)"
* item[0].item[3].type = #quantity

* item[0].item[4].linkId = "technologist-qualification"
* item[0].item[4].text = "Professional qualification of the technologist"
* item[0].item[4].type = #string
* item[0].item[4].required = true

* item[0].item[5].linkId = "technologist-first-name"
* item[0].item[5].text = "Technologist first name"
* item[0].item[5].type = #string
* item[0].item[5].required = true

* item[0].item[6].linkId = "technologist-last-name"
* item[0].item[6].text = "Technologist last name"
* item[0].item[6].type = #string
* item[0].item[6].required = true

* item[0].item[7].linkId = "facility-name"
* item[0].item[7].text = "Healthcare institution name"
* item[0].item[7].type = #string

* item[0].item[8].linkId = "facility-code"
* item[0].item[8].text = "Healthcare institution code"
* item[0].item[8].type = #string

* item[0].item[9].linkId = "facility-address"
* item[0].item[9].text = "Healthcare institution address"
* item[0].item[9].type = #string

* item[0].item[10].linkId = "facility-phone"
* item[0].item[10].text = "Healthcare institution phone number"
* item[0].item[10].type = #string

* item[0].item[11].linkId = "facility-email"
* item[0].item[11].text = "Healthcare institution email"
* item[0].item[11].type = #string

// ---------------------------------------------------------------------------
// Group 2 – Nodule findings (repeating)
// ---------------------------------------------------------------------------
* item[1].linkId = "grp-nodules"
* item[1].text = "Nodule findings"
* item[1].type = #group
* item[1].repeats = true

* item[1].item[0].linkId = "nodule-type"
* item[1].item[0].text = "Type of lesion"
* item[1].item[0].type = #coding
* item[1].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#solid "Solid"
* item[1].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#part-solid "Part solid"
* item[1].item[0].answerOption[2].valueCoding = $lung-questionnaire-options-cs-url#ground-glass "Ground glass nodule"
* item[1].item[0].answerOption[3].valueCoding = $lung-questionnaire-options-cs-url#calcified "Calcified"
* item[1].item[0].answerOption[4].valueCoding = $lung-questionnaire-options-cs-url#cavitary "Cavitary"

* item[1].item[1].linkId = "nodule-lobe"
* item[1].item[1].text = "Lung lobe"
* item[1].item[1].type = #coding
* item[1].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#right-upper "Upper lobe of the right lung"
* item[1].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#right-middle "Middle lobe of the right lung"
* item[1].item[1].answerOption[2].valueCoding = $lung-questionnaire-options-cs-url#right-lower "Lower lobe of the right lung"
* item[1].item[1].answerOption[3].valueCoding = $lung-questionnaire-options-cs-url#left-upper "Upper lobe of the left lung"
* item[1].item[1].answerOption[4].valueCoding = $lung-questionnaire-options-cs-url#left-lower "Lower lobe of the left lung"

* item[1].item[2].linkId = "ct-slice-number"
* item[1].item[2].text = "CT image slice number"
* item[1].item[2].type = #integer

* item[1].item[3].linkId = "morphology-spiculated"
* item[1].item[3].text = "With spicules"
* item[1].item[3].type = #coding
* item[1].item[3].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[1].item[3].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[1].item[4].linkId = "morphology-irregular"
* item[1].item[4].text = "Irregular contours"
* item[1].item[4].type = #coding
* item[1].item[4].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[1].item[4].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[1].item[5].linkId = "morphology-pleural"
* item[1].item[5].text = "Related to pleura"
* item[1].item[5].type = #coding
* item[1].item[5].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[1].item[5].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[1].item[6].linkId = "nodule-mean-diameter"
* item[1].item[6].text = "Size – average diameter (mm)"
* item[1].item[6].type = #quantity

* item[1].item[7].linkId = "nodule-long-axis"
* item[1].item[7].text = "Size – long axis (mm)"
* item[1].item[7].type = #quantity

* item[1].item[8].linkId = "nodule-short-axis"
* item[1].item[8].text = "Size – short axis (mm)"
* item[1].item[8].type = #quantity

* item[1].item[9].linkId = "nodule-volume"
* item[1].item[9].text = "Volume (mm3)"
* item[1].item[9].type = #quantity

* item[1].item[10].linkId = "solid-part-mean-diameter"
* item[1].item[10].text = "Solid part – average diameter (mm)"
* item[1].item[10].type = #quantity

* item[1].item[11].linkId = "solid-part-long-axis"
* item[1].item[11].text = "Solid part – long axis (mm)"
* item[1].item[11].type = #quantity

* item[1].item[12].linkId = "solid-part-short-axis"
* item[1].item[12].text = "Solid part – short axis (mm)"
* item[1].item[12].type = #quantity

* item[1].item[13].linkId = "solid-part-volume"
* item[1].item[13].text = "Solid part – volume (mm3)"
* item[1].item[13].type = #quantity

* item[1].item[14].linkId = "nodule-note"
* item[1].item[14].text = "Note"
* item[1].item[14].type = #text

// ---------------------------------------------------------------------------
// Group 3 – Incidental findings in the lungs (ADP 1.2.2.1)
// ---------------------------------------------------------------------------
* item[2].linkId = "grp-incidental-lung"
* item[2].text = "Significant incidental findings in the lungs"
* item[2].type = #group

// 1. Interstitial lung changes
* item[2].item[0].linkId = "interstitial-changes"
* item[2].item[0].text = "Interstitial lung changes (>5% of lung volume)"
* item[2].item[0].type = #coding
* item[2].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[0].item[0].linkId = "interstitial-subtype"
* item[2].item[0].item[0].text = "Type of interstitial changes"
* item[2].item[0].item[0].type = #coding
* item[2].item[0].item[0].repeats = true
* item[2].item[0].item[0].enableWhen[0].question = "interstitial-changes"
* item[2].item[0].item[0].enableWhen[0].operator = #=
* item[2].item[0].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[2].item[0].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#non-subpleural "Non-subpleural"
* item[2].item[0].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#subpleural-non-fibrotic "Subpleural non-fibrotic"
* item[2].item[0].item[0].answerOption[2].valueCoding = $lung-questionnaire-options-cs-url#subpleural-fibrous "Subpleural fibrous"
* item[2].item[0].item[0].answerOption[3].valueCoding = $lung-questionnaire-options-cs-url#respiratory-bronchiolitis "Respiratory bronchiolitis (RB-IPL)"

// 2. Emphysema
* item[2].item[1].linkId = "emphysema"
* item[2].item[1].text = "Emphysema"
* item[2].item[1].type = #coding
* item[2].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[1].item[0].linkId = "emphysema-severity"
* item[2].item[1].item[0].text = "Emphysema severity"
* item[2].item[1].item[0].type = #coding
* item[2].item[1].item[0].enableWhen[0].question = "emphysema"
* item[2].item[1].item[0].enableWhen[0].operator = #=
* item[2].item[1].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[2].item[1].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#moderate "Moderate (25-50%)"
* item[2].item[1].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#severe "Severe / expressed (>50%)"

// 3. Bronchiectasis
* item[2].item[2].linkId = "bronchiectasis"
* item[2].item[2].text = "Bronchiectasis"
* item[2].item[2].type = #coding
* item[2].item[2].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[2].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[2].item[0].linkId = "bronchiectasis-severity"
* item[2].item[2].item[0].text = "Bronchiectasis severity"
* item[2].item[2].item[0].type = #coding
* item[2].item[2].item[0].enableWhen[0].question = "bronchiectasis"
* item[2].item[2].item[0].enableWhen[0].operator = #=
* item[2].item[2].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[2].item[2].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#moderate "Moderate"
* item[2].item[2].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#severe "Expressed"

// 4. Pleural fluid
* item[2].item[3].linkId = "pleural-fluid"
* item[2].item[3].text = "Fluid in the pleural cavity"
* item[2].item[3].type = #coding
* item[2].item[3].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[3].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[3].item[0].linkId = "pleural-fluid-laterality"
* item[2].item[3].item[0].text = "Laterality"
* item[2].item[3].item[0].type = #coding
* item[2].item[3].item[0].enableWhen[0].question = "pleural-fluid"
* item[2].item[3].item[0].enableWhen[0].operator = #=
* item[2].item[3].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[2].item[3].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#right "Right"
* item[2].item[3].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#left "Left"
* item[2].item[3].item[0].answerOption[2].valueCoding = $lung-questionnaire-options-cs-url#bilateral "Bilateral"

* item[2].item[3].item[1].linkId = "pleural-fluid-quantity"
* item[2].item[3].item[1].text = "Quantity"
* item[2].item[3].item[1].type = #coding
* item[2].item[3].item[1].enableWhen[0].question = "pleural-fluid"
* item[2].item[3].item[1].enableWhen[0].operator = #=
* item[2].item[3].item[1].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[2].item[3].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#small-amount "Small amount"
* item[2].item[3].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#moderate "Moderate amount"
* item[2].item[3].item[1].answerOption[2].valueCoding = $lung-questionnaire-options-cs-url#large-amount "Large amount"

// 5. Pleural changes
* item[2].item[4].linkId = "pleural-changes"
* item[2].item[4].text = "Pleural changes"
* item[2].item[4].type = #coding
* item[2].item[4].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[4].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[4].item[0].linkId = "pleural-suspected-malignant"
* item[2].item[4].item[0].text = "Suspected malignant"
* item[2].item[4].item[0].type = #coding
* item[2].item[4].item[0].enableWhen[0].question = "pleural-changes"
* item[2].item[4].item[0].enableWhen[0].operator = #=
* item[2].item[4].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[2].item[4].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[4].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[4].item[1].linkId = "pleural-asbestosis-plaque"
* item[2].item[4].item[1].text = "Asbestosis pleural plaque"
* item[2].item[4].item[1].type = #coding
* item[2].item[4].item[1].enableWhen[0].question = "pleural-changes"
* item[2].item[4].item[1].enableWhen[0].operator = #=
* item[2].item[4].item[1].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[2].item[4].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[4].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[4].item[2].linkId = "pleural-calcification"
* item[2].item[4].item[2].text = "Pleural calcification"
* item[2].item[4].item[2].type = #coding
* item[2].item[4].item[2].enableWhen[0].question = "pleural-changes"
* item[2].item[4].item[2].enableWhen[0].operator = #=
* item[2].item[4].item[2].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[2].item[4].item[2].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#local "Local"
* item[2].item[4].item[2].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#diffuse "Diffuse"

// 6. Pneumothorax
* item[2].item[5].linkId = "pneumothorax"
* item[2].item[5].text = "Pneumothorax"
* item[2].item[5].type = #coding
* item[2].item[5].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[5].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[5].item[0].linkId = "pneumothorax-laterality"
* item[2].item[5].item[0].text = "Laterality"
* item[2].item[5].item[0].type = #coding
* item[2].item[5].item[0].enableWhen[0].question = "pneumothorax"
* item[2].item[5].item[0].enableWhen[0].operator = #=
* item[2].item[5].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[2].item[5].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#right "Right"
* item[2].item[5].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#left "Left"
* item[2].item[5].item[0].answerOption[2].valueCoding = $lung-questionnaire-options-cs-url#bilateral "Bilateral"

// 7. Pneumomediastinum
* item[2].item[6].linkId = "pneumomediastinum"
* item[2].item[6].text = "Pneumomediastinum"
* item[2].item[6].type = #coding
* item[2].item[6].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[6].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// 8. Diaphragm changes
* item[2].item[7].linkId = "diaphragm-changes"
* item[2].item[7].text = "Changes in diaphragms"
* item[2].item[7].type = #coding
* item[2].item[7].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[7].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[7].item[0].linkId = "diaphragm-suspected-malignant"
* item[2].item[7].item[0].text = "Suspected malignant"
* item[2].item[7].item[0].type = #coding
* item[2].item[7].item[0].enableWhen[0].question = "diaphragm-changes"
* item[2].item[7].item[0].enableWhen[0].operator = #=
* item[2].item[7].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[2].item[7].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[7].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[7].item[1].linkId = "diaphragm-large-hernia"
* item[2].item[7].item[1].text = "Large hernia"
* item[2].item[7].item[1].type = #coding
* item[2].item[7].item[1].enableWhen[0].question = "diaphragm-changes"
* item[2].item[7].item[1].enableWhen[0].operator = #=
* item[2].item[7].item[1].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[2].item[7].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[7].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[7].item[2].linkId = "diaphragm-complicated-hernia"
* item[2].item[7].item[2].text = "Complicated hernia"
* item[2].item[7].item[2].type = #coding
* item[2].item[7].item[2].enableWhen[0].question = "diaphragm-changes"
* item[2].item[7].item[2].enableWhen[0].operator = #=
* item[2].item[7].item[2].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[2].item[7].item[2].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[7].item[2].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// 9. Consolidation
* item[2].item[8].linkId = "consolidation"
* item[2].item[8].text = "Consolidation"
* item[2].item[8].type = #coding
* item[2].item[8].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[8].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[8].item[0].linkId = "consolidation-inflammatory"
* item[2].item[8].item[0].text = "Likely inflammatory"
* item[2].item[8].item[0].type = #coding
* item[2].item[8].item[0].enableWhen[0].question = "consolidation"
* item[2].item[8].item[0].enableWhen[0].operator = #=
* item[2].item[8].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[2].item[8].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[8].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[8].item[1].linkId = "consolidation-malignant"
* item[2].item[8].item[1].text = "Possibly malignant"
* item[2].item[8].item[1].type = #coding
* item[2].item[8].item[1].enableWhen[0].question = "consolidation"
* item[2].item[8].item[1].enableWhen[0].operator = #=
* item[2].item[8].item[1].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[2].item[8].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[8].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// 10. Tuberculosis
* item[2].item[9].linkId = "tuberculosis"
* item[2].item[9].text = "Tuberculosis"
* item[2].item[9].type = #coding
* item[2].item[9].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[9].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[9].item[0].linkId = "tuberculosis-differentiated"
* item[2].item[9].item[0].text = "Suspected tuberculosis differentiated from other diseases"
* item[2].item[9].item[0].type = #coding
* item[2].item[9].item[0].enableWhen[0].question = "tuberculosis"
* item[2].item[9].item[0].enableWhen[0].operator = #=
* item[2].item[9].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[2].item[9].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[9].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// ---------------------------------------------------------------------------
// Group 4 – Incidental findings not in the lungs (ADP 1.2.2.2)
// ---------------------------------------------------------------------------
* item[3].linkId = "grp-incidental-extra"
* item[3].text = "Significant incidental findings not in the lungs"
* item[3].type = #group

// 1. Coronary artery calcification
* item[3].item[0].linkId = "coronary-calcification"
* item[3].item[0].text = "Coronary artery calcification"
* item[3].item[0].type = #coding
* item[3].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[0].item[0].linkId = "coronary-calcification-severity"
* item[3].item[0].item[0].text = "Severity"
* item[3].item[0].item[0].type = #coding
* item[3].item[0].item[0].enableWhen[0].question = "coronary-calcification"
* item[3].item[0].item[0].enableWhen[0].operator = #=
* item[3].item[0].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[3].item[0].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#moderate "Moderate"
* item[3].item[0].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#severe "Severe / expressed"

// 2. Aortic valve calcification
* item[3].item[1].linkId = "aortic-valve-calcification"
* item[3].item[1].text = "Aortic valve calcification"
* item[3].item[1].type = #coding
* item[3].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[1].item[0].linkId = "aortic-valve-severity"
* item[3].item[1].item[0].text = "Severity"
* item[3].item[1].item[0].type = #coding
* item[3].item[1].item[0].enableWhen[0].question = "aortic-valve-calcification"
* item[3].item[1].item[0].enableWhen[0].operator = #=
* item[3].item[1].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[3].item[1].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#moderate "Moderate"
* item[3].item[1].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#severe "Severe / expressed"

// 3. Thoracic aortic aneurysm
* item[3].item[2].linkId = "thoracic-aortic-aneurysm"
* item[3].item[2].text = "Thoracic aortic aneurysm (dilation >=45mm)"
* item[3].item[2].type = #coding
* item[3].item[2].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[2].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[2].item[0].linkId = "thoracic-aneurysm-size"
* item[3].item[2].item[0].text = "Size (mm)"
* item[3].item[2].item[0].type = #quantity
* item[3].item[2].item[0].enableWhen[0].question = "thoracic-aortic-aneurysm"
* item[3].item[2].item[0].enableWhen[0].operator = #=
* item[3].item[2].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes

// 4. Mediastinal mass
* item[3].item[3].linkId = "mediastinal-mass"
* item[3].item[3].text = "Mediastinal mass"
* item[3].item[3].type = #coding
* item[3].item[3].repeats = true
* item[3].item[3].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[3].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[3].item[0].linkId = "mediastinal-mass-size"
* item[3].item[3].item[0].text = "Size – largest dimension in axial plane (mm)"
* item[3].item[3].item[0].type = #quantity
* item[3].item[3].item[0].enableWhen[0].question = "mediastinal-mass"
* item[3].item[3].item[0].enableWhen[0].operator = #=
* item[3].item[3].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes

* item[3].item[3].item[1].linkId = "mediastinal-mass-density"
* item[3].item[3].item[1].text = "Density texture"
* item[3].item[3].item[1].type = #coding
* item[3].item[3].item[1].enableWhen[0].question = "mediastinal-mass"
* item[3].item[3].item[1].enableWhen[0].operator = #=
* item[3].item[3].item[1].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[3].item[3].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#cystic "Cystic"
* item[3].item[3].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#solid-texture "Solid"
* item[3].item[3].item[1].answerOption[2].valueCoding = $lung-questionnaire-options-cs-url#calcified-density "Calcified"

// 5. Lymphadenopathy
* item[3].item[4].linkId = "lymphadenopathy"
* item[3].item[4].text = "Lymphadenopathy (>=15mm)"
* item[3].item[4].type = #coding
* item[3].item[4].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[4].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[4].item[0].linkId = "lymphadenopathy-location"
* item[3].item[4].item[0].text = "Location(s)"
* item[3].item[4].item[0].type = #coding
* item[3].item[4].item[0].repeats = true
* item[3].item[4].item[0].enableWhen[0].question = "lymphadenopathy"
* item[3].item[4].item[0].enableWhen[0].operator = #=
* item[3].item[4].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[3].item[4].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#neck "Neck"
* item[3].item[4].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#paraclavicular "Paraclavicular"
* item[3].item[4].item[0].answerOption[2].valueCoding = $lung-questionnaire-options-cs-url#mediastinal "Mediastinal"
* item[3].item[4].item[0].answerOption[3].valueCoding = $lung-questionnaire-options-cs-url#hilar-right "Hilar - right"
* item[3].item[4].item[0].answerOption[4].valueCoding = $lung-questionnaire-options-cs-url#hilar-left "Hilar - left"
* item[3].item[4].item[0].answerOption[5].valueCoding = $lung-questionnaire-options-cs-url#hilar-both "Hilar - both"
* item[3].item[4].item[0].answerOption[6].valueCoding = $lung-questionnaire-options-cs-url#axillary-right "Axillary - right"
* item[3].item[4].item[0].answerOption[7].valueCoding = $lung-questionnaire-options-cs-url#axillary-left "Axillary - left"
* item[3].item[4].item[0].answerOption[8].valueCoding = $lung-questionnaire-options-cs-url#axillary-both "Axillary - both"

// 6. Thyroid changes
* item[3].item[5].linkId = "thyroid-nodules"
* item[3].item[5].text = "Thyroid changes (suspicious nodules)"
* item[3].item[5].type = #coding
* item[3].item[5].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[5].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// 7. Pericardial effusion
* item[3].item[6].linkId = "pericardial-effusion"
* item[3].item[6].text = "Fluid in the pericardial cavity (significant)"
* item[3].item[6].type = #coding
* item[3].item[6].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[6].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[6].item[0].linkId = "pericardial-effusion-severity"
* item[3].item[6].item[0].text = "Severity"
* item[3].item[6].item[0].type = #coding
* item[3].item[6].item[0].enableWhen[0].question = "pericardial-effusion"
* item[3].item[6].item[0].enableWhen[0].operator = #=
* item[3].item[6].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[3].item[6].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#moderate "Moderate"
* item[3].item[6].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#severe "Severe / large"

// 8. Esophageal changes
* item[3].item[7].linkId = "esophageal-changes"
* item[3].item[7].text = "Changes in the esophagus"
* item[3].item[7].type = #coding
* item[3].item[7].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[7].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[7].item[0].linkId = "esophageal-lumen-expansion"
* item[3].item[7].item[0].text = "Significant lumen expansion"
* item[3].item[7].item[0].type = #coding
* item[3].item[7].item[0].enableWhen[0].question = "esophageal-changes"
* item[3].item[7].item[0].enableWhen[0].operator = #=
* item[3].item[7].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[3].item[7].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[7].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[7].item[1].linkId = "esophageal-mass"
* item[3].item[7].item[1].text = "Mass"
* item[3].item[7].item[1].type = #coding
* item[3].item[7].item[1].enableWhen[0].question = "esophageal-changes"
* item[3].item[7].item[1].enableWhen[0].operator = #=
* item[3].item[7].item[1].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[3].item[7].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[7].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// 9. Abdominal aortic aneurysm
* item[3].item[8].linkId = "abdominal-aortic-aneurysm"
* item[3].item[8].text = "Abdominal aortic aneurysm"
* item[3].item[8].type = #coding
* item[3].item[8].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[8].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// 10. Breast findings
* item[3].item[9].linkId = "breast-findings"
* item[3].item[9].text = "Suspicious findings in the breasts"
* item[3].item[9].type = #coding
* item[3].item[9].repeats = true
* item[3].item[9].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[9].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[9].item[0].linkId = "breast-laterality"
* item[3].item[9].item[0].text = "Location"
* item[3].item[9].item[0].type = #coding
* item[3].item[9].item[0].enableWhen[0].question = "breast-findings"
* item[3].item[9].item[0].enableWhen[0].operator = #=
* item[3].item[9].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[3].item[9].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#right "Right breast"
* item[3].item[9].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#left "Left breast"

// 11. Liver lesions
* item[3].item[10].linkId = "liver-lesions"
* item[3].item[10].text = "Liver lesions"
* item[3].item[10].type = #coding
* item[3].item[10].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[10].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[10].item[0].linkId = "liver-multiplicity"
* item[3].item[10].item[0].text = "Number of lesions"
* item[3].item[10].item[0].type = #coding
* item[3].item[10].item[0].enableWhen[0].question = "liver-lesions"
* item[3].item[10].item[0].enableWhen[0].operator = #=
* item[3].item[10].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[3].item[10].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#singular "One"
* item[3].item[10].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#multiple "Multiple"

* item[3].item[10].item[1].linkId = "liver-texture"
* item[3].item[10].item[1].text = "Texture"
* item[3].item[10].item[1].type = #coding
* item[3].item[10].item[1].enableWhen[0].question = "liver-lesions"
* item[3].item[10].item[1].enableWhen[0].operator = #=
* item[3].item[10].item[1].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[3].item[10].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#cystic "Cystic"
* item[3].item[10].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#solid-texture "Solid"
* item[3].item[10].item[1].answerOption[2].valueCoding = $lung-questionnaire-options-cs-url#mixed-complex "Mixed-complex"
* item[3].item[10].item[1].answerOption[3].valueCoding = $lung-questionnaire-options-cs-url#calcified-density "Calcified"

// 12. Kidney lesions
* item[3].item[11].linkId = "kidney-lesions"
* item[3].item[11].text = "Kidney lesions"
* item[3].item[11].type = #coding
* item[3].item[11].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[11].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[11].item[0].linkId = "kidney-size"
* item[3].item[11].item[0].text = "Size – largest dimension in axial plane (mm)"
* item[3].item[11].item[0].type = #quantity
* item[3].item[11].item[0].enableWhen[0].question = "kidney-lesions"
* item[3].item[11].item[0].enableWhen[0].operator = #=
* item[3].item[11].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes

* item[3].item[11].item[1].linkId = "kidney-laterality"
* item[3].item[11].item[1].text = "Location"
* item[3].item[11].item[1].type = #coding
* item[3].item[11].item[1].enableWhen[0].question = "kidney-lesions"
* item[3].item[11].item[1].enableWhen[0].operator = #=
* item[3].item[11].item[1].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[3].item[11].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#right "Right kidney"
* item[3].item[11].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#left "Left kidney"

* item[3].item[11].item[2].linkId = "kidney-density"
* item[3].item[11].item[2].text = "Density"
* item[3].item[11].item[2].type = #coding
* item[3].item[11].item[2].enableWhen[0].question = "kidney-lesions"
* item[3].item[11].item[2].enableWhen[0].operator = #=
* item[3].item[11].item[2].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[3].item[11].item[2].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#cystic "Cystic"
* item[3].item[11].item[2].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#solid-texture "Solid"
* item[3].item[11].item[2].answerOption[2].valueCoding = $lung-questionnaire-options-cs-url#mixed-complex "Mixed-complex"
* item[3].item[11].item[2].answerOption[3].valueCoding = $lung-questionnaire-options-cs-url#calcified-density "Calcified"

// 13. Bone changes
* item[3].item[12].linkId = "bone-changes"
* item[3].item[12].text = "Changes in bones"
* item[3].item[12].type = #coding
* item[3].item[12].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[12].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// 14. Adrenal formations
* item[3].item[13].linkId = "adrenal-formations"
* item[3].item[13].text = "Adrenal formations"
* item[3].item[13].type = #coding
* item[3].item[13].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[13].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[13].item[0].linkId = "adrenal-laterality"
* item[3].item[13].item[0].text = "Laterality"
* item[3].item[13].item[0].type = #coding
* item[3].item[13].item[0].enableWhen[0].question = "adrenal-formations"
* item[3].item[13].item[0].enableWhen[0].operator = #=
* item[3].item[13].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[3].item[13].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#right "Right"
* item[3].item[13].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#left "Left"

* item[3].item[13].item[1].linkId = "adrenal-size"
* item[3].item[13].item[1].text = "Size – largest dimension in axial plane (mm)"
* item[3].item[13].item[1].type = #quantity
* item[3].item[13].item[1].enableWhen[0].question = "adrenal-formations"
* item[3].item[13].item[1].enableWhen[0].operator = #=
* item[3].item[13].item[1].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes

* item[3].item[13].item[2].linkId = "adrenal-density"
* item[3].item[13].item[2].text = "Density (HV)"
* item[3].item[13].item[2].type = #quantity
* item[3].item[13].item[2].enableWhen[0].question = "adrenal-formations"
* item[3].item[13].item[2].enableWhen[0].operator = #=
* item[3].item[13].item[2].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes

// 15. Gallbladder changes
* item[3].item[14].linkId = "gallbladder-changes"
* item[3].item[14].text = "Changes in the gallbladder"
* item[3].item[14].type = #coding
* item[3].item[14].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[14].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[14].item[0].linkId = "gallbladder-cholecystitis"
* item[3].item[14].item[0].text = "Suspected signs of acute cholecystitis"
* item[3].item[14].item[0].type = #coding
* item[3].item[14].item[0].enableWhen[0].question = "gallbladder-changes"
* item[3].item[14].item[0].enableWhen[0].operator = #=
* item[3].item[14].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[3].item[14].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[14].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[14].item[1].linkId = "gallbladder-masses"
* item[3].item[14].item[1].text = "Infiltration with masses"
* item[3].item[14].item[1].type = #coding
* item[3].item[14].item[1].enableWhen[0].question = "gallbladder-changes"
* item[3].item[14].item[1].enableWhen[0].operator = #=
* item[3].item[14].item[1].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[3].item[14].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[14].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// 16. Additional findings notes
* item[3].item[15].linkId = "additional-findings-text"
* item[3].item[15].text = "Additional findings (free text)"
* item[3].item[15].type = #text
* item[3].item[15].required = false

// ---------------------------------------------------------------------------
// Group 5 – Notes
// ---------------------------------------------------------------------------
* item[4].linkId = "grp-notes"
* item[4].text = "Additional notes"
* item[4].type = #group

* item[4].item[0].linkId = "notes"
* item[4].item[0].text = "Notes (includes all additional findings)"
* item[4].item[0].type = #text

// ---------------------------------------------------------------------------
// Group 6 – Conclusion and recommendations (ADP 1.3)
// ---------------------------------------------------------------------------
* item[5].linkId = "grp-conclusion"
* item[5].text = "Conclusion and recommendations"
* item[5].type = #group

* item[5].item[0].linkId = "lung-rads-category"
* item[5].item[0].text = "LUNG-RADS findings category"
* item[5].item[0].type = #coding
* item[5].item[0].required = true
* item[5].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#lung-rads-0 "LUNG-RADS 0 – Images cannot be evaluated"
* item[5].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#lung-rads-1 "LUNG-RADS 1 – No findings detected in the lungs"
* item[5].item[0].answerOption[2].valueCoding = $lung-questionnaire-options-cs-url#lung-rads-2 "LUNG-RADS 2 – Very likely benign formation"
* item[5].item[0].answerOption[3].valueCoding = $lung-questionnaire-options-cs-url#lung-rads-3 "LUNG-RADS 3 – Likely benign formation"
* item[5].item[0].answerOption[4].valueCoding = $lung-questionnaire-options-cs-url#lung-rads-4a "LUNG-RADS 4A – Detected suspicious formation"
* item[5].item[0].answerOption[5].valueCoding = $lung-questionnaire-options-cs-url#lung-rads-4b "LUNG-RADS 4B – Detected very suspicious formation"
* item[5].item[0].answerOption[6].valueCoding = $lung-questionnaire-options-cs-url#lung-rads-4x "LUNG-RADS 4X – Detected extremely suspicious formation"

* item[5].item[1].linkId = "lung-rads-s-modifier"
* item[5].item[1].text = "S modifier – significant incidental finding contributing to category"
* item[5].item[1].type = #coding
* item[5].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[5].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[5].item[2].linkId = "recommendation"
* item[5].item[2].text = "Recommendation"
* item[5].item[2].type = #coding
* item[5].item[2].required = true
* item[5].item[2].answerOption[0].valueCoding = $lung-recommendation-cs-url#repeat-36m "Repeat LDCT after 36 months"
* item[5].item[2].answerOption[1].valueCoding = $lung-recommendation-cs-url#repeat-1m "Repeat LDCT after 1 month"
* item[5].item[2].answerOption[2].valueCoding = $lung-recommendation-cs-url#insufficient-prior-images "Insufficient data - previous images required"
* item[5].item[2].answerOption[3].valueCoding = $lung-recommendation-cs-url#followup-12m "Follow-up LDCT after 12 months"
* item[5].item[2].answerOption[4].valueCoding = $lung-recommendation-cs-url#followup-6m "Follow-up LDCT after 6 months"
* item[5].item[2].answerOption[5].valueCoding = $lung-recommendation-cs-url#followup-3m "Follow-up LDCT after 3 months"
* item[5].item[2].answerOption[6].valueCoding = $lung-recommendation-cs-url#pulmonologist-consult "Refer for pulmonologist consultation"
* item[5].item[2].answerOption[7].valueCoding = $lung-recommendation-cs-url#specialist-consult "Refer for specialist consultation"

* item[5].item[3].linkId = "conclusion-notes"
* item[5].item[3].text = "Conclusion notes"
* item[5].item[3].type = #text

* item[5].item[4].linkId = "specialist-qualification"
* item[5].item[4].text = "Professional qualification of the specialist"
* item[5].item[4].type = #string
* item[5].item[4].required = true

* item[5].item[5].linkId = "specialist-first-name"
* item[5].item[5].text = "First name"
* item[5].item[5].type = #string
* item[5].item[5].required = true

* item[5].item[6].linkId = "specialist-last-name"
* item[5].item[6].text = "Last name"
* item[5].item[6].type = #string
* item[5].item[6].required = true

* item[5].item[7].linkId = "conclusion-institution-name"
* item[5].item[7].text = "Institution name"
* item[5].item[7].type = #string

* item[5].item[8].linkId = "conclusion-institution-code"
* item[5].item[8].text = "Institution code"
* item[5].item[8].type = #string

* item[5].item[9].linkId = "conclusion-institution-address"
* item[5].item[9].text = "Institution address"
* item[5].item[9].type = #string

* item[5].item[10].linkId = "conclusion-institution-phone"
* item[5].item[10].text = "Institution phone number"
* item[5].item[10].type = #string

* item[5].item[11].linkId = "conclusion-institution-email"
* item[5].item[11].text = "Institution email"
* item[5].item[11].type = #string

// =============================================================================
// QuestionnaireResponse: LDCT ESPBI example
// =============================================================================

Instance: questionnaireresponse-ldct-example
InstanceOf: QuestionnaireResponse
Usage: #example
Title: "QuestionnaireResponse: LDCT ESPBI (example)"
Description: "LDCT screening example – solid nodule in right upper lobe, moderate coronary calcification, LUNG-RADS 4A."
* questionnaire = "https://hl7.lt/fhir/lung/Questionnaire/questionnaire-ldct-lt-lung"
* status = #completed
* authored = "2025-11-20T15:00:00Z"
* subject = Reference(example-patient-male)
* author = Reference(example-practitioner)

// Group 1 – General information
* item[0].linkId = "grp-general"
* item[0].text = "General information"

* item[0].item[0].linkId = "exam-date"
* item[0].item[0].text = "LDCT examination date"
* item[0].item[0].answer[0].valueDateTime = "2025-11-20T14:30:00Z"

* item[0].item[1].linkId = "ctdivol"
* item[0].item[1].text = "Volume CT Dose Index – CTDIvol (mGy)"
* item[0].item[1].answer[0].valueQuantity = 3.2 'mGy' "mGy"

* item[0].item[2].linkId = "dlp"
* item[0].item[2].text = "Dose Length Product – DLP (mGy x cm)"
* item[0].item[2].answer[0].valueQuantity = 105 'mGy.cm' "mGy.cm"

* item[0].item[3].linkId = "technologist-name"
* item[0].item[3].text = "Radiology technologist (qualification, name)"
* item[0].item[3].answer[0].valueString = "Radiology technologist, Jonas Jonaitis"

* item[0].item[4].linkId = "facility-name"
* item[0].item[4].text = "Healthcare institution name and code"
* item[0].item[4].answer[0].valueString = "Vilniaus universiteto ligonines Santaros klinikos, 111111111"

// Group 2 – Nodule findings
* item[1].linkId = "grp-nodules"
* item[1].text = "Nodule findings"

* item[1].item[0].linkId = "nodule-type"
* item[1].item[0].text = "Type of lesion"
* item[1].item[0].answer[0].valueCoding = $lung-questionnaire-options-cs-url#solid "Solid"

* item[1].item[1].linkId = "nodule-lobe"
* item[1].item[1].text = "Lung lobe"
* item[1].item[1].answer[0].valueCoding = $lung-questionnaire-options-cs-url#right-upper "Upper lobe of the right lung"

* item[1].item[2].linkId = "ct-slice-number"
* item[1].item[2].text = "CT image slice number"
* item[1].item[2].answer[0].valueInteger = 142

* item[1].item[3].linkId = "morphology-spiculated"
* item[1].item[3].text = "With spicules"
* item[1].item[3].answer[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"

* item[1].item[4].linkId = "morphology-irregular"
* item[1].item[4].text = "Irregular contours"
* item[1].item[4].answer[0].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[1].item[5].linkId = "nodule-mean-diameter"
* item[1].item[5].text = "Size – average diameter (mm)"
* item[1].item[5].answer[0].valueQuantity = 9.0 'mm' "mm"

// Group 3 – Incidental findings in the lungs
* item[2].linkId = "grp-incidental-lung"
* item[2].text = "Significant incidental findings in the lungs"

* item[2].item[0].linkId = "emphysema"
* item[2].item[0].text = "Emphysema"
* item[2].item[0].answer[0].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// Group 4 – Incidental findings not in the lungs
* item[3].linkId = "grp-incidental-extra"
* item[3].text = "Significant incidental findings not in the lungs"

* item[3].item[0].linkId = "coronary-calcification"
* item[3].item[0].text = "Coronary artery calcification"
* item[3].item[0].answer[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"

// Group 5 – Conclusion
* item[4].linkId = "grp-conclusion"
* item[4].text = "Conclusion and recommendations"

* item[4].item[0].linkId = "lung-rads-category"
* item[4].item[0].text = "LUNG-RADS findings category"
* item[4].item[0].answer[0].valueCoding = $lung-questionnaire-options-cs-url#lung-rads-4a "LUNG-RADS 4A – Detected suspicious formation"

* item[4].item[1].linkId = "conclusion-notes"
* item[4].item[1].text = "Conclusion notes"
* item[4].item[1].answer[0].valueString = "Suspicious solid nodule right upper lobe 9mm with spiculated margins. Recommend 3-month follow-up LDCT. Moderate coronary calcification noted."

* item[4].item[2].linkId = "specialist-name"
* item[4].item[2].text = "Specialist who formulated conclusions (qualification, name)"
* item[4].item[2].answer[0].valueString = "Radiologist, Petras Gydytojaitis"
