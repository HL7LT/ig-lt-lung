CodeSystem: LungRecommendation
Id: lung-recommendation
Title: "Lung Screening Recommendation Codes"
Description: """
Recommendation codes used in the Lithuanian lung cancer early diagnosis
programme for follow-up and referral actions after LUNG-RADS assessment.

These codes represent the recommended next clinical action based on the
radiological conclusion and programme rules.
"""
* ^url = $lung-recommendation-cs-url
* ^status = #active
* ^experimental = false
* ^content = #complete
* #repeat-36m "Repeat LDCT after 36 months"
* #repeat-1m "Repeat LDCT after 1 month"
* #insufficient-prior-images "Insufficient data - previous images required for comparison"
* #followup-12m "Follow-up LDCT after 12 months"
* #followup-6m "Follow-up LDCT after 6 months"
* #followup-3m "Follow-up LDCT after 3 months"
* #pulmonologist-consult "Refer for pulmonologist consultation in an oncology cluster institution"
* #specialist-consult "Refer for consultation to an appropriate specialist"


ValueSet: LungRecommendationVS
Id: lung-recommendation
Title: "Lung Screening Recommendation Value Set"
Description: """
Allowed recommendation codes used in the Lithuanian lung cancer early
diagnosis programme for follow-up and referral decisions.
"""
* ^url = $lung-recommendation-vs-url
* ^status = #active
* ^experimental = false
* include codes from system LungRecommendation
