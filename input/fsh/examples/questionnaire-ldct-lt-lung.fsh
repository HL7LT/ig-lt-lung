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

* item[0].item[4].linkId = "technologist-name"
* item[0].item[4].text = "Radiology technologist (qualification, name)"
* item[0].item[4].type = #string

* item[0].item[5].linkId = "facility-name"
* item[0].item[5].text = "Healthcare institution name and code"
* item[0].item[5].type = #string

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
// Group 3 – Incidental findings in the lungs
// ---------------------------------------------------------------------------
* item[2].linkId = "grp-incidental-lung"
* item[2].text = "Significant incidental findings in the lungs"
* item[2].type = #group

* item[2].item[0].linkId = "interstitial-changes"
* item[2].item[0].text = "Interstitial lung changes (>5% of lung volume)"
* item[2].item[0].type = #coding
* item[2].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[1].linkId = "emphysema"
* item[2].item[1].text = "Emphysema"
* item[2].item[1].type = #coding
* item[2].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[1].item[0].linkId = "emphysema-severity"
* item[2].item[1].item[0].text = "Emphysema severity"
* item[2].item[1].item[0].type = #coding
* item[2].item[1].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#moderate "Moderate (25-50%)"
* item[2].item[1].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#severe "Severe / expressed (>50%)"

* item[2].item[2].linkId = "bronchiectasis"
* item[2].item[2].text = "Bronchiectasis"
* item[2].item[2].type = #coding
* item[2].item[2].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[2].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[3].linkId = "pleural-fluid"
* item[2].item[3].text = "Fluid in the pleural cavity"
* item[2].item[3].type = #coding
* item[2].item[3].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[3].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[4].linkId = "pleural-changes"
* item[2].item[4].text = "Pleural changes"
* item[2].item[4].type = #coding
* item[2].item[4].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[4].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[5].linkId = "pneumothorax"
* item[2].item[5].text = "Pneumothorax"
* item[2].item[5].type = #coding
* item[2].item[5].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[5].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[6].linkId = "pneumomediastinum"
* item[2].item[6].text = "Pneumomediastinum"
* item[2].item[6].type = #coding
* item[2].item[6].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[6].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[7].linkId = "diaphragm-changes"
* item[2].item[7].text = "Changes in diaphragms"
* item[2].item[7].type = #coding
* item[2].item[7].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[7].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[8].linkId = "consolidation"
* item[2].item[8].text = "Consolidation"
* item[2].item[8].type = #coding
* item[2].item[8].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[8].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[9].linkId = "tuberculosis"
* item[2].item[9].text = "Tuberculosis"
* item[2].item[9].type = #coding
* item[2].item[9].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[9].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// ---------------------------------------------------------------------------
// Group 4 – Incidental findings not in the lungs
// ---------------------------------------------------------------------------
* item[3].linkId = "grp-incidental-extra"
* item[3].text = "Significant incidental findings not in the lungs"
* item[3].type = #group

