Invariant:      ihris-age-18
Description:    "birthDate must be more than 18 years ago."
Expression:     "birthDate < today() - 18 years"
Severity:       #error

Profile:        IhrisPersonalInformation
Parent:         Practitioner
Id:             ihris-personal-information
Title:          "Health Worker Information"
Description:    "iHRIS profile of Practitioner."

* identifier 1..1 MS
* identifier ^label = "National Identification Number"
* identifier ^constraint[0].key = "ihris-search-identifier"
* identifier ^constraint[0].severity = #error
* identifier ^constraint[0].expression = "'Practitioner' | 'identifier' | iif(system.exists(), system & '|' & value, value)"
* identifier ^constraint[0].human = "The identifier must be unique and another record has this identifier"
/* identifier.use 0..0
* identifier.system MS
* identifier.system ^label = "System"
*/
* identifier.value MS
* identifier.value ^label = "Identification Number"

* identifier.type MS
* identifier.type ^label = "Type"
* identifier.type.coding 1..1 MS
* identifier.type.coding ^label = "Type"


* name 1..1 MS
* name ^label = "Names"
/*
* name.use MS
* name.use ^label = "Use"
*/
* name.family 1..1 MS
* name.family ^label = "First Name"
* name.given 1..1 MS
* name.given ^label = "Last Name"
* name.given ^constraint[0].key = "ihris-name-check"
* name.given ^constraint[0].severity = #error
* name.given ^constraint[0].expression = "matches('^[A-Za-z ]*$')"
* name.given ^constraint[0].human = "First Name must be only text."
* name.text 0..1 MS
* name.text ^label = "Middle Name"
/* name.prefix 0..0
* name.text 0..0
*/
* gender 1..1 MS
* gender ^label = "Gender"
* birthDate MS
* birthDate ^label = "Birth Date"
* birthDate obeys ihris-age-18
* birthDate ^minValueQuantity.system = "http://unitsofmeasure.org/"
* birthDate ^minValueQuantity.code = #a
* birthDate ^minValueQuantity.value = 100
* birthDate ^maxValueQuantity.system = "http://unitsofmeasure.org/"
* birthDate ^maxValueQuantity.code = #a
* birthDate ^maxValueQuantity.value = -18
* extension contains IhrisPractitionerNationality named nationality 0..1 MS
* extension[nationality].valueCoding  MS
* extension[nationality].valueCoding ^label = "Nationality"

* extension contains IhrisPractitionerUid named uid 0..1 MS
* extension[uid].valueString  MS
* extension[uid].valueString ^label = "UID"

Extension:      IhrisPractitionerNationality
Id:             ihris-practitioner-nationality
Title:          "iHRIS Practitioner Nationality"
Description:    "iHRIS extension for Practitioner nationality."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Nationality"
* valueCoding from http://hl7.org/fhir/ValueSet/iso3166-1-2 (required)

Extension:      IhrisPractitionerUid
Id:             ihris-practitioner-uid
Title:          "iHRIS Practitioner UID"
Description:    "iHRIS extension for Practitioner UID."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "UID"


Instance:       IhrisPractitionerERHITESQuestionnaire
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Practitioner Questionnaire"
* description = "iHRIS Practitioner initial data entry questionnaire."
* id = "ihris-personal-information"
* url = "http://ihris.org/fhir/Questionnaire/ihris-personal-information"
* name = "ihris-personal-information"
* status = #active
* date = 2020-06-29
* purpose = "Data entry page for practitioners."

* item[0].linkId = "Practitioner"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information"
* item[0].text = "Basic Information|Basic health worker details"
* item[0].type = #group

* item[0].item[0].linkId = "Practitioner.name[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.name"
* item[0].item[0].text = "Name"
* item[0].item[0].type = #group



* item[0].item[0].item[1].linkId = "Practitioner.name.given"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.name.given"
* item[0].item[0].item[1].text = "Last Name"
* item[0].item[0].item[1].type = #string
* item[0].item[0].item[1].required = true
* item[0].item[0].item[1].repeats = false
* item[0].item[0].item[1].extension[constraint].extension[key].valueId = "ihris-given-name-check"
* item[0].item[0].item[1].extension[constraint].extension[severity].valueCode = #error
* item[0].item[0].item[1].extension[constraint].extension[expression].valueString = "matches('^[A-Za-z ]*$')"
* item[0].item[0].item[1].extension[constraint].extension[human].valueString = "Last Name must be only text."

