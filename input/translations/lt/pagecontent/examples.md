### Pavyzdžiai

Šiame puslapyje pateikiami visi pavyzdiniai egzemplioriai, esantys Lietuvos plaučių vėžio diegimo vadove.

#### Ataskaitų ir kompozicijos pavyzdžiai

| Pavyzdys | Aprašymas |
|---|---|
| [diagnosticreport-lung-report-example](DiagnosticReport-diagnosticreport-lung-report-example.html) | Pilna LDCT atrankos ataskaita su LUNG-RADS 4A, kietu mazgeliu, koronarine kalcifikacija |
| [lung-composition-ldct-example](Composition-lung-composition-ldct-example.html) | LDCT vaizdinimo kompozicija su radinių, įspūdžio ir rekomendacijų skyriais |

#### LUNG-RADS vertinimo pavyzdžiai

| Pavyzdys | Aprašymas |
|---|---|
| [observation-lung-rads-4a-example](Observation-observation-lung-rads-4a-example.html) | LUNG-RADS 4A kategorija (įtartina) |
| [observation-lung-rads-4as-example](Observation-observation-lung-rads-4as-example.html) | LUNG-RADS 4A kategorija su S modifikatoriumi |

#### Plaučių mazgelių pavyzdžiai

| Pavyzdys | Aprašymas |
|---|---|
| [observation-pulmonary-nodule-solid-example](Observation-observation-pulmonary-nodule-solid-example.html) | Kietas mazgelis dešinės plaučių viršutinėje skiltyje (9 mm, spikuliuotas) |
| [observation-pulmonary-nodule-part-solid-example](Observation-observation-pulmonary-nodule-part-solid-example.html) | Iš dalies kietas mazgelis kairės plaučių viršutinėje skiltyje |
| [observation-pulmonary-nodule-ground-glass-example](Observation-observation-pulmonary-nodule-ground-glass-example.html) | Matinio stiklo tipo mazgelis dešinės plaučių vidurinėje skiltyje |

#### Atsitiktinių radinių pavyzdžiai

| Pavyzdys | Aprašymas |
|---|---|
| [observation-incidental-coronary-calcification-example](Observation-observation-incidental-coronary-calcification-example.html) | Vainikinių arterijų kalcifikacija, vidutinio sunkumo |
| [observation-incidental-emphysema-example](Observation-observation-incidental-emphysema-example.html) | Plaučių emfizema, sunki |
| [observation-incidental-pleural-effusion-example](Observation-observation-incidental-pleural-effusion-example.html) | Abipusis pleurinis efuzas |

#### Rekomendacijų pavyzdžiai

| Pavyzdys | Aprašymas |
|---|---|
| [observation-lung-recommendation-3m-example](Observation-observation-lung-recommendation-3m-example.html) | Rekomendacija atlikti pakartotinį LDCT po 3 mėnesių |
| [observation-lung-recommendation-pulmonologist-example](Observation-observation-lung-recommendation-pulmonologist-example.html) | Rekomendacija dėl pulmonologo konsultacijos |

#### Tarp diegimo vadovų bendrai naudojamų pavyzdžių nuorodos

Plaučių vėžio atrankos kelias naudoja kituose Lietuvos FHIR diegimo vadovuose apibrėžtus išteklius:

**Gyvybinių rodiklių diegimo vadovas** (antropometriniai duomenys, surinkti prieš tyrimą):
- [BodyHeight](https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/StructureDefinition-body-height.html) — paciento ūgis
- [BodyWeight](https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/StructureDefinition-body-weight.html) — paciento svoris
- [Bmi](https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/StructureDefinition-bmi.html) — kūno masės indeksas

**Gyvensenos diegimo vadovas** (rūkymo istorija, kritinė plaučių vėžio rizikai):
- [TobaccoUseLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-use-lt-lifestyle.html) — esamas / buvęs / niekada nerūkęs statusas
- [TobaccoSmokingConsumptionLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-smoking-consumption-lt-lifestyle.html) — cigarečių per dieną, pakelio metai
- [TobaccoTypeUsedLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-type-used-lt-lifestyle.html) — tabako gaminio tipas
- [TobaccoUseDurationLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-use-duration-lt-lifestyle.html) — tabako vartojimo metai
- [TobaccoSmokingStoppedLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-smoking-stopped-lt-lifestyle.html) — metai nuo metimo
