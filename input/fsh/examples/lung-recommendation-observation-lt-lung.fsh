Instance: observation-lung-recommendation-3m-example
InstanceOf: LungRecommendationObservationLtLung
Usage: #example
Title: "Observation: Lung screening recommendation - 3 month (example)"
Description: "Follow-up LDCT recommended after 3 months based on LUNG-RADS 4A assessment."
* status = #final
* code = $sct#424900004 "Recommendation - action"
* subject = Reference(patient-male-example)
* performer = Reference(practitioner-radiologist-example)
* effectiveDateTime = "2025-09-22T10:35:00Z"
* valueCodeableConcept = LungRecommendation#followup-3m "Follow-up LDCT after 3 months"
* derivedFrom = Reference(observation-lung-rads-4a-example)
* note.text = "Short-term follow-up LDCT is recommended in 3 months based on the screening findings."


Instance: observation-lung-recommendation-pulmonologist-example
InstanceOf: LungRecommendationObservationLtLung
Usage: #example
Title: "Observation: Lung screening recommendation - pulmonologist consultation (example)"
Description: "Referral to pulmonologist consultation in an oncology cluster institution for further evaluation of suspicious findings."
* status = #final
* code = $sct#424900004 "Recommendation - action"
* subject = Reference(patient-male-example)
* performer = Reference(practitioner-radiologist-example)
* effectiveDateTime = "2025-09-22T11:00:00Z"
* valueCodeableConcept = LungRecommendation#pulmonologist-consult "Refer for pulmonologist consultation in an oncology cluster institution"
* note.text = "Patient should be referred for pulmonologist consultation in an oncology cluster institution."
