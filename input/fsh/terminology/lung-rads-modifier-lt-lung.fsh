CodeSystem: LungRadsModifierLtLung
Id: lung-rads-modifier-lt-lung
Title: "LUNG-RADS Assessment Modifier"
Description: """
Additional modifier used together with the main LUNG-RADS assessment
category in the Lithuanian lung cancer early diagnosis programme.

The modifier S indicates clinically significant incidental findings that
contribute to the overall assessment string, for example 0S or 4AS.
"""
* ^url = $lung-rads-modifier-lt-lung-url
* ^status = #active
* ^experimental = false
* ^content = #complete
* #S "Modifier S – Significant incidental finding"


ValueSet: LungRadsModifierVSLtLung
Id: lung-rads-modifier-vs-lt-lung
Title: "LUNG-RADS Assessment Modifier Codes"
Description: """
Allowed LUNG-RADS assessment modifier codes used in the Lithuanian
lung cancer early diagnosis programme.
"""
* ^url = $lung-rads-modifier-vs-lt-lung-url
* ^status = #active
* ^experimental = false
* include codes from system LungRadsModifierLtLung
