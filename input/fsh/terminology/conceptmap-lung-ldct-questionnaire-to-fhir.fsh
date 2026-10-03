// -------------------------------------------------------------------------------------------
// Supplementary prototype ConceptMap — Lung LDCT screening Questionnaires → FHIR profile mapping.
//
// Authored as a companion artefact to the JMIR Med Inform implementation-report revision
// (see Section 3.8 and Section 4.4, Lesson 2 of the manuscript).
// Status: draft / experimental. Covers clinically meaningful linkIds from both
// `questionnaire-pre-ldct-lt-lung` (radiologist intake) and `questionnaire-ldct-lt-lung`
// (LDCT structured report). Form-filler / branching / section-header items are intentionally
// out of scope for this prototype.
//
// R5 ConceptMap:
//   - target.relationship uses http://hl7.org/fhir/concept-map-relationship (not R4 equivalence).
//   - target.comment carries the concrete StructureDefinition URL and an example Instance URL.
//   - Two groups are published: one per source Questionnaire.
// -------------------------------------------------------------------------------------------

Alias: $cm-rel = http://hl7.org/fhir/concept-map-relationship
Alias: $pre-ldct-q-url = https://hl7.lt/fhir/lung/Questionnaire/questionnaire-pre-ldct-lt-lung
Alias: $ldct-q-url = https://hl7.lt/fhir/lung/Questionnaire/questionnaire-ldct-lt-lung

CodeSystem: LungPreLdctQuestionnaireItem
Id: lung-pre-ldct-questionnaire-item
Title: "Pre-LDCT screening intake Questionnaire item (linkId)"
Description: "Stable linkId values for the pre-LDCT radiologist intake Questionnaire; source codes for the Lung ConceptMap prototype."
* ^url = "https://hl7.lt/fhir/lung/CodeSystem/lung-pre-ldct-questionnaire-item"
* ^version = "0.1.0"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete
* ^publisher = "HL7 Lithuania"
* #registration-date "Registration date"
* #self-care "Self-care capability"
* #bedridden "Bedridden status"
* #prior-chest-ct "Prior chest CT documented"
* #prior-chest-ct-date "Prior chest CT date"
* #recent-respiratory-infection "Recent respiratory infection flag"
* #height "Height (cm)"
* #weight "Weight (kg)"
* #smokes "Currently smokes"
* #cigarettes "Cigarette use"
* #cigarettes-per-day "Cigarettes per day"
* #pack-years "Pack-years"
* #e-cigarettes "E-cigarette use"
* #heated-tobacco "Heated tobacco use"
* #tobacco "Loose tobacco use"
* #pipe "Pipe use"
* #smoked-before "Ever smoked"
* #years-smoked "Years smoked"
* #years-quit "Years since quit"
* #diagnoses "Relevant diagnoses (ICD-10)"

CodeSystem: LungLdctQuestionnaireItem
Id: lung-ldct-questionnaire-item
Title: "LDCT structured-report Questionnaire item (linkId)"
Description: "Stable linkId values for the LDCT structured-report Questionnaire; source codes for the Lung ConceptMap prototype."
* ^url = "https://hl7.lt/fhir/lung/CodeSystem/lung-ldct-questionnaire-item"
* ^version = "0.1.0"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete
* ^publisher = "HL7 Lithuania"
* #exam-date "LDCT exam date"
* #ctdivol "CTDIvol (mGy)"
* #dlp "DLP (mGy·cm)"
* #technologist-qualification "Technologist qualification"
* #facility-name "Facility name"
* #nodule-type "Nodule type (solid / part-solid / non-solid)"
* #nodule-lobe "Nodule lobe"
* #morphology-spiculated "Spiculated margin"
* #morphology-irregular "Irregular margin"
* #morphology-pleural "Pleural attachment"
* #nodule-mean-diameter "Nodule mean diameter (mm)"
* #nodule-long-axis "Nodule long-axis diameter (mm)"
* #nodule-short-axis "Nodule short-axis diameter (mm)"
* #nodule-volume "Nodule volume (mm³)"
* #solid-part-mean-diameter "Solid-part mean diameter (mm)"
* #solid-part-long-axis "Solid-part long-axis (mm)"
* #solid-part-short-axis "Solid-part short-axis (mm)"
* #solid-part-volume "Solid-part volume (mm³)"
* #nodule-note "Nodule free-text note"
* #interstitial-changes "Interstitial lung changes (present/absent)"
* #interstitial-subtype "Interstitial subtype"
* #emphysema "Emphysema flag"
* #emphysema-severity "Emphysema severity"
* #bronchiectasis "Bronchiectasis flag"
* #bronchiectasis-severity "Bronchiectasis severity"
* #pleural-fluid "Pleural fluid flag"
* #pleural-fluid-laterality "Pleural fluid laterality"
* #pleural-fluid-quantity "Pleural fluid quantity"
* #pneumothorax "Pneumothorax flag"
* #pneumothorax-laterality "Pneumothorax laterality"
* #consolidation "Consolidation flag"
* #consolidation-inflammatory "Consolidation — inflammatory"
* #consolidation-malignant "Consolidation — malignant"
* #coronary-calcification "Coronary artery calcification"
* #coronary-calcification-severity "Coronary calcification severity"
* #thoracic-aortic-aneurysm "Thoracic aortic aneurysm"
* #mediastinal-mass "Mediastinal mass"
* #mediastinal-mass-size "Mediastinal mass size"
* #lymphadenopathy "Lymphadenopathy"
* #lymphadenopathy-location "Lymphadenopathy location"
* #thyroid-nodules "Thyroid nodules"
* #liver-lesions "Liver lesions"
* #kidney-lesions "Kidney lesions"
* #adrenal-lesions "Adrenal lesions"
* #lung-rads-category "Lung-RADS category"
* #lung-rads-modifier "Lung-RADS modifier"
* #recommendation "Radiologist recommendation"


