// =============================================================================
// Questionnaire: Pre-LDCT Questionnaire (ADP Table 7.2)
// =============================================================================
// Narrative mapping (Questionnaire item -> FHIR resource / cross-IG):
//   CT study registration date -> ServiceRequest.authoredOn
//   Self-care / Bedridden      -> ObservationLt (functional status)
//   Prior chest CT             -> ObservationLt / ImagingStudy reference
//   Acute respiratory infection -> ConditionLt
//   Height                     -> BodyHeight (ig-lt-vitalsigns)
//                                 https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/StructureDefinition-body-height.html
//   Body weight                -> BodyWeight (ig-lt-vitalsigns)
//                                 https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/StructureDefinition-body-weight.html
//   Smoking status (current)   -> TobaccoUseLtLifestyle (ig-lt-lifestyle)
//                                 https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-use-lt-lifestyle.html
//   Cigarettes per day         -> TobaccoSmokingConsumptionLtLifestyle (ig-lt-lifestyle)
//                                 https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-smoking-consumption-lt-lifestyle.html
//   Pack-years                 -> TobaccoSmokingConsumptionLtLifestyle (ig-lt-lifestyle)
//   Tobacco type               -> TobaccoTypeUsedLtLifestyle (ig-lt-lifestyle)
//                                 https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-type-used-lt-lifestyle.html
//   Years smoked / quit        -> TobaccoUseDurationLtLifestyle / TobaccoSmokingStoppedLtLifestyle
//                                 https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/
//   ICD diagnoses              -> ConditionLt
// =============================================================================

Instance: questionnaire-pre-ldct-lt-lung
InstanceOf: Questionnaire
Usage: #definition
Title: "Questionnaire: Pre-LDCT Questionnaire (LT Lung)"
Description: "Structured data-capture form for the pre-examination questionnaire before LDCT screening, based on ADP Table 7.2. Captures functional status, prior examinations, anthropometrics, smoking history, and current diagnoses."
* name = "PreLdctQuestionnaireLtLung"
* status = #active
* url = "https://hl7.lt/fhir/lung/Questionnaire/questionnaire-pre-ldct-lt-lung"

// ---------------------------------------------------------------------------
// Group 1 – Registration
// ---------------------------------------------------------------------------
* item[0].linkId = "grp-registration"
* item[0].text = "Registration"
* item[0].type = #group

* item[0].item[0].linkId = "registration-date"
* item[0].item[0].text = "CT study registration date"
* item[0].item[0].type = #dateTime

// ---------------------------------------------------------------------------
// Group 2 – Functional status
// ---------------------------------------------------------------------------
* item[1].linkId = "grp-functional-status"
* item[1].text = "Functional status"
* item[1].type = #group

* item[1].item[0].linkId = "self-care"
* item[1].item[0].text = "Do you serve yourself?"
* item[1].item[0].type = #coding
* item[1].item[0].required = true
* item[1].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[1].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[1].item[1].linkId = "bedridden"
* item[1].item[1].text = "Bedridden/chairbound"
* item[1].item[1].type = #coding
* item[1].item[1].required = true
* item[1].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[1].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// ---------------------------------------------------------------------------
// Group 3 – Prior examinations
// ---------------------------------------------------------------------------
* item[2].linkId = "grp-prior-exams"
* item[2].text = "Prior examinations"
* item[2].type = #group

* item[2].item[0].linkId = "prior-chest-ct"
* item[2].item[0].text = "Previous chest (lung) CT in the last 3 years"
* item[2].item[0].type = #coding
* item[2].item[0].required = true
* item[2].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[1].linkId = "prior-chest-ct-date"
* item[2].item[1].text = "Date of previous chest CT examination (if known)"
* item[2].item[1].type = #date
* item[2].item[1].required = false
* item[2].item[1].repeats = true
* item[2].item[1].enableWhen[0].question = "prior-chest-ct"
* item[2].item[1].enableWhen[0].operator = #=
* item[2].item[1].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes

* item[2].item[2].linkId = "recent-respiratory-infection"
* item[2].item[2].text = "Acute respiratory infection within 3 months prior to the invitation"
* item[2].item[2].type = #coding
* item[2].item[2].required = true
* item[2].item[2].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[2].item[2].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// ---------------------------------------------------------------------------
// Group 4 – Anthropometrics
// ---------------------------------------------------------------------------
* item[3].linkId = "grp-anthropometrics"
* item[3].text = "Anthropometrics"
* item[3].type = #group

