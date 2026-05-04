### Profiliai

Šiame puslapyje aprašomi Lietuvos plaučių vėžio diegimo vadove apibrėžti FHIR profiliai. Profiliai modeliuoja LDCT (mažos dozės krūtinės kompiuterinės tomografijos) atrankos kelią — nuo vaizdinimo ataskaitos talpyklos per atskirus radinius iki LUNG-RADS vertinimo ir tolesnių rekomendacijų.

#### Ataskaitų ir kompozicijų profiliai

| Profilis | Aprašymas |
|---|---|
| [LungReportLtLung](StructureDefinition-lung-report-lt-lung.html) | Bendra LDCT diagnostinė ataskaita, apgaubianti plaučių kompoziciją ir sujungianti visus struktūrizuotus rezultatus. Remiasi ImagingReportLt iš bazinio diegimo vadovo. |
| [LungCompositionLtLung](StructureDefinition-lung-composition-lt-lung.html) | Plaučiams specifinė vaizdinimo kompozicija su radinių (mazgeliai, atsitiktiniai radiniai), įspūdžio (LUNG-RADS) ir rekomendacijų skyriais. Remiasi ImagingCompositionLt. |

#### Vertinimo ir radinių profiliai

| Profilis | Aprašymas |
|---|---|
| [LungRadsAssessmentLtLung](StructureDefinition-lung-rads-assessment-lt-lung.html) | LUNG-RADS kategorijos vertinimas (0, 1, 2, 3, 4A, 4B, 4X) su pasirenkamu S modifikatoriumi reikšmingiems atsitiktiniams radiniams. |
| [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) | Atskiras plaučių mazgelio stebėjimas su tipu (kietas, iš dalies kietas, matinio stiklo, kalcifikuotas, kaverninis), plaučių skilties vieta, morfologija (spikuliacija, netaisyklingi kraštai, sąsaja su pleura) ir dydžio / tūrio matavimais. |
| [IncidentalFindingLtLung](StructureDefinition-incidental-finding-lt-lung.html) | Reikšmingas atsitiktinis radinys, aptiktas LDCT metu — apima plaučių radinius (emfizema, bronchektazė, pleuriniai pokyčiai) ir už plaučių esančius radinius (vainikinių arterijų kalcifikacija, aortos aneurizma, tarpuplaučio masė ir kt.). |
| [LungRecommendationObservationLtLung](StructureDefinition-lung-recommendation-observation-lt-lung.html) | Tolesnės priežiūros rekomendacija, paremta LUNG-RADS kategorija (pakartotinė atranka, stebėsenos intervalas, specialisto konsultacija). |

#### Tarp diegimo vadovų esančios priklausomybės

Plaučių vėžio atrankos kelias remiasi kituose Lietuvos FHIR diegimo vadovuose esančiais ištekliais:

- **[Gyvybinių rodiklių diegimo vadovas](https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/)** — antropometriniai matavimai (ūgis, svoris, KMI), surinkti prieš tyrimą pildomoje anketoje
- **[Gyvensenos diegimo vadovas](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/)** — rūkymo statusas, tabako vartojimas, pakelio metai, tabako tipas ir rūkymo nutraukimo duomenys, kritiniai plaučių vėžio rizikos vertinimui
- **[Bazinis diegimo vadovas](https://build.fhir.org/ig/HL7LT/ig-lt-base/)** — pamatiniai profiliai (PatientLt, PractitionerLt, ObservationLt, DiagnosticReportLt, ImagingReportLt, ImagingCompositionLt, ServiceRequestLt, EncounterLt)