CodeSystem: LungFhirMappingTarget
Id: lung-fhir-mapping-target
Title: "Lung Questionnaire → FHIR profile mapping target"
Description: "Short identifiers for the FHIR profile / element combinations referenced by the Lung ConceptMap prototype."
* ^url = "https://hl7.lt/fhir/lung/CodeSystem/lung-fhir-mapping-target"
* ^version = "0.1.0"
* ^status = #draft
* ^experimental = true
* ^caseSensitive = true
* ^content = #complete
* ^publisher = "HL7 Lithuania"
// Foundation / cross-IG targets
* #encounter-period "Encounter.period (EncounterLt, ig-lt-base)"
* #observation-body-height "BodyHeightLt (ig-lt-vitalsigns)"
* #observation-body-weight "BodyWeightLt (ig-lt-vitalsigns)"
* #observation-tobacco-use "TobaccoUseLtLifestyle (ig-lt-lifestyle)"
* #observation-pack-years "PackYearsLtLifestyle (ig-lt-lifestyle)"
* #observation-smoking-duration "SmokingDurationLtLifestyle (ig-lt-lifestyle)"
* #observation-smoking-cessation "SmokingCessationLtLifestyle (ig-lt-lifestyle)"
* #condition-diagnosis "ConditionLt (ig-lt-base)"
* #procedure-prior-chest-ct "ProcedureLt (prior CT), ig-lt-base"
* #observation-functional-status "ObservationLt (functional status), ig-lt-base"
// Lung-specific targets
* #imaging-report-ldct "LungReportLtLung"
* #imaging-composition-ldct "LungCompositionLtLung"
* #observation-nodule "PulmonaryNoduleObservationLtLung"
* #observation-nodule-component "PulmonaryNoduleComponent (nested)"
* #observation-incidental-finding "IncidentalFindingLtLung"
* #observation-adrenal-lesion "AdrenalLesionLtLung"
* #observation-kidney-lesion "KidneyLesionLtLung"
* #observation-mediastinal-mass "MediastinalMassLtLung"
* #observation-lung-rads "LungRadsAssessmentLtLung"
* #observation-recommendation "LungRecommendationObservationLtLung"
* #observation-ctdi "ObservationLt — radiation dose (CTDIvol / DLP)"
* #practitioner-role "PractitionerRoleLt (technologist)"
* #organization "OrganizationLt (facility)"


// -------------------------------------------------------------------------------------------
// ConceptMap 1/2 — Pre-LDCT intake Questionnaire → FHIR
// -------------------------------------------------------------------------------------------

