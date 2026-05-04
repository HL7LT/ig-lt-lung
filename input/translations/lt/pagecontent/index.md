# Lietuvos plaučių vėžio ankstyvo diagnozavimo diegimo vadovas

## Įvadas ir tikslas

Šis diegimo vadovas nurodo, kaip nuosekliai pateikti ir keistis struktūrizuotais klinikiniais duomenimis, susijusiais su **Lietuvos plaučių vėžio ankstyvo diagnozavimo programa**, naudojant **HL7® FHIR® standartą**.

Vadovas palaiko nacionalinę programą, skirtą **piktybinių bronchų ir plaučių navikų ankstyvam aptikimui**, daugiausia dėmesio skiriant **mažos dozės krūtinės kompiuterinei tomografijai (LDCT)** ir struktūrizuotam kliniškai reikšmingų radinių, rekomendacijų ir prieš tyrimą surinktos rizikos informacijos užfiksavimui.

Jo tikslas – sudaryti sąlygas:

* nuosekliam ir aukštos kokybės duomenų rinkimui visoje sveikatos priežiūros sistemoje,
* semantiniam sąveikumui tarp **atrankos, radiologijos, siuntimo ir stebėsenos sistemų**,
* struktūrizuotam ataskaitų teikimui, skirtam **programos koordinavimui, kokybės užtikrinimui, stebėsenai ir antriniam naudojimui**,
* patikimam ilgalaikiam dalyvių stebėjimui per pasikartojančius atrankos ir priežiūros ciklus.

Vadovas parengtas kaip nacionalinio **ADP projekto** dalis, siekiant palaikyti koordinuotą, duomenimis grindžiamą Lietuvos prevencinių ir ankstyvo diagnozavimo programų valdymą.

## Apimtis

Šis vadovas konkrečiai orientuotas į **plaučių vėžio ankstyvo diagnozavimo darbo eigą**, kurios pagrindas yra **mažos dozės krūtinės kompiuterinė tomografija (LDCT)** ir struktūrizuotas duomenų, reikalingų prieš vaizdinimo tyrimą, jo metu ir po jo, rinkimas.

Jis apima šias klinikines sritis:

* **Prieš tyrimą pildomos anketos duomenys**, įskaitant funkcinę būklę, rūkymo istoriją, antropometrinius duomenis, neseniai persirgtas kvėpavimo takų infekcijas ir ankstesnių krūtinės KT tyrimų istoriją,
* **LDCT vaizdinimo įgijimo metaduomenys**, įskaitant spinduliuotės dozės informaciją ir tyrimo kontekstą,
* **Struktūrizuotas plaučių mazgelių ir kitų įtartinų židininių radinių užrašymas**,
* **Radinių klasifikacija ir programos rekomendacijos**,
* **Struktūrizuotas reikšmingų atsitiktinių radinių užfiksavimas** krūtinės ir viršutinės pilvo srities anatominėse vietose,
* **Pasikartojančio vaizdinimo ir ilgalaikės stebėsenos palaikymas**.

Vadovas modeliuoja plaučių vėžio ankstyvą diagnostiką kaip **vaizdinimu grindžiamą, rizika informuotą, longitudinę darbo eigą**, kurioje pagrindinis diagnostinis sprendimo taškas yra LDCT radinių interpretavimas ir atitinkama rekomendacija — dėl pakartotinės atrankos, trumpalaikės stebėsenos ar siuntimo specialistui.

## Pagrindiniai modeliavimo principai

Modeliavimo požiūris remiasi šiais pagrindiniais principais:

1. **Anketos duomenų, vaizdinimo atlikimo ir radiologinio interpretavimo atskyrimas**  
   Prieš tyrimą surinkta rizikos ir tinkamumo informacija, techniniai vaizdinimo duomenys ir radiologinės išvados pateikiami kaip atskiros, bet susietos darbo eigos dalys.

2. **Aiškus židininių plaučių radinių pateikimas**  
   Plaučių mazgeliai ir kiti įtartini pažeidimai modeliuojami struktūrizuotai, įskaitant tipą, vietą, morfologiją, dydį ir tūrį, kad juos būtų galima palyginti tarp pasikartojančių tyrimų.