* item[3].item[0].linkId = "height"
* item[3].item[0].text = "Height (cm)"
* item[3].item[0].type = #quantity
* item[3].item[0].required = true

* item[3].item[1].linkId = "weight"
* item[3].item[1].text = "Body mass weight (kg)"
* item[3].item[1].type = #quantity
* item[3].item[1].required = true

// ---------------------------------------------------------------------------
// Group 5 – Current smoking
// ---------------------------------------------------------------------------
* item[4].linkId = "grp-current-smoking"
* item[4].text = "Current smoking status"
* item[4].type = #group

* item[4].item[0].linkId = "smokes"
* item[4].item[0].text = "Currently smokes"
* item[4].item[0].type = #coding
* item[4].item[0].required = true
* item[4].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[4].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[4].item[1].linkId = "cigarettes"
* item[4].item[1].text = "Cigarettes"
* item[4].item[1].type = #coding
* item[4].item[1].enableWhen[0].question = "smokes"
* item[4].item[1].enableWhen[0].operator = #=
* item[4].item[1].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[4].item[1].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[4].item[1].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[4].item[1].item[0].linkId = "cigarettes-per-day"
* item[4].item[1].item[0].text = "Number of cigarettes per day"
* item[4].item[1].item[0].type = #integer
* item[4].item[1].item[0].enableWhen[0].question = "cigarettes"
* item[4].item[1].item[0].enableWhen[0].operator = #=
* item[4].item[1].item[0].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes

* item[4].item[1].item[1].linkId = "pack-years"
* item[4].item[1].item[1].text = "Number of pack-years"
* item[4].item[1].item[1].type = #decimal
* item[4].item[1].item[1].enableWhen[0].question = "cigarettes"
* item[4].item[1].item[1].enableWhen[0].operator = #=
* item[4].item[1].item[1].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes

* item[4].item[2].linkId = "e-cigarettes"
* item[4].item[2].text = "Electronic cigarettes"
* item[4].item[2].type = #coding
* item[4].item[2].enableWhen[0].question = "smokes"
* item[4].item[2].enableWhen[0].operator = #=
* item[4].item[2].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[4].item[2].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[4].item[2].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[4].item[3].linkId = "heated-tobacco"
* item[4].item[3].text = "Heated tobacco"
* item[4].item[3].type = #coding
* item[4].item[3].enableWhen[0].question = "smokes"
* item[4].item[3].enableWhen[0].operator = #=
* item[4].item[3].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[4].item[3].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[4].item[3].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[4].item[4].linkId = "tobacco"
* item[4].item[4].text = "Tobacco (smokeless)"
* item[4].item[4].type = #coding
* item[4].item[4].enableWhen[0].question = "smokes"
* item[4].item[4].enableWhen[0].operator = #=
* item[4].item[4].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[4].item[4].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[4].item[4].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[4].item[5].linkId = "pipe"
* item[4].item[5].text = "Pipe"
* item[4].item[5].type = #coding
* item[4].item[5].enableWhen[0].question = "smokes"
* item[4].item[5].enableWhen[0].operator = #=
* item[4].item[5].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes
* item[4].item[5].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[4].item[5].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// ---------------------------------------------------------------------------
// Group 6 – Smoking history
// ---------------------------------------------------------------------------
* item[5].linkId = "grp-smoking-history"
* item[5].text = "Smoking history"
* item[5].type = #group