Instance: conceptmap-lung-pre-ldct-questionnaire-to-fhir
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap: Pre-LDCT Questionnaire → FHIR mapping (prototype)"
Description: "Maps linkIds of the pre-LDCT intake Questionnaire to foundation (Base / VitalSigns / Lifestyle) profiles. Prototype skeleton supplied with the JMIR Med Inform implementation report."
* url = "https://hl7.lt/fhir/lung/ConceptMap/conceptmap-lung-pre-ldct-questionnaire-to-fhir"
* version = "0.1.0"
* name = "LungPreLdctQuestionnaireToFhir"
* title = "Pre-LDCT Questionnaire items to FHIR mapping (prototype)"
* status = #draft
* experimental = true
* date = "2026-04-20"
* publisher = "HL7 Lithuania"
* jurisdiction = urn:iso:std:iso:3166#LT
* group.source = "https://hl7.lt/fhir/lung/CodeSystem/lung-pre-ldct-questionnaire-item"
* group.target = "https://hl7.lt/fhir/lung/CodeSystem/lung-fhir-mapping-target"

* group.element[0].code = #registration-date
* group.element[0].display = "Registration date"
* group.element[0].target[0].code = #encounter-period
* group.element[0].target[0].relationship = $cm-rel#related-to
* group.element[0].target[0].comment = "EncounterLt.period (ig-lt-base). StructureDefinition: https://hl7.lt/fhir/base/StructureDefinition/encounter-lt."

* group.element[1].code = #self-care
* group.element[1].target[0].code = #observation-functional-status
* group.element[1].target[0].relationship = $cm-rel#related-to
* group.element[1].target[0].comment = "ObservationLt with SNOMED CT Karnofsky / ECOG-equivalent; or custom functional-status Observation."

* group.element[2].code = #bedridden
* group.element[2].target[0].code = #observation-functional-status
* group.element[2].target[0].relationship = $cm-rel#related-to
* group.element[2].target[0].comment = "Subcomponent of functional status; same Observation with component or sibling code."

* group.element[3].code = #prior-chest-ct
* group.element[3].target[0].code = #procedure-prior-chest-ct
* group.element[3].target[0].relationship = $cm-rel#related-to
* group.element[3].target[0].comment = "ProcedureLt or DiagnosticReportLt summary representing prior chest CT."

* group.element[4].code = #prior-chest-ct-date
* group.element[4].target[0].code = #procedure-prior-chest-ct
* group.element[4].target[0].relationship = $cm-rel#related-to
* group.element[4].target[0].comment = "Procedure.performedDateTime on the prior-chest-ct Procedure instance."

* group.element[5].code = #recent-respiratory-infection
* group.element[5].target[0].code = #condition-diagnosis
* group.element[5].target[0].relationship = $cm-rel#related-to
* group.element[5].target[0].comment = "ConditionLt with SNOMED respiratory-infection code and clinicalStatus=active/recent."

* group.element[6].code = #height
* group.element[6].target[0].code = #observation-body-height
* group.element[6].target[0].relationship = $cm-rel#related-to
* group.element[6].target[0].comment = "BodyHeightLt (ig-lt-vitalsigns). StructureDefinition: https://hl7.lt/fhir/vitalsigns/StructureDefinition/body-height."

* group.element[7].code = #weight
* group.element[7].target[0].code = #observation-body-weight
* group.element[7].target[0].relationship = $cm-rel#related-to
* group.element[7].target[0].comment = "BodyWeightLt (ig-lt-vitalsigns). StructureDefinition: https://hl7.lt/fhir/vitalsigns/StructureDefinition/body-weight."

* group.element[8].code = #smokes
* group.element[8].target[0].code = #observation-tobacco-use
* group.element[8].target[0].relationship = $cm-rel#equivalent
* group.element[8].target[0].comment = "TobaccoUseLtLifestyle (ig-lt-lifestyle). LOINC 72166-2 Smoking status. Also reused by CVD, Breast, Cervical."

* group.element[9].code = #cigarettes
* group.element[9].target[0].code = #observation-tobacco-use
* group.element[9].target[0].relationship = $cm-rel#related-to
* group.element[9].target[0].comment = "TobaccoUseLtLifestyle.component (tobacco product subtype) = cigarettes."

* group.element[10].code = #cigarettes-per-day
* group.element[10].target[0].code = #observation-tobacco-use
* group.element[10].target[0].relationship = $cm-rel#related-to
* group.element[10].target[0].comment = "TobaccoUseLtLifestyle.component 'cigarettes per day' (LOINC 8663-7)."

