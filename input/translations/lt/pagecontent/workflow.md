# Plaučių vėžio atrankos ir ankstyvo diagnozavimo darbo eiga

Plaučių vėžio atrankos ir ankstyvo diagnozavimo darbo eiga yra struktūrizuotas, longitudinis klinikinis procesas, skirtas palaikyti **didesnę riziką turinčių asmenų ankstyvą plaučių vėžio aptikimą**.

Darbo eigos pagrindas — **mažos dozės kompiuterinė tomografija (LDCT)** vaizdinimas, jungiantis kelis etapus: tinkamumo vertinimą, struktūrizuotą klinikinio konteksto rinkimą, vaizdinimo atlikimą, radiologinį interpretavimą ir tolesnės priežiūros planavimą.

Skirtingai nuo diagnostinių kelių, prasidedančių nuo simptomų, plaučių vėžio atrankos programa yra **prevencinė ir ciklinė** — dalyviai gali atlikti pakartotinius atrankos tyrimus su laiku, priklausomai nuo vaizdinimo radinių interpretacijos.

Darbo eiga apjungia kelis sveikatos priežiūros dalyvius — **pirminę sveikatos priežiūrą, radiologines paslaugas, atrankos programos koordinatorius ir specializuotų paslaugų teikėjus** — užtikrinant nuoseklią struktūrizuotų duomenų mainą naudojant **HL7 FHIR standartą**.

## Kvietimas ir tinkamumo vertinimas

Atrankos procesas prasideda nustatant asmenis, kurie gali būti tinkami dalyvauti plaučių vėžio ankstyvo diagnozavimo programoje.

Tinkamumas nustatomas pagal programos kriterijus, tokius kaip:

- amžiaus intervalas,
- rūkymo istorija ir tabako poveikis,
- bendras klinikinės rizikos profilis.

Jei tinkamumo kriterijai įvykdomi, dalyvis kviečiamas į atrankos programą ir paskiriamas vaizdinimo tyrimas.

FHIR požiūriu šis žingsnis gali apimti atrankos užsakymo, atvaizduojamo kaip **ServiceRequest** ištekliaus, sukūrimą kartu su pagrindine dalyvio konteksto informacija.

## Prieš tyrimą surinktas klinikinis kontekstas ir rizikos informacija

Prieš atliekant vaizdinimą užpildoma **struktūrizuota klinikinė anketa**, skirta surinkti informaciją, svarbią atrankos interpretacijai ir tolesnei priežiūrai.

Ši anketa fiksuoja informaciją, pavyzdžiui:

- funkcinę būklę ir bendros sveikatos rodiklius,
- rūkymo ir nikotino poveikio istoriją,
- antropometrinius matavimus,
- ankstesnių krūtinės KT tyrimų istoriją, įskaitant tyrimo datą (-as), kai ji žinoma (ADP 1.1.8),
- neseniai persirgtas kvėpavimo takų infekcijas,
- kitą kliniškai svarbią foninę informaciją.

Šie duomenys suteikia kontekstinę informaciją radiologiniam interpretavimui, bet **nereiškia diagnostinių išvadų**.

