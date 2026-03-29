# Lithuanian Lung Cancer Early Diagnosis Implementation Guide

## Introduction and Purpose

This Implementation Guide specifies how to consistently represent and exchange structured clinical data related to the **Lithuanian Lung Cancer Early Diagnosis Programme** using the **HL7® FHIR® standard**.

The guide supports the national programme for **early detection of malignant bronchial and lung tumours**, with a primary focus on **low-dose chest computed tomography (LDCT)** and the structured capture of clinically relevant findings, recommendations, and pre-examination risk information.

Its purpose is to enable:

* consistent and high-quality data capture across healthcare providers,
* semantic interoperability between **screening, radiology, referral, and follow-up systems**,
* structured reporting for **programme coordination, quality assurance, monitoring, and secondary use**,
* and reliable longitudinal follow-up of participants across repeated screening and surveillance cycles.

The guide is developed as part of the national **ADP project** to support coordinated, data-driven management of preventive and early diagnostic programmes in Lithuania.

## Scope

This guide focuses specifically on the **lung cancer early diagnosis workflow**, centred on **low-dose chest computed tomography (LDCT)** and the structured collection of data required before, during, and after the imaging examination.

It covers the following clinical domains:

* **Pre-examination questionnaire data**, including functional status, smoking history, anthropometric data, recent respiratory infection history, and prior chest CT history,
* **LDCT imaging acquisition metadata**, including radiation dose information and examination context,
* **Structured recording of pulmonary nodules and other suspicious focal findings**,
* **Classification of findings and programme recommendations**,
* **Structured capture of significant incidental findings** in the chest and upper abdominal region,
* and **support for repeated imaging and surveillance over time**.

The guide models lung cancer early diagnosis as an **imaging-driven, risk-informed, longitudinal workflow**, where the main diagnostic decision point is the interpretation of LDCT findings and the corresponding recommendation for repeat screening, short-term surveillance, or specialist referral.

## Key Modelling Principles

The modelling approach is based on the following core principles:

1. **Separation of questionnaire data, imaging acquisition, and radiological interpretation**  
   Pre-examination risk and eligibility information, technical imaging details, and radiological conclusions are represented as distinct but linked parts of the workflow.

2. **Explicit representation of focal lung findings**  
   Pulmonary nodules and other suspicious lesions are modelled in a structured way, including type, location, morphology, size, and volume, so that they can be compared across repeated examinations.

3. **Support for clinically significant incidental findings**  
   The guide does not focus only on suspected lung malignancy. It also supports structured capture of important incidental findings in the lungs, mediastinum, cardiovascular structures, breasts, liver, kidneys, bones, adrenal glands, and other visible anatomical regions when these findings require further action.

4. **Separation of findings from recommendation logic**  
   Observations describe what is present in the images, while the conclusion and recommendation represent the next clinical step within the programme, such as routine recall, earlier surveillance imaging, or referral for specialist consultation.

5. **Longitudinal comparability**  
   The data model supports repeated LDCT examinations over time, including comparison with previous studies and tracking of lesion evolution, which is essential in early lung cancer detection programmes.

6. **Terminology-based interoperability**  
   The guide is designed to use internationally recognised terminologies and classifiers, especially **SNOMED CT**, and where relevant also **LOINC, ICD-10-AM, and national classifiers**, to ensure semantic consistency across systems.

## Content of the Guide

This guide provides:

* **FHIR profiles and extensions** for the lung cancer early diagnosis workflow,
* structured representation of the **pre-LDCT questionnaire**,
* structured modelling of **LDCT examination metadata and findings**,
* support for **lung finding categories and recommendation pathways**,
* terminology bindings using **SNOMED CT** and other relevant code systems,
* structured **example instances** illustrating realistic programme scenarios,
* mappings from the national clinical dataset to interoperable FHIR artefacts,
* and identification of gaps and future development needs.

At the current stage, the guide focuses on the **core data structures for LDCT-based early diagnosis**, especially the questionnaire and radiology reporting dataset. Further refinement, terminology expansion, workflow alignment, and clinical validation will be performed in subsequent iterations.

## Why Use This Guide?

By adopting this guide, implementers and healthcare institutions can:

1. **Interoperability:** Ensure consistent and comparable lung cancer early diagnosis data across systems and providers.
2. **Data Quality:** Improve the consistency, completeness, and reusability of questionnaire, imaging, and radiological data.
3. **Clinical Utility:** Support structured reporting, surveillance planning, referral decisions, and quality assurance.
4. **Programme Monitoring:** Enable population-level analysis of participation, findings, recommendations, and diagnostic pathways.
5. **Longitudinal Care:** Support follow-up across repeated LDCT examinations and subsequent clinical action.

Navigate the sections below to access the profiles, terminology bindings, and detailed examples needed to implement the standard.

### Contributors

| Name                                             | Role                          | Organization                                    |
| ------------------------------------------------ | ----------------------------- | ----------------------------------------------- |
| [Kati Laidus](https://www.linkedin.com/in/kati-laidus/) | Primary Author | [HELEX Solutions](https://helex.solutions) |
| [Igor Bossenko](https://about.askigor.eu) | Primary Author | [HELEX Solutions](https://helex.solutions) |
| Martynas Bieliauskas | Co-Author | [LMB](https://lmb.lt) |
