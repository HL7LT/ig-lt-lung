ValueSet: PulmonaryNoduleTypeVSLtLung
Id: pulmonary-nodule-type-vs-lt-lung
Title: "Pulmonary Nodule Type"
Description: """
Allowed pulmonary nodule type values used in the Lithuanian lung cancer
early diagnosis programme.
"""
* ^url = $pulmonary-nodule-type-vs-lt-lung-url
* ^status = #active
* ^experimental = false
* $sct#35702001 "Solid"
* $sct#1217294009 "Ground glass lung opacity"
* $sct#255347005 "Hollow"
* $sct#255003 "Calcified nodule"
* PulmonaryNoduleTypeLocalLtLung#part-solid "Part-solid"
