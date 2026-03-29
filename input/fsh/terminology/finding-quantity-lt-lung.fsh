ValueSet: FindingQuantityVS
Id: finding-quantity
Title: "Finding Quantity"
Description: "Amount of a finding: small, medium, or large. Used for pleural fluid, pericardial effusion, and similar quantifiable incidental findings."
* ^url = $finding-quantity-vs-url
* ^status = #active
* insert SNOMEDCopyrightForVS

* $sct#255507004 "Small (qualifier value)"
* $sct#255508009 "Medium (qualifier value)"
* $sct#255509001 "Large (qualifier value)"