3. **Kliniškai reikšmingų atsitiktinių radinių palaikymas**  
   Vadovas skirtas ne tik įtariamoms plaučių piktybinėms ligoms. Jis taip pat palaiko struktūrizuotą svarbių atsitiktinių radinių užrašymą plaučiuose, tarpuplautyje, širdies ir kraujagyslių struktūrose, krūtyse, kepenyse, inkstuose, kauluose, antinksčiuose ir kitose matomose anatominėse srityse, kai tokie radiniai reikalauja tolesnių veiksmų.

4. **Radinių atskyrimas nuo rekomendacijos logikos**  
   Stebėjimai aprašo, kas matoma vaizduose, o išvada ir rekomendacija atspindi kitą klinikinį žingsnį programoje, pvz., įprastinį pakvietimą, ankstesnę stebėsenos vaizdinimo procedūrą ar siuntimą specialisto konsultacijai.

5. **Longitudinis palyginamumas**  
   Duomenų modelis palaiko pakartotinius LDCT tyrimus per laiką, įskaitant palyginimą su ankstesniais tyrimais ir pažeidimų raidos sekimą, kuris yra esminis ankstyvo plaučių vėžio aptikimo programose.

6. **Terminologija pagrįstas sąveikumas**  
   Vadovas skirtas naudoti tarptautiniu mastu pripažintas terminologijas ir klasifikatorius, ypač **SNOMED CT**, taip pat, kai aktualu, **LOINC, TLK-10-AM ir nacionalinius klasifikatorius**, siekiant užtikrinti semantinį nuoseklumą tarp sistemų.

## Vadovo turinys

Šiame vadove pateikiama:

* **FHIR profiliai ir plėtiniai**, skirti plaučių vėžio ankstyvo diagnozavimo darbo eigai,
* struktūrizuota **prieš LDCT pildomos anketos** reprezentacija,
* struktūrizuotas **LDCT tyrimo metaduomenų ir radinių** modeliavimas,
* **plaučių radinių kategorijų ir rekomendacijų kelių** palaikymas,
* terminologijos sąsajos naudojant **SNOMED CT** ir kitas reikšmingas kodavimo sistemas,
* struktūrizuoti **pavyzdiniai egzemplioriai**, iliustruojantys realius programos scenarijus,
* nacionalinio klinikinio duomenų rinkinio sąsajos su sąveikiais FHIR artefaktais,
* spragų ir būsimo plėtojimo poreikių nustatymas.

Šiame etape vadovas orientuotas į **pagrindines duomenų struktūras LDCT pagrindu vykdomam ankstyvam diagnozavimui**, ypač anketos ir radiologinių ataskaitų duomenų rinkinį. Tolesnis tobulinimas, terminologijos plėtimas, darbo eigos derinimas ir klinikinis validavimas bus atliekamas kitose iteracijose.

## Kodėl naudoti šį vadovą?

Priimdami šį vadovą, diegėjai ir sveikatos priežiūros įstaigos gali:

1. **Sąveikumas:** užtikrinti nuoseklius ir palyginamus plaučių vėžio ankstyvo diagnozavimo duomenis tarp sistemų ir paslaugų teikėjų.
2. **Duomenų kokybė:** pagerinti anketos, vaizdinimo ir radiologinių duomenų nuoseklumą, išsamumą ir pakartotinį naudojimą.
3. **Klinikinis naudingumas:** palaikyti struktūrizuotą ataskaitų teikimą, stebėsenos planavimą, siuntimo sprendimus ir kokybės užtikrinimą.
4. **Programos stebėsena:** sudaryti sąlygas populiacijos lygio dalyvavimo, radinių, rekomendacijų ir diagnostikos kelių analizei.
5. **Longitudinė priežiūra:** palaikyti tolesnę priežiūrą per pasikartojančius LDCT tyrimus ir vėlesnius klinikinius veiksmus.

Naršykite žemiau esančias dalis, kad pasiektumėte profilius, terminologijos sąsajas ir išsamius pavyzdžius, reikalingus standartui įdiegti.

### Bendraautoriai

| Vardas, pavardė                                          | Vaidmuo            | Organizacija                                |
| -------------------------------------------------------- | ------------------ | ------------------------------------------- |
| [Kati Laidus](https://www.linkedin.com/in/kati-laidus/)  | Pagrindinė autorė  | [HELEX Solutions](https://helex.solutions) |
| [Igor Bossenko](https://about.askigor.eu)                | Pagrindinis autorius | [HELEX Solutions](https://helex.solutions) |
| Martynas Bieliauskas                                     | Bendraautorius      | [LMB](https://lmb.lt)                      |
