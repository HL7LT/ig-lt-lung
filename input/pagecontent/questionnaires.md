### Questionnaires

This page describes the two ESPBI (Electronic Health Services and Cooperation Infrastructure) questionnaire forms used in the Lithuanian lung cancer prevention programme. Each questionnaire captures a structured dataset defined in the ADP (Early Diagnostics and Preventive Programmes) research specification.

These Questionnaire resources are independent of the FHIR profile-based data model. They represent the ESPBI form structure as-is, while the narrative mapping tables below show how each questionnaire item maps to the corresponding FHIR profile and element.

#### Overview

| Questionnaire | ESPBI Form | Clinical Stage |
|---|---|---|
| [LDCT Report](Questionnaire-questionnaire-ldct-lt-lung.html) | ADP Table 7.1 (MDKT) | LDCT imaging acquisition and radiological evaluation |
| [Pre-LDCT Questionnaire](Questionnaire-questionnaire-pre-ldct-lt-lung.html) | ADP Table 7.2 | Pre-examination clinical assessment and risk factors |

---

#### LDCT Report Questionnaire

The LDCT report form captures the complete low-dose chest computed tomography screening workflow: examination context (date, radiation dose, technologist, facility), pulmonary nodule findings (type, location, morphology, size/volume), significant incidental findings in and outside the lungs, LUNG-RADS category assessment, and follow-up recommendations.

**Example response:** [questionnaireresponse-ldct-example](QuestionnaireResponse-questionnaireresponse-ldct-example.html)

**Narrative mapping to FHIR profiles:**

| Questionnaire Item | FHIR Profile | Element |
|---|---|---|
| LDCT examination date | [LungReportLtLung](StructureDefinition-lung-report-lt-lung.html) | effectiveDateTime |
| Radiation dose (CTDIvol) | ObservationLt | valueQuantity (mGy) |
| Radiation dose (DLP) | ObservationLt | valueQuantity (mGy.cm) |
| Technologist | PractitionerLt | name, qualification |
| Facility | OrganizationLt | name, identifier |
| Nodule type | [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) | valueCodeableConcept |
| Nodule lung lobe | [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) | bodySite |
| Nodule CT slice | [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) | component[ctSliceNumber] |
| Nodule morphology (spicules, contours, pleura) | [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) | component[spiculation/irregularMargins/pleuralAssociation] |
| Nodule size (average, long axis, short axis) | [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) | component[meanDiameter/longAxis/shortAxis] |
| Nodule volume | [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) | component[volume] |
| Solid part measurements | [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) | component[solidPart*] |
| Incidental findings (lung) | [IncidentalFindingLtLung](StructureDefinition-incidental-finding-lt-lung.html) | valueCodeableConcept |
| Incidental findings (extra-pulmonary) | [IncidentalFindingLtLung](StructureDefinition-incidental-finding-lt-lung.html) | valueCodeableConcept |
| LUNG-RADS category | [LungRadsAssessmentLtLung](StructureDefinition-lung-rads-assessment-lt-lung.html) | valueCodeableConcept |
| Recommendations | [LungRecommendationObservationLtLung](StructureDefinition-lung-recommendation-observation-lt-lung.html) | valueCodeableConcept |
| Reporting specialist | PractitionerLt | name, qualification |
| Institution | OrganizationLt | name, identifier |

---

#### Pre-LDCT Questionnaire

The pre-LDCT form captures data required for the initial assessment of the patient before LDCT screening. It includes functional status (self-care ability), prior chest CT examinations, recent respiratory infections, anthropometric measurements, detailed smoking history (current and past), and active diagnoses. This data feeds into the lung cancer risk assessment and eligibility determination.

**Example response:** [questionnaireresponse-pre-ldct-example](QuestionnaireResponse-questionnaireresponse-pre-ldct-example.html)

**Narrative mapping to FHIR profiles:**

| Questionnaire Item | FHIR Profile (cross-IG) | Element |
|---|---|---|
| CT study registration date | ServiceRequestLt | authoredOn |
| Self-care | ObservationLt | valueCodeableConcept |
| Bedridden/chairbound | ObservationLt | valueCodeableConcept |
| Prior chest CT in last 3 years | ObservationLt / ImagingStudy | reference |
| Acute respiratory infection | ConditionLt | code |
| Height | [BodyHeight](https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/StructureDefinition-body-height.html) (ig-lt-vitalsigns) | valueQuantity (cm) |
| Body weight | [BodyWeight](https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/StructureDefinition-body-weight.html) (ig-lt-vitalsigns) | valueQuantity (kg) |
| Currently smokes | [TobaccoUseLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-use-lt-lifestyle.html) (ig-lt-lifestyle) | valueCodeableConcept |
| Cigarettes per day | [TobaccoSmokingConsumptionLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-smoking-consumption-lt-lifestyle.html) (ig-lt-lifestyle) | valueQuantity |
| Pack-years | [TobaccoSmokingConsumptionLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-smoking-consumption-lt-lifestyle.html) (ig-lt-lifestyle) | component (pack-years) |
| Tobacco type (e-cigarettes, heated, pipe) | [TobaccoTypeUsedLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-type-used-lt-lifestyle.html) (ig-lt-lifestyle) | valueCodeableConcept |
| Years smoked | [TobaccoUseDurationLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-use-duration-lt-lifestyle.html) (ig-lt-lifestyle) | valueQuantity (years) |
| Years since quit | [TobaccoSmokingStoppedLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-smoking-stopped-lt-lifestyle.html) (ig-lt-lifestyle) | valueQuantity (years) |
| ICD diagnoses | ConditionLt | code (ICD-10) |

#### Cross-IG References

The questionnaire mapping connects to resources defined in several Lithuanian FHIR IGs:

- **[Lung IG](index.html)** — LDCT report, LUNG-RADS assessment, nodule observations, incidental findings, recommendations
- **[Vital Signs IG](https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/)** — anthropometric measurements (height, weight) collected during pre-examination
- **[Lifestyle IG](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/)** — smoking status, consumption, tobacco type, duration, and cessation data
- **[Base IG](https://build.fhir.org/ig/HL7LT/ig-lt-base/)** — foundation resources (PatientLt, PractitionerLt, OrganizationLt, ServiceRequestLt, ConditionLt)
