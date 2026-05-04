### Anketos

Šiame puslapyje aprašomos dvi ESPBI (Elektroninių sveikatos paslaugų ir bendradarbiavimo infrastruktūros) anketų formos, naudojamos Lietuvos plaučių vėžio prevencijos programoje. Kiekviena anketa fiksuoja struktūrizuotą duomenų rinkinį, apibrėžtą ADP (Ankstyvo diagnozavimo ir prevencinių programų) tyrimų specifikacijoje.

Šie Questionnaire ištekliai yra nepriklausomi nuo FHIR profiliais paremto duomenų modelio. Jie atspindi ESPBI formos struktūrą tokią, kokia yra, o žemiau esančios sąsajų lentelės parodo, kaip kiekvienas anketos punktas susiejamas su atitinkamu FHIR profiliu ir elementu.

#### Apžvalga

| Anketa | ESPBI forma | Klinikinis etapas |
|---|---|---|
| [LDCT ataskaita](Questionnaire-questionnaire-ldct-lt-lung.html) | ADP 7.1 lentelė (MDKT) | LDCT vaizdinimo atlikimas ir radiologinis vertinimas |
| [Prieš LDCT pildoma anketa](Questionnaire-questionnaire-pre-ldct-lt-lung.html) | ADP 7.2 lentelė | Prieš tyrimą atliekamas klinikinis vertinimas ir rizikos veiksniai |

---

#### LDCT ataskaitos anketa

LDCT ataskaitos forma fiksuoja visą mažos dozės krūtinės kompiuterinės tomografijos atrankos darbo eigą: tyrimo kontekstą (data, spinduliuotės dozė, technologas, įstaiga), plaučių mazgelių radinius (tipas, vieta, morfologija, dydis / tūris), reikšmingus atsitiktinius radinius plaučiuose ir už jų ribų, LUNG-RADS kategorijos vertinimą bei tolesnės priežiūros rekomendacijas.

**Atsakymo pavyzdys:** [questionnaireresponse-ldct-example](QuestionnaireResponse-questionnaireresponse-ldct-example.html)

**Sąsajų lentelė su FHIR profiliais:**

| Anketos punktas | FHIR profilis | Elementas |
|---|---|---|
| LDCT tyrimo data | [LungReportLtLung](StructureDefinition-lung-report-lt-lung.html) | effectiveDateTime |
| Spinduliuotės dozė (CTDIvol) | ObservationLt | valueQuantity (mGy) |
| Spinduliuotės dozė (DLP) | ObservationLt | valueQuantity (mGy.cm) |
| Technologas | PractitionerLt | name, qualification |
| Įstaiga | OrganizationLt | name, identifier |
| Mazgelio tipas | [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) | valueCodeableConcept |
| Mazgelio plaučių skiltis | [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) | bodySite |
| Mazgelio KT pjūvis | [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) | component[ctSliceNumber] |
| Mazgelio morfologija (spikulės, kontūrai, pleura) | [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) | component[spiculation/irregularMargins/pleuralAssociation] |
| Mazgelio dydis (vidutinis, ilgoji ašis, trumpoji ašis) | [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) | component[meanDiameter/longAxis/shortAxis] |
| Mazgelio tūris | [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) | component[volume] |
| Kietosios dalies matavimai | [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) | component[solidPart*] |
| Atsitiktiniai radiniai (plaučių) | [IncidentalFindingLtLung](StructureDefinition-incidental-finding-lt-lung.html) | valueCodeableConcept |
| Atsitiktiniai radiniai (už plaučių ribų) | [IncidentalFindingLtLung](StructureDefinition-incidental-finding-lt-lung.html) | valueCodeableConcept |
| LUNG-RADS kategorija | [LungRadsAssessmentLtLung](StructureDefinition-lung-rads-assessment-lt-lung.html) | valueCodeableConcept |
| Rekomendacijos | [LungRecommendationObservationLtLung](StructureDefinition-lung-recommendation-observation-lt-lung.html) | valueCodeableConcept |
| Ataskaitą rengiantis specialistas | PractitionerLt | name, qualification |
| Įstaiga | OrganizationLt | name, identifier |

