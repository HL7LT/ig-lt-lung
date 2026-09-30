ValueSet: ConsolidationInterpretationVS
Id: consolidation-interpretation
Title: "Consolidation Interpretation"
Description: "Interpretation subtypes for lung consolidation detected during LDCT screening: likely inflammatory or suspected malignant (ADP 1.2.2.1 item 9)."
* ^url = $consolidation-interpretation-vs-url
* ^status = #active
// Required by the ShareableValueSet check the publisher applies.
* ^experimental = false
* insert SNOMEDCopyrightForVS

* $sct#257552002 "Inflammation"
* $sct#1495041000004108 "Neoplastic proliferation (qualifier value)"