* item[3].item[0].linkId = "coronary-calcification"
* item[3].item[0].text = "Coronary artery calcification"
* item[3].item[0].type = #coding
* item[3].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[1].linkId = "aortic-valve-calcification"
* item[3].item[1].text = "Aortic valve calcification"
* item[3].item[1].type = #coding
* item[3].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[2].linkId = "thoracic-aortic-aneurysm"
* item[3].item[2].text = "Thoracic aortic aneurysm (dilation >=45mm)"
* item[3].item[2].type = #coding
* item[3].item[2].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[2].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[3].linkId = "mediastinal-mass"
* item[3].item[3].text = "Mediastinal mass"
* item[3].item[3].type = #coding
* item[3].item[3].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[3].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[4].linkId = "lymphadenopathy"
* item[3].item[4].text = "Lymphadenopathy (>=15mm)"
* item[3].item[4].type = #coding
* item[3].item[4].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[4].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[5].linkId = "thyroid-nodules"
* item[3].item[5].text = "Thyroid changes (suspicious nodules)"
* item[3].item[5].type = #coding
* item[3].item[5].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[5].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[6].linkId = "pericardial-effusion"
* item[3].item[6].text = "Fluid in the pericardial cavity (significant)"
* item[3].item[6].type = #coding
* item[3].item[6].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[6].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[7].linkId = "esophageal-changes"
* item[3].item[7].text = "Changes in the esophagus"
* item[3].item[7].type = #coding
* item[3].item[7].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[7].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[8].linkId = "abdominal-aortic-aneurysm"
* item[3].item[8].text = "Abdominal aortic aneurysm"
* item[3].item[8].type = #coding
* item[3].item[8].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[8].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[9].linkId = "breast-findings"
* item[3].item[9].text = "Suspicious findings in the breasts"
* item[3].item[9].type = #coding
* item[3].item[9].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[9].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[10].linkId = "liver-lesions"
* item[3].item[10].text = "Liver lesions"
* item[3].item[10].type = #coding
* item[3].item[10].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[10].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[11].linkId = "kidney-lesions"
* item[3].item[11].text = "Kidney lesions"
* item[3].item[11].type = #coding
* item[3].item[11].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[11].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[12].linkId = "bone-changes"
* item[3].item[12].text = "Changes in bones"
* item[3].item[12].type = #coding
* item[3].item[12].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[12].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[13].linkId = "adrenal-formations"
* item[3].item[13].text = "Adrenal formations"
* item[3].item[13].type = #coding
* item[3].item[13].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[13].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[3].item[14].linkId = "gallbladder-changes"
* item[3].item[14].text = "Changes in the gallbladder"
* item[3].item[14].type = #coding
* item[3].item[14].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[3].item[14].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

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
// Group 6 – Conclusion and recommendations
// ---------------------------------------------------------------------------
* item[5].linkId = "grp-conclusion"
* item[5].text = "Conclusion and recommendations"
* item[5].type = #group

* item[5].item[0].linkId = "lung-rads-category"
* item[5].item[0].text = "LUNG-RADS findings category"
* item[5].item[0].type = #coding
* item[5].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#lung-rads-0 "LUNG-RADS 0 – Images cannot be evaluated"
* item[5].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#lung-rads-1 "LUNG-RADS 1 – No findings detected in the lungs"
* item[5].item[0].answerOption[2].valueCoding = $lung-questionnaire-options-cs-url#lung-rads-2 "LUNG-RADS 2 – Very likely benign formation"
* item[5].item[0].answerOption[3].valueCoding = $lung-questionnaire-options-cs-url#lung-rads-3 "LUNG-RADS 3 – Likely benign formation"
* item[5].item[0].answerOption[4].valueCoding = $lung-questionnaire-options-cs-url#lung-rads-4a "LUNG-RADS 4A – Detected suspicious formation"
* item[5].item[0].answerOption[5].valueCoding = $lung-questionnaire-options-cs-url#lung-rads-4b "LUNG-RADS 4B – Detected very suspicious formation"
* item[5].item[0].answerOption[6].valueCoding = $lung-questionnaire-options-cs-url#lung-rads-4x "LUNG-RADS 4X – Detected extremely suspicious formation"
* item[5].item[0].answerOption[7].valueCoding = $lung-questionnaire-options-cs-url#lung-rads-s "LUNG-RADS S – Additional recommendation"

* item[5].item[1].linkId = "conclusion-notes"
* item[5].item[1].text = "Conclusion notes"
* item[5].item[1].type = #text

* item[5].item[2].linkId = "specialist-name"
* item[5].item[2].text = "Specialist who formulated conclusions (qualification, name)"
* item[5].item[2].type = #string

* item[5].item[3].linkId = "conclusion-institution"
* item[5].item[3].text = "Institution where conclusions were formulated (name, code)"
* item[5].item[3].type = #string

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
