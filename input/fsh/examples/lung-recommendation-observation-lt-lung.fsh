Instance: observation-lung-recommendation-3m-example
InstanceOf: LungRecommendationObservationLtLung
Usage: #example
Title: "Observation: Lung screening recommendation - 3 month (example)"
Description: "Example of a recommendation for follow-up LDCT after 3 months."
* status = #final
* code = $sct#424900004 "Recommendation - action"
* subject = Reference(example-patient-male)
* performer = Reference(example-practitioner)
* effectiveDateTime = "2025-09-22T10:35:00Z"
* valueCodeableConcept = LungRecommendationLtLung#followup-3m "Follow-up LDCT after 3 months"
* derivedFrom = Reference(observation-lung-rads-4a-example)
* note.text = "Short-term follow-up LDCT is recommended in 3 months based on the screening findings."


Instance: observation-lung-recommendation-pulmonologist-example
InstanceOf: LungRecommendationObservationLtLung
Usage: #example
Title: "Observation: Lung screening recommendation - pulmonologist consultation (example)"
Description: "Example of a recommendation to refer the patient for pulmonologist consultation."
* status = #final
* code = $sct#424900004 "Recommendation - action"
* subject = Reference(example-patient-male)
* performer = Reference(example-practitioner)
* effectiveDateTime = "2025-09-22T11:00:00Z"
* valueCodeableConcept = LungRecommendationLtLung#pulmonologist-consult "Refer for pulmonologist consultation in an oncology cluster institution"
* note.text = "Patient should be referred for pulmonologist consultation in an oncology cluster institution."