* group.element[11].code = #pack-years
* group.element[11].target[0].code = #observation-pack-years
* group.element[11].target[0].relationship = $cm-rel#equivalent
* group.element[11].target[0].comment = "PackYearsLtLifestyle (ig-lt-lifestyle). LOINC 8664-5 Pack-years."

* group.element[12].code = #e-cigarettes
* group.element[12].target[0].code = #observation-tobacco-use
* group.element[12].target[0].relationship = $cm-rel#related-to
* group.element[12].target[0].comment = "TobaccoUseLtLifestyle; code differentiates e-cigarette vs combustible."

* group.element[13].code = #heated-tobacco
* group.element[13].target[0].code = #observation-tobacco-use
* group.element[13].target[0].relationship = $cm-rel#related-to
* group.element[13].target[0].comment = "TobaccoUseLtLifestyle; code differentiates heated-tobacco product."

* group.element[14].code = #tobacco
* group.element[14].target[0].code = #observation-tobacco-use
* group.element[14].target[0].relationship = $cm-rel#related-to
* group.element[14].target[0].comment = "TobaccoUseLtLifestyle; differentiates loose-tobacco product."

* group.element[15].code = #pipe
* group.element[15].target[0].code = #observation-tobacco-use
* group.element[15].target[0].relationship = $cm-rel#related-to
* group.element[15].target[0].comment = "TobaccoUseLtLifestyle; differentiates pipe product."

* group.element[16].code = #smoked-before
* group.element[16].target[0].code = #observation-smoking-cessation
* group.element[16].target[0].relationship = $cm-rel#related-to
* group.element[16].target[0].comment = "SmokingCessationLtLifestyle — history of tobacco use prior to current status."

* group.element[17].code = #years-smoked
* group.element[17].target[0].code = #observation-smoking-duration
* group.element[17].target[0].relationship = $cm-rel#equivalent
* group.element[17].target[0].comment = "SmokingDurationLtLifestyle. LOINC 88030-2 (Tobacco smoking duration years)."

* group.element[18].code = #years-quit
* group.element[18].target[0].code = #observation-smoking-cessation
* group.element[18].target[0].relationship = $cm-rel#related-to
* group.element[18].target[0].comment = "SmokingCessationLtLifestyle.component years-since-cessation. LOINC 74010-0."

* group.element[19].code = #diagnoses
* group.element[19].target[0].code = #condition-diagnosis
* group.element[19].target[0].relationship = $cm-rel#related-to
* group.element[19].target[0].comment = "ConditionLt list (ICD-10 codes); relevant for LDCT eligibility / contra-indications."


// -------------------------------------------------------------------------------------------
// ConceptMap 2/2 — LDCT structured-report Questionnaire → FHIR
// -------------------------------------------------------------------------------------------

Instance: conceptmap-lung-ldct-questionnaire-to-fhir
InstanceOf: ConceptMap
Usage: #definition
Title: "ConceptMap: LDCT structured-report Questionnaire → FHIR mapping (prototype)"
Description: "Maps linkIds of the LDCT structured-report Questionnaire to Lung / foundation profiles, including Lung-RADS, pulmonary nodules, incidental findings, and dose Observations."
* url = "https://hl7.lt/fhir/lung/ConceptMap/conceptmap-lung-ldct-questionnaire-to-fhir"
* version = "0.1.0"
* name = "LungLdctQuestionnaireToFhir"
* title = "LDCT Questionnaire items to FHIR mapping (prototype)"
* status = #draft
* experimental = true
* date = "2026-04-20"
* publisher = "HL7 Lithuania"
* jurisdiction = urn:iso:std:iso:3166#LT
* group.source = "https://hl7.lt/fhir/lung/CodeSystem/lung-ldct-questionnaire-item"
* group.target = "https://hl7.lt/fhir/lung/CodeSystem/lung-fhir-mapping-target"

* group.element[0].code = #exam-date
* group.element[0].target[0].code = #imaging-composition-ldct
* group.element[0].target[0].relationship = $cm-rel#related-to
* group.element[0].target[0].comment = "LungCompositionLtLung.date. StructureDefinition: https://hl7.lt/fhir/lung/StructureDefinition/lung-composition-lt-lung."

* group.element[1].code = #ctdivol
* group.element[1].target[0].code = #observation-ctdi
* group.element[1].target[0].relationship = $cm-rel#related-to
* group.element[1].target[0].comment = "ObservationLt with LOINC 73971-0 (CT dose index) — radiation dose metric."

