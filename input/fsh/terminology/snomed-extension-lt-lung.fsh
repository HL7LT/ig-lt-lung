CodeSystem: SnomedExtensionCode
Id: snomed-extension-code
Title: "SNOMED CT Extension Codes"
Description: """
Local extension codes used in the Lithuanian lung cancer early diagnosis
programme when no suitable SNOMED CT code is available. These codes extend
SNOMED CT concepts with local granularity required by the ADP dataset.
"""
* ^url = $snomed-extension-code-cs-url
* ^status = #active
* ^experimental = false
* ^content = #complete

// Interstitial lung change subtypes (ADP 1.2.2.1 item 1)
* #interstitial-non-subpleural "Interstitial lung changes - non-subpleural"
    "Non-subpleural interstitial lung changes (>5% of lung volume)"
* #interstitial-subpleural-non-fibrotic "Interstitial lung changes - subpleural non-fibrotic"
    "Subpleural non-fibrotic interstitial lung changes"
* #interstitial-subpleural-fibrous "Interstitial lung changes - subpleural fibrous"
    "Subpleural fibrous interstitial lung changes"
* #interstitial-rb-ipl "Respiratory bronchiolitis (RB-IPL)"
    "Respiratory bronchiolitis-associated interstitial lung disease"

// Coronary artery calcification visual scoring (ADP 1.2.2.2 item 1)
* #cac-none "No coronary calcification"
    "No coronary artery calcification detected by visual assessment"
* #cac-mild "Mild coronary calcification"
    "Mild coronary artery calcification by visual assessment"
* #cac-moderate "Moderate coronary calcification"
    "Moderate coronary artery calcification by visual assessment"
* #cac-severe "Severe coronary calcification"
    "Severe coronary artery calcification by visual assessment"

// Calcified density qualifier (not in SNOMED as a standalone qualifier)
* #calcified "Calcified"
    "Calcified density or texture finding"