---

#### Prieš LDCT pildoma anketa

Prieš LDCT pildoma forma fiksuoja duomenis, reikalingus pirminiam paciento vertinimui prieš LDCT atrankos tyrimą. Ji apima funkcinę būklę (savitarnos gebėjimus), ankstesnius krūtinės KT tyrimus, neseniai persirgtas kvėpavimo takų infekcijas, antropometrinius matavimus, išsamią rūkymo istoriją (esamą ir ankstesnę) ir aktyvias diagnozes. Šie duomenys naudojami plaučių vėžio rizikos vertinimui ir tinkamumo nustatymui.

**Atsakymo pavyzdys:** [questionnaireresponse-pre-ldct-example](QuestionnaireResponse-questionnaireresponse-pre-ldct-example.html)

**Sąsajų lentelė su FHIR profiliais:**

| Anketos punktas | FHIR profilis (tarp diegimo vadovų) | Elementas |
|---|---|---|
| KT tyrimo registracijos data | ServiceRequestLt | authoredOn |
| Savitarna | ObservationLt | valueCodeableConcept |
| Lovos / kėdės režimas | ObservationLt | valueCodeableConcept |
| Ankstesnis krūtinės KT per 3 metus | ObservationLt / ImagingStudy | reference |
| Ūmi kvėpavimo takų infekcija | ConditionLt | code |
| Ūgis | [BodyHeight](https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/StructureDefinition-body-height.html) (ig-lt-vitalsigns) | valueQuantity (cm) |
| Kūno svoris | [BodyWeight](https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/StructureDefinition-body-weight.html) (ig-lt-vitalsigns) | valueQuantity (kg) |
| Šiuo metu rūko | [TobaccoUseLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-use-lt-lifestyle.html) (ig-lt-lifestyle) | valueCodeableConcept |
| Cigarečių per dieną | [TobaccoSmokingConsumptionLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-smoking-consumption-lt-lifestyle.html) (ig-lt-lifestyle) | valueQuantity |
| Pakelio metai | [TobaccoSmokingConsumptionLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-smoking-consumption-lt-lifestyle.html) (ig-lt-lifestyle) | component (pack-years) |
| Tabako tipas (el. cigaretės, kaitinamas, pypkė) | [TobaccoTypeUsedLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-type-used-lt-lifestyle.html) (ig-lt-lifestyle) | valueCodeableConcept |
| Rūkymo metai | [TobaccoUseDurationLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-use-duration-lt-lifestyle.html) (ig-lt-lifestyle) | valueQuantity (metai) |
| Metai nuo metimo | [TobaccoSmokingStoppedLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-smoking-stopped-lt-lifestyle.html) (ig-lt-lifestyle) | valueQuantity (metai) |
| TLK diagnozės | ConditionLt | code (TLK-10) |

#### Tarp diegimo vadovų esančios nuorodos

Anketos sąsajos jungia kelių Lietuvos FHIR diegimo vadovų išteklius:

- **[Plaučių diegimo vadovas](index.html)** — LDCT ataskaita, LUNG-RADS vertinimas, mazgelių stebėjimai, atsitiktiniai radiniai, rekomendacijos
- **[Gyvybinių rodiklių diegimo vadovas](https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/)** — antropometriniai matavimai (ūgis, svoris), surinkti prieš tyrimą
- **[Gyvensenos diegimo vadovas](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/)** — rūkymo statusas, vartojimas, tabako tipas, trukmė ir metimo duomenys
- **[Bazinis diegimo vadovas](https://build.fhir.org/ig/HL7LT/ig-lt-base/)** — pamatiniai ištekliai (PatientLt, PractitionerLt, OrganizationLt, ServiceRequestLt, ConditionLt)