* item[0].item[0].item[2].linkId = "Practitioner.name.family"
* item[0].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.name.family"
* item[0].item[0].item[2].text = "First Name"
* item[0].item[0].item[2].type = #string
* item[0].item[0].item[2].required = true
* item[0].item[0].item[2].repeats = false
* item[0].item[0].item[2].extension[constraint].extension[key].valueId = "ihris-surname-check"
* item[0].item[0].item[2].extension[constraint].extension[severity].valueCode = #error
* item[0].item[0].item[2].extension[constraint].extension[expression].valueString = "matches('^[A-Za-z ]*$')"
* item[0].item[0].item[2].extension[constraint].extension[human].valueString = "First Name must be only text."

* item[0].item[0].item[3].linkId = "Practitioner.name.text"
* item[0].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.name.text"
* item[0].item[0].item[3].text = "Middle Name"
* item[0].item[0].item[3].type = #string
* item[0].item[0].item[3].required = true
* item[0].item[0].item[3].repeats = false
* item[0].item[0].item[3].extension[constraint].extension[key].valueId = "ihris-surname-check"
* item[0].item[0].item[3].extension[constraint].extension[severity].valueCode = #error
* item[0].item[0].item[3].extension[constraint].extension[expression].valueString = "matches('^[A-Za-z ]*$')"
* item[0].item[0].item[3].extension[constraint].extension[human].valueString = "Middle Name must be only text."

* item[0].item[0].item[4].linkId = "Practitioner.extension[0]"
* item[0].item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:nationality.value[x]:valueCoding"
* item[0].item[0].item[4].text = "Nationality"
* item[0].item[0].item[4].type = #choice
* item[0].item[0].item[4].required = false
* item[0].item[0].item[4].repeats = false

* item[1].linkId = "Practitioner:demographic"
* item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information"
* item[1].text = "Demographic Information"
* item[1].type = #group


* item[1].item[1].linkId = "Practitioner.gender"
* item[1].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.gender"
* item[1].item[1].text = "Gender"
* item[1].item[1].type = #choice
* item[1].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-gender-valueset"
* item[1].item[1].required = true
* item[1].item[1].repeats = false

* item[1].item[2].linkId = "Practitioner.birthDate"
* item[1].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.birthDate"
* item[1].item[2].text = "Birthdate"
* item[1].item[2].type = #date
* item[1].item[2].required = true
* item[1].item[2].repeats = false


* item[2].linkId = "Practitioner:identifier"
* item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information"
* item[2].text = "Identifiers|Personal Identifiers"
* item[2].type = #group

* item[2].item[0].linkId = "Practitioner.identifier[0]"
* item[2].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier"
* item[2].item[0].text = "National Identification Number"
* item[2].item[0].type = #group


* item[2].item[0].item[1].linkId = "Practitioner.identifier[0].type"
* item[2].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.type"
* item[2].item[0].item[1].text = "ID Type"
* item[2].item[0].item[1].type = #choice
* item[2].item[0].item[1].answerValueSet = "http://hl7.org/fhir/ValueSet/identifier-type"
* item[2].item[0].item[1].repeats = false
* item[2].item[0].item[1].required = false

* item[2].item[0].item[2].linkId = "Practitioner.identifier[0].value"
* item[2].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-personal-information#Practitioner.identifier.value"
* item[2].item[0].item[2].text = "Value"
* item[2].item[0].item[2].type = #string
* item[2].item[0].item[2].required = false
* item[2].item[0].item[2].repeats = false
* item[2].item[0].item[2].extension[constraint].extension[key].valueId = "ihris-search-identifier"
* item[2].item[0].item[2].extension[constraint].extension[severity].valueCode = #error
* item[2].item[0].item[2].extension[constraint].extension[expression].valueString = "'Practitioner' | 'identifier' | iif(system.exists(), system & '|' & value, value)"
* item[2].item[0].item[2].extension[constraint].extension[human].valueString = "The identifier must be unique and another record has this identifier"