* item[5].item[0].linkId = "smoked-before"
* item[5].item[0].text = "Smoked before"
* item[5].item[0].type = #coding
* item[5].item[0].required = true
* item[5].item[0].answerOption[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"
* item[5].item[0].answerOption[1].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[5].item[1].linkId = "years-smoked"
* item[5].item[1].text = "How many years did he/she smoke?"
* item[5].item[1].type = #integer
* item[5].item[1].enableWhen[0].question = "smoked-before"
* item[5].item[1].enableWhen[0].operator = #=
* item[5].item[1].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes

* item[5].item[2].linkId = "years-quit"
* item[5].item[2].text = "How many years have not smoked"
* item[5].item[2].type = #integer
* item[5].item[2].enableWhen[0].question = "smoked-before"
* item[5].item[2].enableWhen[0].operator = #=
* item[5].item[2].enableWhen[0].answerCoding = $lung-questionnaire-options-cs-url#yes

// ---------------------------------------------------------------------------
// Group 7 – Current diagnoses
// ---------------------------------------------------------------------------
* item[6].linkId = "grp-diagnoses"
* item[6].text = "Diagnoses before examination"
* item[6].type = #group

* item[6].item[0].linkId = "diagnoses"
* item[6].item[0].text = "Diagnoses before examination (ICD codes)"
* item[6].item[0].type = #coding
* item[6].item[0].answerConstraint = #optionsOrString
* item[6].item[0].repeats = true
* item[6].item[0].required = false
* item[6].item[0].answerValueSet = "http://hl7.org/fhir/sid/icd-10"

// =============================================================================
// QuestionnaireResponse: Pre-LDCT example
// =============================================================================

Instance: questionnaireresponse-pre-ldct-example
InstanceOf: QuestionnaireResponse
Usage: #example
Title: "QuestionnaireResponse: Pre-LDCT Questionnaire (example)"
Description: "Pre-LDCT screening questionnaire example – active smoker, 30 pack-years, height 178cm, weight 82kg."
* questionnaire = "https://hl7.lt/fhir/lung/Questionnaire/questionnaire-pre-ldct-lt-lung"
* status = #completed
* authored = "2025-11-20T13:00:00Z"
* subject = Reference(patient-male-example)

// Group 1 – Registration
* item[0].linkId = "grp-registration"
* item[0].text = "Registration"

* item[0].item[0].linkId = "registration-date"
* item[0].item[0].text = "CT study registration date"
* item[0].item[0].answer[0].valueDateTime = "2025-11-20"

// Group 2 – Functional status
* item[1].linkId = "grp-functional-status"
* item[1].text = "Functional status"

* item[1].item[0].linkId = "self-care"
* item[1].item[0].text = "Do you serve yourself?"
* item[1].item[0].answer[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"

* item[1].item[1].linkId = "bedridden"
* item[1].item[1].text = "Bedridden/chairbound"
* item[1].item[1].answer[0].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// Group 3 – Prior examinations
* item[2].linkId = "grp-prior-exams"
* item[2].text = "Prior examinations"

* item[2].item[0].linkId = "prior-chest-ct"
* item[2].item[0].text = "Previous chest (lung) CT in the last 3 years"
* item[2].item[0].answer[0].valueCoding = $lung-questionnaire-options-cs-url#no "No"

* item[2].item[1].linkId = "recent-respiratory-infection"
* item[2].item[1].text = "Acute respiratory infection within 3 months prior to the invitation"
* item[2].item[1].answer[0].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// Note: prior-chest-ct-date not included because prior-chest-ct = No

// Group 4 – Anthropometrics
* item[3].linkId = "grp-anthropometrics"
* item[3].text = "Anthropometrics"

* item[3].item[0].linkId = "height"
* item[3].item[0].text = "Height (cm)"
* item[3].item[0].answer[0].valueQuantity = 178 'cm' "cm"

* item[3].item[1].linkId = "weight"
* item[3].item[1].text = "Body mass weight (kg)"
* item[3].item[1].answer[0].valueQuantity = 82 'kg' "kg"

// Group 5 – Current smoking
* item[4].linkId = "grp-current-smoking"
* item[4].text = "Current smoking status"

* item[4].item[0].linkId = "smokes"
* item[4].item[0].text = "Currently smokes"
* item[4].item[0].answer[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"

* item[4].item[1].linkId = "cigarettes"
* item[4].item[1].text = "Cigarettes"
* item[4].item[1].answer[0].valueCoding = $lung-questionnaire-options-cs-url#yes "Yes"

* item[4].item[1].item[0].linkId = "cigarettes-per-day"
* item[4].item[1].item[0].text = "Number of cigarettes per day"
* item[4].item[1].item[0].answer[0].valueInteger = 20

* item[4].item[1].item[1].linkId = "pack-years"
* item[4].item[1].item[1].text = "Number of pack-years"
* item[4].item[1].item[1].answer[0].valueInteger = 30

* item[4].item[2].linkId = "e-cigarettes"
* item[4].item[2].text = "Electronic cigarettes"
* item[4].item[2].answer[0].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// Group 6 – Smoking history
* item[5].linkId = "grp-smoking-history"
* item[5].text = "Smoking history"

* item[5].item[0].linkId = "smoked-before"
* item[5].item[0].text = "Smoked before"
* item[5].item[0].answer[0].valueCoding = $lung-questionnaire-options-cs-url#no "No"

// Group 7 – Diagnoses
* item[6].linkId = "grp-diagnoses"
* item[6].text = "Diagnoses before examination"

* item[6].item[0].linkId = "diagnoses"
* item[6].item[0].text = "Diagnoses before examination (ICD codes)"
* item[6].item[0].answer[0].valueString = "J44.1 Chronic obstructive pulmonary disease with acute exacerbation, unspecified"