* group.element[2].code = #dlp
* group.element[2].target[0].code = #observation-ctdi
* group.element[2].target[0].relationship = $cm-rel#related-to
* group.element[2].target[0].comment = "ObservationLt with LOINC 73971-7 (Dose-length product) or DICOM SR code."

* group.element[3].code = #technologist-qualification
* group.element[3].target[0].code = #practitioner-role
* group.element[3].target[0].relationship = $cm-rel#related-to
* group.element[3].target[0].comment = "PractitionerRoleLt.code (ig-lt-base)."

* group.element[4].code = #facility-name
* group.element[4].target[0].code = #organization
* group.element[4].target[0].relationship = $cm-rel#related-to
* group.element[4].target[0].comment = "OrganizationLt.name (ig-lt-base)."

* group.element[5].code = #nodule-type
* group.element[5].target[0].code = #observation-nodule
* group.element[5].target[0].relationship = $cm-rel#equivalent
* group.element[5].target[0].comment = "PulmonaryNoduleObservationLtLung.valueCodeableConcept bound to pulmonary-nodule-type-vs-lt-lung."

* group.element[6].code = #nodule-lobe
* group.element[6].target[0].code = #observation-nodule
* group.element[6].target[0].relationship = $cm-rel#related-to
* group.element[6].target[0].comment = "PulmonaryNoduleObservationLtLung.bodySite from lung-lobe-vs-lt-lung."

* group.element[7].code = #morphology-spiculated
* group.element[7].target[0].code = #observation-nodule
* group.element[7].target[0].relationship = $cm-rel#related-to
* group.element[7].target[0].comment = "PulmonaryNoduleObservationLtLung.component[morphology] (pulmonary-nodule-morphology-vs-lt-lung)."

* group.element[8].code = #morphology-irregular
* group.element[8].target[0].code = #observation-nodule
* group.element[8].target[0].relationship = $cm-rel#related-to
* group.element[8].target[0].comment = "PulmonaryNoduleObservationLtLung.component[morphology]."

* group.element[9].code = #morphology-pleural
* group.element[9].target[0].code = #observation-nodule
* group.element[9].target[0].relationship = $cm-rel#related-to
* group.element[9].target[0].comment = "PulmonaryNoduleObservationLtLung.component[morphology]."

* group.element[10].code = #nodule-mean-diameter
* group.element[10].target[0].code = #observation-nodule-component
* group.element[10].target[0].relationship = $cm-rel#equivalent
* group.element[10].target[0].comment = "PulmonaryNoduleObservationLtLung.component[diameter-mean] Quantity (mm)."

* group.element[11].code = #nodule-long-axis
* group.element[11].target[0].code = #observation-nodule-component
* group.element[11].target[0].relationship = $cm-rel#equivalent
* group.element[11].target[0].comment = "PulmonaryNoduleObservationLtLung.component[diameter-long] Quantity (mm)."

* group.element[12].code = #nodule-short-axis
* group.element[12].target[0].code = #observation-nodule-component
* group.element[12].target[0].relationship = $cm-rel#equivalent
* group.element[12].target[0].comment = "PulmonaryNoduleObservationLtLung.component[diameter-short] Quantity (mm)."

* group.element[13].code = #nodule-volume
* group.element[13].target[0].code = #observation-nodule-component
* group.element[13].target[0].relationship = $cm-rel#equivalent
* group.element[13].target[0].comment = "PulmonaryNoduleObservationLtLung.component[volume] Quantity (mm³)."

* group.element[14].code = #solid-part-mean-diameter
* group.element[14].target[0].code = #observation-nodule-component
* group.element[14].target[0].relationship = $cm-rel#related-to
* group.element[14].target[0].comment = "PulmonaryNoduleObservationLtLung.component[solid-diameter-mean]."

* group.element[15].code = #solid-part-long-axis
* group.element[15].target[0].code = #observation-nodule-component
* group.element[15].target[0].relationship = $cm-rel#related-to
* group.element[15].target[0].comment = "PulmonaryNoduleObservationLtLung.component[solid-diameter-long]."

* group.element[16].code = #solid-part-short-axis
* group.element[16].target[0].code = #observation-nodule-component
* group.element[16].target[0].relationship = $cm-rel#related-to
* group.element[16].target[0].comment = "PulmonaryNoduleObservationLtLung.component[solid-diameter-short]."

