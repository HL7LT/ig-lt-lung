### Profiles

This page describes the FHIR profiles defined in the Lithuanian Lung Cancer Implementation Guide. The profiles model the LDCT (low-dose chest computed tomography) screening pathway — from the imaging report container through individual findings to the LUNG-RADS assessment and follow-up recommendations.

#### Report and Composition Profiles

| Profile | Description |
|---|---|
| [LungReportLtLung](StructureDefinition-lung-report-lt-lung.html) | Overall LDCT diagnostic report wrapping the lung composition and aggregating all structured results. Based on ImagingReportLt from the base IG. |
| [LungCompositionLtLung](StructureDefinition-lung-composition-lt-lung.html) | Lung-specific imaging composition with sections for findings (nodules, incidental findings), impression (LUNG-RADS), and recommendations. Based on ImagingCompositionLt. |

#### Assessment and Finding Profiles

| Profile | Description |
|---|---|
| [LungRadsAssessmentLtLung](StructureDefinition-lung-rads-assessment-lt-lung.html) | LUNG-RADS category assessment (0, 1, 2, 3, 4A, 4B, 4X) with optional S modifier for significant incidental findings. |
| [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) | Individual pulmonary nodule observation with type (solid, part-solid, ground-glass, calcified, cavitary), lung lobe location, morphology (spiculation, irregular margins, pleural association), and size/volume measurements. |
| [IncidentalFindingLtLung](StructureDefinition-incidental-finding-lt-lung.html) | Significant incidental finding detected during LDCT — covers pulmonary findings (emphysema, bronchiectasis, pleural changes) and extra-pulmonary findings (coronary calcification, aortic aneurysm, mediastinal mass, etc.). |
| [LungRecommendationObservationLtLung](StructureDefinition-lung-recommendation-observation-lt-lung.html) | Follow-up recommendation based on the LUNG-RADS category (repeat screening, follow-up interval, specialist consultation). |

#### Cross-IG Dependencies

The lung cancer screening pathway relies on resources from other Lithuanian FHIR IGs:

- **[Vital Signs IG](https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/)** — anthropometric measurements (height, weight, BMI) collected in the pre-examination questionnaire
- **[Lifestyle IG](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/)** — smoking status, tobacco consumption, pack-years, tobacco type, and smoking cessation data critical for lung cancer risk assessment
- **[Base IG](https://build.fhir.org/ig/HL7LT/ig-lt-base/)** — foundation profiles (PatientLt, PractitionerLt, ObservationLt, DiagnosticReportLt, ImagingReportLt, ImagingCompositionLt, ServiceRequestLt, EncounterLt)
