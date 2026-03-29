CodeSystem: LungQuestionnaireOptions
Id: lung-questionnaire-options
Title: "Lung questionnaire answer options"
Description: "Illustrative answer option codes for ESPBI questionnaire forms used in the Lithuanian lung cancer prevention programme."
* ^url = $lung-questionnaire-options-cs-url
* ^status = #draft
* ^caseSensitive = true
* ^content = #complete

// --- General answers ---
* #yes "Yes"
* #no "No"
* #unknown "Unknown"

// --- Nodule type ---
* #solid "Solid"
* #part-solid "Part solid"
* #ground-glass "Ground glass nodule"
* #calcified "Calcified"
* #cavitary "Cavitary"

// --- Lung lobes ---
* #right-upper "Upper lobe of the right lung"
* #right-middle "Middle lobe of the right lung"
* #right-lower "Lower lobe of the right lung"
* #left-upper "Upper lobe of the left lung"
* #left-lower "Lower lobe of the left lung"

// --- Morphology ---
* #spiculated "With spicules"
* #irregular-margins "Irregular contours"
* #pleural-related "Related to pleura"

// --- LUNG-RADS categories ---
* #lung-rads-0 "LUNG-RADS 0 – Images cannot be evaluated"
* #lung-rads-1 "LUNG-RADS 1 – No findings detected in the lungs"
* #lung-rads-2 "LUNG-RADS 2 – Very likely benign formation"
* #lung-rads-3 "LUNG-RADS 3 – Likely benign formation"
* #lung-rads-4a "LUNG-RADS 4A – Detected suspicious formation"
* #lung-rads-4b "LUNG-RADS 4B – Detected very suspicious formation"
* #lung-rads-4x "LUNG-RADS 4X – Detected extremely suspicious formation"
* #lung-rads-s "LUNG-RADS S – Additional recommendation"

// --- Severity ---
* #moderate "Moderate"
* #severe "Severe / expressed"

// --- Laterality ---
* #right "Right"
* #left "Left"
* #bilateral "Bilateral"

// --- Incidental findings – lung ---
* #interstitial-changes "Interstitial lung changes (>5% of lung volume)"
* #non-subpleural "Non-subpleural"
* #subpleural-non-fibrotic "Subpleural non-fibrotic"
* #subpleural-fibrous "Subpleural fibrous"
* #respiratory-bronchiolitis "Respiratory bronchiolitis (RB-IPL)"
* #emphysema "Emphysema"
* #bronchiectasis "Bronchiectasis"
* #pleural-fluid "Fluid in the pleural cavity"
* #pleural-changes "Pleural changes"
* #suspected-malignant-pleura "Suspected malignant pleural changes"
* #asbestosis-plaque "Asbestosis pleural plaque"
* #pleural-calcification "Pleural calcification"
* #pneumothorax "Pneumothorax"
* #pneumomediastinum "Pneumomediastinum"
* #diaphragm-changes "Changes in diaphragms"
* #suspected-malignant-diaphragm "Suspected malignancy of diaphragm"
* #large-hernia "Large hernia"
* #complicated-hernia "Complicated hernia"
* #consolidation "Consolidation"
* #likely-inflammatory "Likely inflammatory"
* #possibly-malignant "Possibly malignant"
* #tuberculosis "Tuberculosis, likely active"
* #suspected-tuberculosis-other "Suspected tuberculosis differentiated from other diseases"

// --- Pleural fluid quantity ---
* #small-amount "Small amount"
* #large-amount "Large amount"

// --- Pleural calcification extent ---
* #local "Local"
* #diffuse "Diffuse"

// --- Lymphadenopathy location ---
* #neck "Neck"
* #paraclavicular "Paraclavicular"
* #mediastinal "Mediastinal"
* #hilar-right "Hilar - right"
* #hilar-left "Hilar - left"
* #hilar-both "Hilar - both"
* #axillary-right "Axillary - right"
* #axillary-left "Axillary - left"
* #axillary-both "Axillary - both"

// --- Incidental findings – non-lung ---
* #coronary-calcification "Coronary artery calcification"
* #aortic-valve-calcification "Aortic valve calcification"
* #thoracic-aortic-aneurysm "Thoracic aortic aneurysm"
* #mediastinal-mass "Mediastinal mass"
* #lymphadenopathy "Lymphadenopathy"
* #neck-lymph "Neck"
* #paraclavicular-lymph "Paraclavicular areas"
* #mediastinal-lymph "Mediastinal"
* #hilar-lymph "Lung roots (hilar)"
* #axillary-lymph "Armpits (axillary)"
* #thyroid-nodule "Thyroid changes (suspicious nodules)"
* #pericardial-effusion "Fluid in the pericardial cavity"
* #esophageal-changes "Changes in the esophagus"
* #esophageal-dilation "Significant lumen expansion of esophagus"
* #esophageal-mass "Esophageal mass"
* #abdominal-aortic-aneurysm "Abdominal aortic aneurysm"
* #breast-findings "Suspicious findings in the breasts"
* #liver-lesions "Liver lesions"
* #kidney-lesions "Kidney lesions"
* #bone-changes "Changes in bones"
* #osteopenia "Osteopenia (L1 vertebra 100-130HV)"
* #osteoporosis "Osteoporosis (L1 vertebra <100HV)"
* #vertebral-compression "Vertebral compression fracture (>50% height reduction)"
* #bone-destruction "Bone destruction"
* #adrenal-formations "Adrenal formations"
* #gallbladder-changes "Changes in the gallbladder"
* #acute-cholecystitis "Suspected acute cholecystitis"
* #gallbladder-mass "Infiltration with masses in gallbladder"

// --- Texture (liver/kidney) ---
* #cystic "Cystic"
* #solid-texture "Solid"
* #mixed-complex "Mixed-complex"

// --- Count ---
* #singular "Singular"
* #multiple "Multiple"

// --- Density (kidney) ---
* #hypodense "Hypodense"
* #hyperdense "Hyperdense"
* #calcified-density "Calcified"

// --- Pre-LDCT smoking types ---
* #cigarettes "Cigarettes"
* #e-cigarettes "Electronic cigarettes"
* #heated-tobacco "Heated tobacco"
* #tobacco "Tobacco"
* #pipe "Pipe"

// --- Functional status ---
* #self-care "Self-care capable"
* #bedridden "Bedridden/chairbound"

// --- Coronary calcification scoring ---
* #cac-none "0 = None"
* #cac-small "1 = Small"
* #cac-average "2 = Average"
* #cac-difficult "3 = Difficult"
