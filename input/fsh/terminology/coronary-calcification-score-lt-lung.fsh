ValueSet: CoronaryCalcificationScoreVS
Id: coronary-calcification-score
Title: "Coronary Calcification Visual Score"
Description: "Visual semi-quantitative scoring of coronary artery calcification during LDCT screening (ADP 1.2.2.2 item 1)."
* ^url = $coronary-calcification-score-vs-url
* ^status = #active
// Required by the ShareableValueSet check the publisher applies.
* ^experimental = false

* SnomedExtensionCode#cac-none "No coronary calcification"
* SnomedExtensionCode#cac-mild "Mild coronary calcification"
* SnomedExtensionCode#cac-moderate "Moderate coronary calcification"
* SnomedExtensionCode#cac-severe "Severe coronary calcification"