FHIR modelyje šie elementai paprastai pateikiami kaip struktūrizuoti **Observation** ištekliai, susieti su atrankos vizitu. Prieš tyrimą surinkti duomenys fiksuojami naudojant [Prieš LDCT pildomą anketą](Questionnaire-questionnaire-pre-ldct-lt-lung.html), kuri susieta su profiliais iš [Gyvybinių rodiklių diegimo vadovo](https://build.fhir.org/ig/HL7LT/ig-lt-vitalsigns/) (ūgis, svoris) ir [Gyvensenos diegimo vadovo](https://build.fhir.org/ig/HL7LT/ig-lt-lifestyle/) (rūkymo statusas, tabako vartojimas, pakelio metai).

## LDCT vaizdinimo atlikimas

Tinkami dalyviai atlieka **mažos dozės krūtinės kompiuterinės tomografijos (LDCT) tyrimą**.

Vaizdinimo procedūrą atlieka radiologijos technologas, kai pacientas fiziškai dalyvauja vizito metu.

Šio žingsnio metu:

- atliekamas LDCT skenavimas,
- generuojami vaizdinimo duomenys,
- užrašomas atitinkamas procedūros kontekstas.

Vaizdinimo duomenų rinkinys pateikiamas naudojant **ImagingStudy** išteklių, o atlikta vaizdinimo procedūra gali būti pateikta naudojant **Procedure** išteklių.

Šiame etape vaizdinimo duomenys yra **vien techniniai įgijimo rezultatai** ir dar neapima diagnostinės interpretacijos.

## Techniniai parametrai ir spinduliuotės dozės dokumentavimas

Be paties vaizdinimo, užrašomi su tyrimu susiję techniniai metaduomenys.

Tai apima:

- vaizdinimo įrenginio informaciją,
- tyrimo datą ir vietą,
- spinduliuotės dozės parametrus, tokius kaip **CTDIvol** ir **dozės ilgio sandauga (DLP)**.

Šios informacijos užrašymas palaiko:

- spinduliuotės saugos stebėseną,
- atrankos procedūrų kokybės užtikrinimą,
- pakartotinių tyrimų longitudinį palyginimą.

Spinduliuotės dozės stebėjimai nurodomi iš [LungCompositionLtLung](StructureDefinition-lung-composition-lt-lung.html) radinių skyriaus ir remiasi ES Vaizdinimo spinduliuotės dozės stebėjimo profiliu.

## Radiologinis interpretavimas ir ataskaitų teikimas

Po vaizdo įgijimo LDCT tyrimus interpretuoja radiologas.

Radiologas įvertina vaizdus ir struktūrizuotai dokumentuoja radinius. Šie radiniai gali apimti:

- plaučių mazgelius,
- įtartinus židininius plaučių pažeidimus,
- emfizemą ar kitus plaučių sutrikimus,
- kliniškai reikšmingus atsitiktinius radinius kitose krūtinės ar viršutinės pilvo srities struktūrose.

Atskiri radiniai pateikiami kaip struktūrizuoti **Observation** ištekliai, aprašantys pažeidimo charakteristikas, tokias kaip:

- anatominė vieta,
- morfologija,
- dydis arba tūris,
- raida palyginus su ankstesniais tyrimais.

Interpretacijos rezultatai apjungiami į struktūrizuotą **diagnostinę vaizdinimo ataskaitą**, atvaizduojamą kaip [LungReportLtLung](StructureDefinition-lung-report-lt-lung.html) (DiagnosticReport) išteklis, kuris apgaubia [LungCompositionLtLung](StructureDefinition-lung-composition-lt-lung.html) (Composition) ir sujungia visus struktūrizuotus radinius.

Atskiri radiniai fiksuojami naudojant specializuotus stebėjimo profilius:

- [PulmonaryNoduleObservationLtLung](StructureDefinition-pulmonary-nodule-observation-lt-lung.html) — plaučių mazgeliai su tipu, vieta, morfologija ir matavimais,
- [IncidentalFindingLtLung](StructureDefinition-incidental-finding-lt-lung.html) — bendri atsitiktiniai radiniai su sunkumo, šono, tankio ir kiekio komponentais,
- [MediastinalMassLtLung](StructureDefinition-mediastinal-mass-lt-lung.html) — tarpuplaučio masės su dydžiu, pakitusiu tankiu ir kalcifikacija,
- [KidneyLesionLtLung](StructureDefinition-kidney-lesion-lt-lung.html) — inkstų pažeidimai su kūno vieta, tankiu ir didžiausiu matmeniu,
- [AdrenalLesionLtLung](StructureDefinition-adrenal-lesion-lt-lung.html) — antinksčių pažeidimai su šonu, dydžiu ir tankiu Hounsfildo vienetais (HV).

Konkretūs atsitiktiniai radiniai, kai tinkama, turi struktūrizuotą interpretaciją. Pavyzdžiui, plaučių konsolidacijos radinius galima toliau klasifikuoti naudojant `consolidationInterpretation` komponentą (uždegiminis ar neoplazinis), taip vengiant priklausomybės nuo laisvo teksto pastabų kliniškai reikšmingoms potipių skirtybėms.

LDCT ataskaitos duomenys fiksuojami [LDCT anketoje](Questionnaire-questionnaire-ldct-lt-lung.html).

## Rizikos stratifikacija ir LUNG-RADS vertinimas

Centrinis darbo eigos žingsnis — vaizdinimo radinių klasifikavimas pagal **LUNG-RADS vertinimo sistemą**.

LUNG-RADS kategorijos suteikia standartizuotą atrankos radinių interpretaciją ir nustato rekomenduojamą kitą klinikinio kelio žingsnį.

Lietuvos programoje rezultatai apima:

- **0 kategorija** → vaizdai negali būti įvertinti; palyginimas su ankstesniu KT arba pakartotinis LDCT po 1 mėnesio,
- **1 kategorija** → radinių nėra; pakartotinis LDCT po 36 mėnesių,
- **2 kategorija** → labai tikėtina, kad gerybinis; pakartotinis LDCT po 12–36 mėnesių (radiologas pasirenka),
- **3 kategorija** → tikriausiai gerybinis; tolesnis LDCT po 6 mėnesių,
- **4A kategorija** → įtartinas; tolesnis LDCT po 3 mėnesių,
- **4B kategorija** → labai įtartinas; siuntimas į onkologinį klasterį pulmonologo konsultacijai,
- **4X kategorija** → ypač įtartinas; siuntimas į onkologinį klasterį pulmonologo konsultacijai,
- **S modifikatorius** → reikšmingas atsitiktinis radinys; siuntimas atitinkamam specialistui priklausomai nuo radinio.

FHIR modelyje LUNG-RADS kategorija pateikiama kaip [LungRadsAssessmentLtLung](StructureDefinition-lung-rads-assessment-lt-lung.html) Observation, o gauta rekomendacija išreiškiama kaip [LungRecommendationObservationLtLung](StructureDefinition-lung-recommendation-observation-lt-lung.html) Observation, susieta su vertinimu.

## Tolesnė priežiūra ir priežiūros tęstinumas

Pagal radiologinį vertinimą ir rekomendacijas inicijuojami atitinkami tolesni veiksmai.

Tai gali apimti:

- pakartotinio LDCT tyrimo paskyrimą nustatytu intervalu,
- siuntimą į pulmonologiją, onkologiją ar krūtinės chirurgiją,
- papildomus diagnostinius vaizdinimo tyrimus,
- kliniškai reikšmingų atsitiktinių radinių vertinimą.

Plaučių vėžio atrankos programa yra iš esmės **longitudinė** — asmenys gali dalyvauti keliuose atrankos cikluose per laiką.

Todėl duomenų modelis palaiko:

- palyginimą su ankstesniais vaizdinimo tyrimais per `Composition.relatesTo` nuorodas į ankstesnes LDCT ataskaitas,
- pažeidimų raidos sekimą,
- struktūrizuotą tolesnės priežiūros planavimą.

## Pagrindiniai darbo eigos modeliavimo principai

Plaučių vėžio atrankos modelis remiasi keliais pagrindiniais modeliavimo principais:

- **Duomenų įgijimo ir interpretacijos atskyrimas**  
  Vaizdinimo įgijimas, radiologiniai radiniai ir diagnostinės išvados pateikiamos kaip atskiri informacijos sluoksniai.

- **Aiškus židininių radinių pateikimas**  
  Plaučių mazgeliai ir kiti įtartini pažeidimai fiksuojami kaip struktūrizuoti stebėjimai, kuriuos galima palyginti tarp tyrimų.

- **Radinių ir sprendimų logikos atskyrimas**  
  Stebėjimai aprašo, kas matoma vaizduose, o tolesnės priežiūros rekomendacijos atspindi iš tų stebėjimų išvedamus darbo eigos sprendimus.

- **Longitudinių atrankos ciklų palaikymas**  
  Modelis sudaro sąlygas pakartotiniams atrankos tyrimams ir radinių palyginimui per laiką.

Ši darbo eigos reprezentacija atspindi realią klinikinę praktiką ir kartu palaiko **standartizuotą duomenų mainą, programos stebėseną ir longitudinę pacientų priežiūrą** nacionalinėje plaučių vėžio ankstyvo diagnozavimo programoje.
