ValueSet: KidneyLesionDensityVS
Id: kidney-lesion-density
Title: "Kidney Lesion Density"
Description: "Density types for kidney lesions detected during LDCT screening. Calcified can co-occur with cystic, solid, or complex."
* ^url = $kidney-lesion-density-vs-url
* ^status = #active
* insert SNOMEDCopyrightForVS

* $sct#20476009 "Cystic (qualifier value)"
* $sct#35702001 "Solid (qualifier value)"
* $sct#103360007 "Complex (qualifier value)"
* SnomedExtensionCode#calcified "Calcified"


ValueSet: KidneyLateralityVS
Id: kidney-laterality
Title: "Kidney Laterality"
Description: "Kidney laterality for lesion location."
* ^url = $kidney-laterality-vs-url
* ^status = #active
* insert SNOMEDCopyrightForVS

* $sct#9846003 "Right kidney structure (body structure)"
* $sct#18639004 "Left kidney structure (body structure)"
