CodeSystem: LungRadsModifier
Id: lung-rads-modifier
Title: "LUNG-RADS Assessment Modifier"
Description: """
Additional modifier used together with the main LUNG-RADS assessment
category in the Lithuanian lung cancer early diagnosis programme.

The modifier S indicates clinically significant incidental findings that
contribute to the overall assessment string, for example 0S or 4AS.
"""
* ^url = $lung-rads-modifier-cs-url
* ^status = #active
* ^experimental = false
* ^content = #complete
* #S "Modifier S – Significant incidental finding"


ValueSet: LungRadsModifierVS
Id: lung-rads-modifier
Title: "LUNG-RADS Assessment Modifier Codes"
Description: """
Allowed LUNG-RADS assessment modifier codes used in the Lithuanian
lung cancer early diagnosis programme.
"""
* ^url = $lung-rads-modifier-vs-url
* ^status = #active
* ^experimental = false
* include codes from system LungRadsModifier