* group.element[17].code = #solid-part-volume
* group.element[17].target[0].code = #observation-nodule-component
* group.element[17].target[0].relationship = $cm-rel#related-to
* group.element[17].target[0].comment = "PulmonaryNoduleObservationLtLung.component[solid-volume]."

* group.element[18].code = #nodule-note
* group.element[18].target[0].code = #observation-nodule
* group.element[18].target[0].relationship = $cm-rel#related-to
* group.element[18].target[0].comment = "PulmonaryNoduleObservationLtLung.note (free-text annotation)."

* group.element[19].code = #interstitial-changes
* group.element[19].target[0].code = #observation-incidental-finding
* group.element[19].target[0].relationship = $cm-rel#equivalent
* group.element[19].target[0].comment = "IncidentalFindingLtLung with category = interstitial; valueBoolean."

* group.element[20].code = #interstitial-subtype
* group.element[20].target[0].code = #observation-incidental-finding
* group.element[20].target[0].relationship = $cm-rel#related-to
* group.element[20].target[0].comment = "IncidentalFindingLtLung.component[subtype] bound to interstitial-subtype VS."

* group.element[21].code = #emphysema
* group.element[21].target[0].code = #observation-incidental-finding
* group.element[21].target[0].relationship = $cm-rel#equivalent
* group.element[21].target[0].comment = "IncidentalFindingLtLung for emphysema (category=emphysema)."

* group.element[22].code = #emphysema-severity
* group.element[22].target[0].code = #observation-incidental-finding
* group.element[22].target[0].relationship = $cm-rel#related-to
* group.element[22].target[0].comment = "IncidentalFindingLtLung.component[severity] with finding-quantity-lt-lung."

* group.element[23].code = #bronchiectasis
* group.element[23].target[0].code = #observation-incidental-finding
* group.element[23].target[0].relationship = $cm-rel#equivalent
* group.element[23].target[0].comment = "IncidentalFindingLtLung (category=bronchiectasis)."

* group.element[24].code = #bronchiectasis-severity
* group.element[24].target[0].code = #observation-incidental-finding
* group.element[24].target[0].relationship = $cm-rel#related-to
* group.element[24].target[0].comment = "IncidentalFindingLtLung.component[severity]."

* group.element[25].code = #pleural-fluid
* group.element[25].target[0].code = #observation-incidental-finding
* group.element[25].target[0].relationship = $cm-rel#equivalent
* group.element[25].target[0].comment = "IncidentalFindingLtLung (category=pleural-effusion)."

* group.element[26].code = #pleural-fluid-laterality
* group.element[26].target[0].code = #observation-incidental-finding
* group.element[26].target[0].relationship = $cm-rel#related-to
* group.element[26].target[0].comment = "IncidentalFindingLtLung.bodySite laterality component."

* group.element[27].code = #pleural-fluid-quantity
* group.element[27].target[0].code = #observation-incidental-finding
* group.element[27].target[0].relationship = $cm-rel#related-to
* group.element[27].target[0].comment = "IncidentalFindingLtLung.component[quantity]."

* group.element[28].code = #pneumothorax
* group.element[28].target[0].code = #observation-incidental-finding
* group.element[28].target[0].relationship = $cm-rel#equivalent
* group.element[28].target[0].comment = "IncidentalFindingLtLung (category=pneumothorax)."

* group.element[29].code = #pneumothorax-laterality
* group.element[29].target[0].code = #observation-incidental-finding
* group.element[29].target[0].relationship = $cm-rel#related-to
* group.element[29].target[0].comment = "IncidentalFindingLtLung.bodySite laterality."

* group.element[30].code = #consolidation
* group.element[30].target[0].code = #observation-incidental-finding
* group.element[30].target[0].relationship = $cm-rel#equivalent
* group.element[30].target[0].comment = "IncidentalFindingLtLung (category=consolidation). Interpretation uses consolidation-interpretation-lt-lung VS."

* group.element[31].code = #consolidation-inflammatory
* group.element[31].target[0].code = #observation-incidental-finding
* group.element[31].target[0].relationship = $cm-rel#related-to
* group.element[31].target[0].comment = "IncidentalFindingLtLung.component[interpretation] = inflammatory."

* group.element[32].code = #consolidation-malignant
* group.element[32].target[0].code = #observation-incidental-finding
* group.element[32].target[0].relationship = $cm-rel#related-to
* group.element[32].target[0].comment = "IncidentalFindingLtLung.component[interpretation] = malignant."

