CodeSystem: LungRadsCategory
Id: lung-rads-category
Title: "LUNG-RADS Assessment Categories"
Description: """
Main LUNG-RADS assessment categories used in the Lithuanian lung cancer
early diagnosis programme.

These codes represent the primary final assessment category assigned
to the low-dose chest CT screening examination.
"""
* ^url = $lung-rads-category-cs-url
* ^status = #active
* ^experimental = false
* ^content = #complete
* #0  "Category 0 – Incomplete"
* #1  "Category 1 – Negative"
* #2  "Category 2 – Benign appearance or behavior"
* #3  "Category 3 – Probably benign"
* #4A "Category 4A – Suspicious"
* #4B "Category 4B – Very suspicious"
* #4X "Category 4X – Extremely suspicious"


ValueSet: LungRadsCategoryVS
Id: lung-rads-category
Title: "LUNG-RADS Assessment Category"
Description: """
Allowed primary LUNG-RADS assessment categories used in the Lithuanian
lung cancer early diagnosis programme.
"""
* ^url = $lung-rads-category-vs-url
* ^status = #active
* ^experimental = false
* include codes from system LungRadsCategory