* item[2].item[0].item[3].linkId = "Practitioner.extension[0]" 
* item[2].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:uid:value[x]:valueString"
* item[2].item[0].item[3].text = "UID"
* item[2].item[0].item[3].type = #string
* item[2].item[0].item[3].required = false
* item[2].item[0].item[3].repeats = false
/*

* item[8].linkId = "PractitionerRole"
* item[8].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description"
* item[8].text = "Position Informatiom|Health worker position informatiom"
* item[8].type = #group
* item[8].extension[constraint][0].extension[key].valueId = "ihris-start-end-date"
* item[8].extension[constraint][0].extension[severity].valueCode = #error
* item[8].extension[constraint][0].extension[expression].valueString = "where(linkId='PractitionerRole.period.end').answer.first().valueDateTime.empty() or where(linkId='PractitionerRole.period.end').answer.first().valueDateTime > where(linkId='PractitionerRole.period.start').answer.first().valueDateTime"
* item[8].extension[constraint][0].extension[human].valueString = "The end date must be after the start date."
* item[8].extension[constraint][1].extension[key].valueId = "ihris-first-emp-date"
* item[8].extension[constraint][1].extension[severity].valueCode = #error
* item[8].extension[constraint][1].extension[expression].valueString = "where(linkId='PractitionerRole.extension[3]').answer.first().valueDate <= where(linkId='PractitionerRole.period.start').answer.first().valueDateTime"
* item[8].extension[constraint][1].extension[human].valueString = "The First Appointment Date must be before or Equal to the start date."



* item[8].item[1].linkId = "PractitionerRole.extension[0]"
* item[8].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:cadre.value[x]:valueCoding"
* item[8].item[1].text = "Employment title (Cadre)"
* item[8].item[1].type = #choice
* item[8].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-employment-ValueSet"
* item[8].item[1].repeats = false

* item[8].item[2].linkId = "PractitionerRole.extension[0]"
* item[8].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:MERcategory.value[x]:valueCoding"
* item[8].item[2].text = "MER Category"
* item[8].item[2].type = #choice
* item[8].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-mer-category-ValueSet"
* item[8].item[2].repeats = false

* item[8].item[3].linkId = "PractitionerRole.location"
* item[8].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.location"
* item[8].item[3].type = #reference
* item[8].item[3].required = false
* item[8].item[3].repeats = false

* item[8].item[4].linkId = "PractitionerRole.extension[0]"
* item[8].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:snu.value[x]:valueCoding"
* item[8].item[4].text = "SNU/Region"
* item[8].item[4].type = #choice
* item[8].item[4].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-snu-ValueSet"
* item[8].item[4].repeats = false

* item[8].item[5].linkId = "PractitionerRole.extension[0]"
* item[8].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:psnu.value[x]:valueCoding"
* item[8].item[5].text = "PSNU/District"
* item[8].item[5].type = #choice
* item[8].item[5].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-psnu-ValueSet"
* item[8].item[5].repeats = false

* item[8].item[6].linkId = "PractitionerRole.extension[0]"
* item[8].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:progarea.value[x]:valueCoding"
* item[8].item[6].text = "PEPFAR Program Area"
* item[8].item[6].type = #choice
* item[8].item[6].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-prog-area-ValueSet"
* item[8].item[6].repeats = false

* item[8].item[7].linkId = "PractitionerRole.extension[0]"
* item[8].item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:primaryFunction.value[x]:valueString"
* item[8].item[7].text = "Primary Function"
* item[8].item[7].type = #text
* item[8].item[7].required = true
* item[8].item[7].repeats = false

* item[8].item[8].linkId = "PractitionerRole.extension[0]"
* item[8].item[8].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:serviceDelivery.value[x]:valueCoding"
* item[8].item[8].text = "Service Delivery Type"
* item[8].item[8].type = #choice
* item[8].item[8].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-service-delivery-ValueSet"
* item[8].item[8].repeats = false

* item[8].item[9].linkId = "PractitionerRole.extension[0]"
* item[8].item[9].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:monthNum.value[x]:valuePositiveInt"
* item[8].item[9].text = "How many months in the current financial Year?"
* item[8].item[9].type = #integer
* item[8].item[9].required = true
* item[8].item[9].repeats = false

* item[8].item[10].linkId = "PractitionerRole.extension[0]"
* item[8].item[10].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:employmentStatus.value[x]:valueCoding"
* item[8].item[10].text = "PEPFAR Employment Status"
* item[8].item[10].type = #choice
* item[8].item[10].answerValueSet = "http://ihris.org/fhir/ValueSet/ValueSet/ihris-employment-status-ValueSet"
* item[8].item[10].required = false
* item[8].item[10].repeats = false

* item[8].item[11].linkId = "PractitionerRole.extension[0]"
* item[8].item[11].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:rcvSalary.value[x]:valueBoolean"
* item[8].item[11].text = "Does the staff receive salary?"
* item[8].item[11].type = #boolean
* item[8].item[11].required = true
* item[8].item[11].repeats = false

* item[8].item[12].linkId = "PractitionerRole.extension[0]"
* item[8].item[12].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:weekPercent.value[x]:valuePositiveInt"
* item[8].item[12].text = "Percent of Full-Time work week spent on HIV"
* item[8].item[12].type = #integer
* item[8].item[12].required = false
* item[8].item[12].repeats = false

* item[8].item[14].linkId = "PractitionerRole.extension[0]"
* item[8].item[14].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:annFringe.value[x]:valuePositiveInt"
* item[8].item[14].text = "If Known, Please Indicate Amount of Fringe Benefit"
* item[8].item[14].type = #integer
* item[8].item[14].required = false
* item[8].item[14].repeats = false

* item[8].item[15].linkId = "PractitionerRole.extension[0]"
* item[8].item[15].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:payMechanism.value[x]:valueCoding"
* item[8].item[15].text = "Pay Mechanism"
* item[8].item[15].type = #choice
* item[8].item[15].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-pay-mechanism-ValueSet"
* item[8].item[15].repeats = false


* item[8].item[17].linkId = "PractitionerRole.extension[0]"
* item[8].item[17].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:annSalary.value[x]:valuePositiveInt"
* item[8].item[17].text = "Amount of Annual Salary Compensation From PEPFAR"
* item[8].item[17].type = #integer
* item[8].item[17].required = false
* item[8].item[17].repeats = false

* item[8].item[18].linkId = "PractitionerRole.extension[0]"
* item[8].item[18].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:annStipend.value[x]:valuePositiveInt"
* item[8].item[18].text = "Amount of Annual Stipend, Allowance or Honoraium Compensation"
* item[8].item[18].type = #integer
* item[8].item[18].required = false
* item[8].item[18].repeats = false

* item[8].item[19].linkId = "PractitionerRole.extension[0]"
* item[8].item[19].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:annNonMonetary.value[x]:valuePositiveInt"
* item[8].item[19].text = "Amount of Annual Non-Monetary Compensation"
* item[8].item[19].type = #integer
* item[8].item[19].required = false
* item[8].item[19].repeats = false

* item[8].item[20].linkId = "PractitionerRole.extension[0]"
* item[8].item[20].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:totalAnnual.value[x]:valuePositiveInt"
* item[8].item[20].text = "What is the Total Annual PEPFAR Budgeted Compensation for This Position"
* item[8].item[20].type = #integer
* item[8].item[20].required = false
* item[8].item[20].repeats = false

* item[8].item[21].linkId = "PractitionerRole.extension[0]"
* item[8].item[21].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:totalExpenditure.value[x]:valuePositiveInt"
* item[8].item[21].text = "What is the Total Expenditure for this Position in the current FY"
* item[8].item[21].type = #integer
* item[8].item[21].required = false
* item[8].item[21].repeats = false

* item[8].item[22].linkId = "PractitionerRole.extension[0]"
* item[8].item[22].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:includeFringe.value[x]:valueBoolean"
* item[8].item[22].text = "Indicate if Reported Compensation Includes Fringe Benefits"
* item[8].item[22].type = #boolean
* item[8].item[22].required = false
* item[8].item[22].repeats = false

* item[8].item[23].linkId = "PractitionerRole.extension[0]"
* item[8].item[23].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:rcvCompensation.value[x]:valueBoolean"
* item[8].item[23].text = "Does the Staff Member Receive  Compensation from other USG Sources?"
* item[8].item[23].type = #boolean
* item[8].item[23].required = false
* item[8].item[23].repeats = false

* item[8].item[24].linkId = "PractitionerRole.extension[0]"
* item[8].item[24].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:rcvMonetaryComp.value[x]:valueBoolean"
* item[8].item[24].text = "Does Staff Member Receive Monetary Compensation from Non-USG Sources?"
* item[8].item[24].type = #boolean
* item[8].item[24].required = false
* item[8].item[24].repeats = false

* item[8].item[25].linkId = "PractitionerRole.extension[0]"
* item[8].item[25].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:sourceCompensation.value[x]:valueString"
* item[8].item[25].text = "Please indicate source of non-USG compensation"
* item[8].item[25].type = #string
* item[8].item[25].required = false
* item[8].item[25].repeats = false

* item[8].item[26].linkId = "PractitionerRole.extension[0]"
* item[8].item[26].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:comment.value[x]:valueString"
* item[8].item[26].text = "Notes/Comments"
* item[8].item[26].type = #text
* item[8].item[26].required = false
* item[8].item[26].repeats = false

/*

* item[8].item[2].linkId = "PractitionerRole.extension[0]"
* item[8].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:employmentStatus.value[x]:valueCoding"
* item[8].item[2].text = "Employment Status"
* item[8].item[2].type = #choice
* item[8].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-employment-status-valueset"
* item[8].item[2].required = true
* item[8].item[2].repeats = false

* item[8].item[3].linkId = "PractitionerRole.extension[1]"
* item[8].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:jobType.value[x]:valueCoding"
* item[8].item[3].text = "Job Type"
* item[8].item[3].type = #choice
* item[8].item[3].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-job-type-valueset"
* item[8].item[3].required = true
* item[8].item[3].repeats = false

* item[8].item[4].linkId = "PractitionerRole.extension[2]"
* item[8].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:firstEmploymentDate.value[x]:valueDate"
* item[8].item[4].text = "First Employment Date"
* item[8].item[4].type = #date
* item[8].item[4].required = true
* item[8].item[4].repeats = false

* item[8].item[5].linkId = "PractitionerRole.period.start"
* item[8].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.period.start"
* item[8].item[5].text = "Hire Date"
* item[8].item[5].type = #dateTime
* item[8].item[5].required = true
* item[8].item[5].repeats = false
* item[8].item[5].extension[constraint].extension[key].valueId = "ihris-date-lessthantoday-check"
* item[8].item[5].extension[constraint].extension[severity].valueCode = #error
* item[8].item[5].extension[constraint].extension[expression].valueString = "$this < today() + 1 day"
* item[8].item[5].extension[constraint].extension[human].valueString = "Hire Date must not be in the future."

* item[8].item[6].linkId = "PractitionerRole.period.end"
* item[8].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.period.end"
* item[8].item[6].text = "End Date"
* item[8].item[6].type = #dateTime
* item[8].item[6].required = false
* item[8].item[6].repeats = false

* item[8].item[7].linkId = "PractitionerRole.extension[3]"
* item[8].item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.extension:jobInformationRemark.value[x]:valueString"
* item[8].item[7].text = "Remark"
* item[8].item[7].type = #text
* item[8].item[7].required = false
* item[8].item[7].repeats = false

*/


/*
* item[8].item[9].linkId = "PractitionerRole.practitioner"
* item[8].item[9].definition = "http://ihris.org/fhir/StructureDefinition/ihris-job-description#PractitionerRole.practitioner"
* item[8].item[9].text = "Practitioner"
* item[8].item[9].type = #string
* item[8].item[9].required = true
* item[8].item[9].repeats = false
* item[8].item[9].readOnly = true
* item[8].item[9].answerOption.valueString = "__REPLACE__Practitioner"
* item[8].item[9].answerOption.initialSelected = true

*/