### Examples

This page lists all example instances in the Lithuanian Lung Cancer Implementation Guide.

#### Report and Composition Examples

| Example | Description |
|---|---|
| [diagnosticreport-lung-report-example](DiagnosticReport-diagnosticreport-lung-report-example.html) | Complete LDCT screening report with LUNG-RADS 4A, solid nodule, coronary calcification |
| [lung-composition-ldct-example](Composition-lung-composition-ldct-example.html) | LDCT imaging composition with findings, impression, and recommendation sections |

#### LUNG-RADS Assessment Examples

| Example | Description |
|---|---|
| [observation-lung-rads-4a-example](Observation-observation-lung-rads-4a-example.html) | LUNG-RADS Category 4A (Suspicious) |
| [observation-lung-rads-4as-example](Observation-observation-lung-rads-4as-example.html) | LUNG-RADS Category 4A with S modifier |

#### Pulmonary Nodule Examples

| Example | Description |
|---|---|
| [observation-pulmonary-nodule-solid-example](Observation-observation-pulmonary-nodule-solid-example.html) | Solid nodule in right upper lobe (9mm, spiculated) |
| [observation-pulmonary-nodule-part-solid-example](Observation-observation-pulmonary-nodule-part-solid-example.html) | Part-solid nodule in left upper lobe |
| [observation-pulmonary-nodule-ground-glass-example](Observation-observation-pulmonary-nodule-ground-glass-example.html) | Ground-glass nodule in right middle lobe |

#### Incidental Finding Examples

| Example | Description |
|---|---|
| [observation-incidental-coronary-calcification-example](Observation-observation-incidental-coronary-calcification-example.html) | Coronary artery calcification, moderate severity |
| [observation-incidental-emphysema-example](Observation-observation-incidental-emphysema-example.html) | Pulmonary emphysema, severe |
| [observation-incidental-pleural-effusion-example](Observation-observation-incidental-pleural-effusion-example.html) | Bilateral pleural effusion |

#### Recommendation Examples

| Example | Description |
|---|---|
| [observation-lung-recommendation-3m-example](Observation-observation-lung-recommendation-3m-example.html) | Recommendation for 3-month follow-up LDCT |
| [observation-lung-recommendation-pulmonologist-example](Observation-observation-lung-recommendation-pulmonologist-example.html) | Recommendation for pulmonologist consultation |

#### Cross-IG Example References

The lung cancer screening pathway uses resources defined in other Lithuanian FHIR IGs:

**Vital Signs IG** (anthropometrics collected during pre-examination):
- [BodyHeight](https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/StructureDefinition-body-height.html) — patient height
- [BodyWeight](https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/StructureDefinition-body-weight.html) — patient weight
- [Bmi](https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/StructureDefinition-bmi.html) — body mass index

**Lifestyle IG** (smoking history critical for lung cancer risk):
- [TobaccoUseLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-use-lt-lifestyle.html) — current/former/never smoking status
- [TobaccoSmokingConsumptionLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-smoking-consumption-lt-lifestyle.html) — cigarettes per day, pack-years
- [TobaccoTypeUsedLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-type-used-lt-lifestyle.html) — type of tobacco product
- [TobaccoUseDurationLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-use-duration-lt-lifestyle.html) — years of tobacco use
- [TobaccoSmokingStoppedLtLifestyle](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/StructureDefinition-tobacco-smoking-stopped-lt-lifestyle.html) — years since cessation
