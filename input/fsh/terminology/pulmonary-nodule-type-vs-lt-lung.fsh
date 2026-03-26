ValueSet: PulmonaryNoduleTypeVS
Id: pulmonary-nodule-type
Title: "Pulmonary Nodule Type"
Description: """
Allowed pulmonary nodule type values used in the Lithuanian lung cancer
early diagnosis programme.
"""
* ^url = $pulmonary-nodule-type-vs-url
* ^status = #active
* ^experimental = false
* $sct#35702001 "Solid"
* $sct#1217294009 "Ground glass lung opacity"
* $sct#255347005 "Hollow"
* $sct#129748009 "Radiographic calcification finding (finding)"
* PulmonaryNoduleTypeLocal#part-solid "Part-solid"
