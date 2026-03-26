ValueSet: IncidentalFindingVS
Id: incidental-finding
Title: "Incidental Finding"
Description: "Significant incidental findings in the chest and abdominal areas detected during low-dose chest computed tomography (LDCT) screening."
* ^url = $incidental-finding-vs-url
* ^status = #active
* insert SNOMEDCopyrightForVS

// === 1.2.2.1 Random findings in the lungs ===
* $sct#87433001 "Pulmonary emphysema (disorder)"
* $sct#12295008 "Bronchiectasis (disorder)"
* $sct#365664001 "Finding of pleural fluid appearance (finding)"
* $sct#301256004 "Pleura finding (finding)"
* $sct#540881000124100 "Mass of pleura (finding)"
* $sct#233659006 "Asbestos-induced pleural plaque (disorder)"
* $sct#32931001 "Calcification of pleura (disorder)"
* $sct#36118008 "Pneumothorax (disorder)"
* $sct#16838000 "Mediastinal emphysema (disorder)"
* $sct#126728003 "Neoplasm of diaphragm (disorder)"
* $sct#39839004 "Diaphragmatic hernia (disorder)"
* $sct#286972004 "Complicated diaphragmatic hernia (disorder)"
* $sct#95436008 "Lung consolidation (disorder)"
// Lung consolidation should also have 2 subtypes / interpretatioms
* $sct#154283005 "Pulmonary tuberculosis (disorder)"
// do we need to add code for suspected tuberculosis?
* $sct#113254000 "Structure of interstitial tissue of lung (body structure)" // also need to add subtypes to this, but no snomed codes

// === 1.2.2.2 Random findings not in the lungs ===
* $sct#445512009 "Calcification of coronary artery (disorder)"
// do we need to add a code for visual estimation of calcification?
* $sct#250978003 "Aortic valve calcification (disorder)"
* $sct#433068007 "Aneurysm of thoracic aorta (disorder)"
* $sct#94147001 "Mass of mediastinum (finding)"
* $sct#396361002 "Lesion size, largest dimension (observable entity)" //added
* $sct#28328005 "Abnormal radiologic density (finding)" //added
* $sct#129748009 "Radiographic calcification finding (finding)" //added
* $sct#30746006 "Lymphadenopathy (disorder)"
* $sct#704281009 "Head and neck lymphadenopathy (disorder)" //added
* $sct#52324001 "Mediastinal lymphadenopathy (disorder)" //added
* $sct#87500009 "Hilar lymphadenopathy (disorder)" //added
* $sct#127189005 "Axillary lymphadenopathy (disorder)" //added
* $sct#237557003 "Mass of thyroid gland (finding)"
* $sct#373945007 "Pericardial effusion (disorder)"
* $sct#37657006 "Disorder of esophagus (disorder)"
* $sct#78974003 "Dilatation of esophagus (disorder)"
* $sct#300287006 "Esophageal mass (finding)"
* $sct#233985008 "Abdominal aortic aneurysm (disorder)"
* $sct#89164003 "Breast lump (finding)"
* $sct#300332007 "Liver mass (finding)"
* $sct#309088003 "Renal mass (finding)"
* $sct#312894000 "Osteopenia (disorder)"
* $sct#203438009 "Vertebral osteoporosis (disorder)"
* $sct#42942008 "Compression fracture of vertebral column (disorder)"
* $sct#118953000 "Bone finding (finding)"
* $sct#237783006 "Mass of adrenal gland (finding)"
* $sct#65275009 "Acute cholecystitis (disorder)"
* $sct#138561000119104 "Gallbladder mass (disorder)"
