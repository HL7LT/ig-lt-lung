ValueSet: IncidentalFindingVS
Id: incidental-finding
Title: "Incidental Finding"
Description: "Significant incidental findings in the chest and abdominal areas detected during low-dose chest computed tomography (LDCT) screening."
* ^url = $incidental-finding-vs-url
* ^status = #active
* insert SNOMEDCopyrightForVS

// === 1.2.2.1 Random findings in the lungs ===

// 1. Interstitial lung changes — subtypes via local extension codes
* $sct#233703007 "Interstitial lung disease (disorder)"
* SnomedExtensionCode#interstitial-non-subpleural "Interstitial lung changes - non-subpleural"
* SnomedExtensionCode#interstitial-subpleural-non-fibrotic "Interstitial lung changes - subpleural non-fibrotic"
* SnomedExtensionCode#interstitial-subpleural-fibrous "Interstitial lung changes - subpleural fibrous"
* SnomedExtensionCode#interstitial-rb-ipl "Respiratory bronchiolitis (RB-IPL)"

// 2. Emphysema
* $sct#87433001 "Pulmonary emphysema (disorder)"

// 3. Bronchiectasis
* $sct#12295008 "Bronchiectasis (disorder)"

// 4. Pleural fluid
* $sct#365664001 "Finding of pleural fluid appearance (finding)"

// 5. Pleural changes
* $sct#301256004 "Pleura finding (finding)"
* $sct#540881000124100 "Mass of pleura (finding)"
* $sct#233659006 "Asbestos-induced pleural plaque (disorder)"
* $sct#32931001 "Calcification of pleura (disorder)"

// 6. Pneumothorax
* $sct#36118008 "Pneumothorax (disorder)"
* $sct#109363001 "Right pneumothorax (disorder)"
* $sct#109364007 "Left pneumothorax (disorder)"

// 7. Pneumomediastinum
* $sct#16838000 "Mediastinal emphysema (disorder)"

// 8. Diaphragm changes
* $sct#126728003 "Neoplasm of diaphragm (disorder)"
* $sct#39839004 "Diaphragmatic hernia (disorder)"
* $sct#286972004 "Complicated diaphragmatic hernia (disorder)"

// 9. Consolidation
* $sct#95436008 "Lung consolidation (disorder)"
// TODO: Add consolidation subtypes (inflammatory vs. malignant) as interpretation component

// 10. Tuberculosis — main code; suspected qualifier handled via interpretation component
* $sct#154283005 "Pulmonary tuberculosis (disorder)"
* $sct#772170009 "Tuberculosis suspected (situation)"

// === 1.2.2.2 Random findings not in the lungs ===

// 1. Coronary artery calcification
* $sct#445512009 "Calcification of coronary artery (disorder)"

// 2. Aortic valve calcification
* $sct#250978003 "Aortic valve calcification (disorder)"

// 3. Thoracic aortic aneurysm
* $sct#433068007 "Aneurysm of thoracic aorta (disorder)"

// 4. Mediastinal mass
* $sct#94147001 "Mass of mediastinum (finding)"

// 5. Lymphadenopathy
* $sct#30746006 "Lymphadenopathy (disorder)"
* $sct#704281009 "Head and neck lymphadenopathy (disorder)"
* $sct#52324001 "Mediastinal lymphadenopathy (disorder)"
* $sct#87500009 "Hilar lymphadenopathy (disorder)"
* $sct#127189005 "Axillary lymphadenopathy (disorder)"

// 6. Thyroid changes
* $sct#237557003 "Mass of thyroid gland (finding)"

// 7. Pericardial effusion
* $sct#373945007 "Pericardial effusion (disorder)"

// 8. Esophageal changes
* $sct#37657006 "Disorder of esophagus (disorder)"
* $sct#78974003 "Dilatation of esophagus (disorder)"
* $sct#300287006 "Esophageal mass (finding)"

// 9. Abdominal aortic aneurysm
* $sct#233985008 "Abdominal aortic aneurysm (disorder)"

// 10. Breast findings
* $sct#89164003 "Breast lump (finding)"

// 11. Liver lesions
* $sct#300332007 "Liver mass (finding)"

// 12. Kidney lesions
* $sct#309088003 "Renal mass (finding)"

// 13. Bone changes
* $sct#312894000 "Osteopenia (disorder)"
* $sct#203438009 "Vertebral osteoporosis (disorder)"
* $sct#42942008 "Compression fracture of vertebral column (disorder)"
* $sct#118953000 "Bone finding (finding)"

// 14. Adrenal formations
* $sct#237783006 "Mass of adrenal gland (finding)"

// 15. Gallbladder changes
* $sct#65275009 "Acute cholecystitis (disorder)"
* $sct#138561000119104 "Gallbladder mass (disorder)"