* group.element[33].code = #coronary-calcification
* group.element[33].target[0].code = #observation-incidental-finding
* group.element[33].target[0].relationship = $cm-rel#equivalent
* group.element[33].target[0].comment = "IncidentalFindingLtLung (category=coronary-calcification). Severity bound to coronary-calcification-score-lt-lung."

* group.element[34].code = #coronary-calcification-severity
* group.element[34].target[0].code = #observation-incidental-finding
* group.element[34].target[0].relationship = $cm-rel#related-to
* group.element[34].target[0].comment = "IncidentalFindingLtLung.component[severity] bound to coronary-calcification-score-lt-lung (Agatston bands)."

* group.element[35].code = #thoracic-aortic-aneurysm
* group.element[35].target[0].code = #observation-incidental-finding
* group.element[35].target[0].relationship = $cm-rel#equivalent
* group.element[35].target[0].comment = "IncidentalFindingLtLung (category=aortic-aneurysm)."

* group.element[36].code = #mediastinal-mass
* group.element[36].target[0].code = #observation-mediastinal-mass
* group.element[36].target[0].relationship = $cm-rel#equivalent
* group.element[36].target[0].comment = "MediastinalMassLtLung. StructureDefinition: https://hl7.lt/fhir/lung/StructureDefinition/mediastinal-mass-lt-lung."

* group.element[37].code = #mediastinal-mass-size
* group.element[37].target[0].code = #observation-mediastinal-mass
* group.element[37].target[0].relationship = $cm-rel#related-to
* group.element[37].target[0].comment = "MediastinalMassLtLung.component[size] (Quantity mm)."

* group.element[38].code = #lymphadenopathy
* group.element[38].target[0].code = #observation-incidental-finding
* group.element[38].target[0].relationship = $cm-rel#equivalent
* group.element[38].target[0].comment = "IncidentalFindingLtLung (category=lymphadenopathy)."

* group.element[39].code = #lymphadenopathy-location
* group.element[39].target[0].code = #observation-incidental-finding
* group.element[39].target[0].relationship = $cm-rel#related-to
* group.element[39].target[0].comment = "IncidentalFindingLtLung.bodySite from lung-lymph-node-location-lt-lung."

* group.element[40].code = #thyroid-nodules
* group.element[40].target[0].code = #observation-incidental-finding
* group.element[40].target[0].relationship = $cm-rel#equivalent
* group.element[40].target[0].comment = "IncidentalFindingLtLung (category=thyroid-nodule)."

* group.element[41].code = #liver-lesions
* group.element[41].target[0].code = #observation-incidental-finding
* group.element[41].target[0].relationship = $cm-rel#equivalent
* group.element[41].target[0].comment = "IncidentalFindingLtLung (category=liver-lesion)."

* group.element[42].code = #kidney-lesions
* group.element[42].target[0].code = #observation-kidney-lesion
* group.element[42].target[0].relationship = $cm-rel#equivalent
* group.element[42].target[0].comment = "KidneyLesionLtLung. StructureDefinition: https://hl7.lt/fhir/lung/StructureDefinition/kidney-lesion-lt-lung."

* group.element[43].code = #adrenal-lesions
* group.element[43].target[0].code = #observation-adrenal-lesion
* group.element[43].target[0].relationship = $cm-rel#equivalent
* group.element[43].target[0].comment = "AdrenalLesionLtLung. Laterality from adrenal-laterality-lt-lung VS."

* group.element[44].code = #lung-rads-category
* group.element[44].target[0].code = #observation-lung-rads
* group.element[44].target[0].relationship = $cm-rel#equivalent
* group.element[44].target[0].comment = "LungRadsAssessmentLtLung.valueCodeableConcept bound to lung-rads-category-lt-lung VS."

* group.element[45].code = #lung-rads-modifier
* group.element[45].target[0].code = #observation-lung-rads
* group.element[45].target[0].relationship = $cm-rel#related-to
* group.element[45].target[0].comment = "LungRadsAssessmentLtLung.component[modifier] bound to lung-rads-modifier-lt-lung VS."

* group.element[46].code = #recommendation
* group.element[46].target[0].code = #observation-recommendation
* group.element[46].target[0].relationship = $cm-rel#equivalent
* group.element[46].target[0].comment = "LungRecommendationObservationLtLung. Codes from lung-recommendation-lt-lung VS."
