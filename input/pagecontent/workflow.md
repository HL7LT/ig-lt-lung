# Lung cancer screening and early diagnostic workflow

The lung cancer screening and early diagnostic workflow is a structured, longitudinal clinical process designed to support the **early detection of lung cancer in individuals at increased risk**.

The workflow is centred on **low-dose computed tomography (LDCT)** imaging and combines several stages, including eligibility assessment, structured clinical context collection, imaging acquisition, radiological interpretation, and follow-up planning.

Unlike diagnostic pathways that start from symptoms, the lung cancer screening programme is **preventive and cyclical**, meaning that participants may undergo repeated screening examinations over time depending on the interpretation of imaging findings.

The workflow integrates multiple healthcare actors, including **primary care, radiology services, screening programme coordinators, and specialist services**, while ensuring consistent structured data exchange using the **HL7 FHIR standard**.

## Invitation and eligibility assessment

The screening process begins with identification of individuals who may be eligible for participation in the lung cancer early diagnosis programme.

Eligibility is determined based on programme criteria such as:

- age range,
- smoking history and tobacco exposure,
- overall clinical risk profile.

If eligibility criteria are met, the participant is invited to the screening programme and an imaging examination is scheduled.

From a FHIR perspective, this step may involve the creation of a screening request represented as a **ServiceRequest** resource, together with basic participant context information.

## Pre-examination clinical context and risk information

Before imaging is performed, a **structured clinical questionnaire** is completed to collect information relevant for screening interpretation and follow-up.

This questionnaire captures information such as:

- functional status and general health indicators,
- smoking and nicotine exposure history,
- anthropometric measurements,
- history of previous chest CT examinations,
- recent respiratory infections,
- other clinically relevant background information.

These data provide contextual information for radiological interpretation but **do not represent diagnostic conclusions**.

In the FHIR model, these elements are typically represented as structured **Observation** resources linked to the screening encounter. The pre-examination data is captured using the [Pre-LDCT Questionnaire](Questionnaire-questionnaire-pre-ldct-lt-lung.html), which maps to profiles from the [Vital Signs IG](https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/) (height, weight) and [Lifestyle IG](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/) (smoking status, tobacco consumption, pack-years).

## LDCT imaging acquisition

Eligible participants undergo a **low-dose computed tomography (LDCT) examination of the chest**.

The imaging procedure is performed by a radiology technologist while the patient is physically present during the encounter.

During this step:

- the LDCT scan is acquired,
- imaging data are generated,
- relevant procedural context is recorded.

The imaging dataset is represented using the **ImagingStudy** resource, while the performed imaging procedure itself may be represented using a **Procedure** resource.

At this stage, the imaging data are **purely technical acquisition outputs** and do not yet include diagnostic interpretation.

## Technical parameters and radiation dose documentation

In addition to the imaging data itself, technical metadata related to the examination are recorded.

These include:

- imaging device information,
- examination date and location,
- radiation dose parameters such as **CTDIvol** and **Dose Length Product (DLP)**.

Capturing this information supports:

- radiation safety monitoring,
- quality assurance of screening procedures,
- longitudinal comparison of repeated examinations.

Radiation dose observations are referenced from the [LungCompositionLtLung](StructureDefinition-lung-composition-lt-lung.html) findings section and are based on the EU Imaging radiation dose observation profile.

## Radiological interpretation and reporting

After image acquisition, the LDCT studies are interpreted by a radiologist.

The radiologist evaluates the images and documents findings in a structured form. These findings may include:

- pulmonary nodules,
- suspicious focal lung lesions,
- emphysema or other pulmonary abnormalities,
- clinically significant incidental findings in other thoracic or upper abdominal structures.

Individual findings are represented as structured **Observation** resources describing lesion characteristics such as:

- anatomical location,
- morphology,
- size or volume,
- evolution compared to previous examinations.

The interpretation results are compiled into a structured **diagnostic imaging report**, represented as a [LungReportLtLung](StructureDefinition-lung-report-lt-lung.html) (DiagnosticReport) resource that wraps a [LungCompositionLtLung](StructureDefinition-lung-composition-lt-lung.html) (Composition) and aggregates all structured findings. Individual nodule findings are captured using the [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) profile, while significant incidental findings are documented using the [IncidentalFindingLtLung](StructureDefinition-incidental-finding-lt-lung.html) profile. The LDCT report data is captured in the [LDCT Questionnaire](Questionnaire-questionnaire-ldct-lt-lung.html).

## Risk stratification and LUNG-RADS assessment

A central step in the workflow is the classification of imaging findings according to the **LUNG-RADS assessment system**.

LUNG-RADS categories provide a standardised interpretation of screening findings and determine the recommended next step in the clinical pathway.

Typical outcomes include:

- **Category 1–2** → negative or benign findings, routine annual screening,
- **Category 3** → probably benign findings, short-interval follow-up imaging,
- **Category 4** → suspicious findings requiring additional diagnostic evaluation or referral.

In the FHIR model, the LUNG-RADS category is represented as a [LungRadsAssessmentLtLung](StructureDefinition-lung-rads-assessment-lt-lung.html) Observation, while the resulting recommendation is expressed as a [LungRecommendationObservationLtLung](StructureDefinition-lung-recommendation-observation-lt-lung.html) Observation linked to the assessment.

## Follow-up and continuity of care

Based on the radiological assessment and recommendations, appropriate follow-up actions are initiated.

These may include:

- scheduling a repeat LDCT examination at a defined interval,
- referral to pulmonology, oncology, or thoracic surgery,
- additional diagnostic imaging,
- evaluation of clinically significant incidental findings.

The lung cancer screening programme is inherently **longitudinal**, meaning that individuals may participate in multiple screening cycles over time.

The data model therefore supports:

- comparison with previous imaging studies,
- tracking of lesion evolution,
- structured follow-up planning.

## Key modelling principles of the workflow

The lung cancer screening model follows several core modelling principles:

- **Separation of data acquisition and interpretation**  
  Imaging acquisition, radiological findings, and diagnostic conclusions are represented as distinct information layers.

- **Explicit representation of focal findings**  
  Lung nodules and other suspicious lesions are captured as structured observations that can be compared across examinations.

- **Separation of findings and decision logic**  
  Observations describe what is present in the images, while follow-up recommendations represent workflow decisions derived from those observations.

- **Support for longitudinal screening cycles**  
  The model enables repeated screening examinations and comparison of findings over time.

This workflow representation reflects real clinical practice while supporting **standardised data exchange, programme monitoring, and longitudinal patient follow-up** within the national lung cancer early diagnosis programme.