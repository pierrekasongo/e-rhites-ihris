Profile:        IhrisPage
Parent:         Basic
Id:             ihris-page
Title:          "iHRIS Page"
Description:    "iHRIS Profile of the Basic resource to manage pages."
* code = IhrisResourceCodeSystem#page
* extension contains
      IhrisPageDisplay named display 1..1 MS and
      IhrisPageSection named section 0..* MS

Extension:      IhrisPageDisplay
Id:             ihris-page-display
Title:          "iHRIS Page Display"
Description:    "iHRIS Page Display details."
* ^context.type = #element
* ^context.expression = "IhrisPage"
* extension contains
      resource 1..1 MS and
      search 1..* MS and
      filter 0..* MS and
      add 0..1 MS and
      field 0..* MS and
      link 0..* MS
* extension[resource].value[x] only Reference
* extension[resource].valueReference only Reference(StructureDefinition or CodeSystem)
* extension[resource].valueReference 1..1 MS
* extension[resource].valueReference ^label = "Primary Resource"

* extension[search].value[x] only string
* extension[search].valueString 1..1 MS
* extension[search].valueString ^label = "Search Headers"

* extension[filter].value[x] only string
* extension[filter].valueString 1..1 MS
* extension[filter].valueString ^label = "Search Filters"

* extension[add].extension contains
      url 1..1 MS and
      icon 0..1 MS and
      class 0..1 MS
* extension[add].extension[url].value[x] only url
* extension[add].extension[url].valueUrl MS
* extension[add].extension[url].valueUrl ^label = "Add Link URL"
* extension[add].extension[icon].value[x] only string
* extension[add].extension[icon].valueString MS
* extension[add].extension[icon].valueString ^label = "Add Link Icon"
* extension[add].extension[class].value[x] only string
* extension[add].extension[class].valueString MS
* extension[add].extension[class].valueString ^label = "Add Link Class"

* extension[link].extension contains
      field 0..1 MS and
      text 0..1 MS and
      button 0..1 MS and
      icon 0..1 MS and
      url 1..1 MS
* extension[link].extension[field].value[x] only string
* extension[link].extension[field].valueString MS
* extension[link].extension[field].valueString ^label = "FHIRPath for field in resource"
* extension[link].extension[text].value[x] only string
* extension[link].extension[text].valueString MS
* extension[link].extension[text].valueString ^label = "Text for link"
* extension[link].extension[button].value[x] only boolean
* extension[link].extension[button].valueBoolean MS
* extension[link].extension[button].valueBoolean ^label = "Display as button"
* extension[link].extension[icon].value[x] only string
* extension[link].extension[icon].valueString MS
* extension[link].extension[icon].valueString ^label = "Icon to display in button"
* extension[link].extension[url].value[x] only url
* extension[link].extension[url].valueUrl MS
* extension[link].extension[url].valueUrl ^label = "URL to go to"

* extension[field].extension contains
      path 1..1 MS and
      type 1..1 MS and
      readOnlyIfSet 0..1 MS
* extension[field].extension[path].value[x] only string
* extension[field].extension[path].valueString MS
* extension[field].extension[path].valueString ^label = "Field Path from StructureDefintion"
* extension[field].extension[type].value[x] only string
* extension[field].extension[type].valueString MS
* extension[field].extension[type].valueString ^label = "Display type for the field"
* extension[field].extension[readOnlyIfSet].value[x] only boolean
* extension[field].extension[readOnlyIfSet].valueBoolean MS
* extension[field].extension[readOnlyIfSet].valueBoolean ^label = "Read Only if the value is set"

Extension:      IhrisPageSection
Id:             ihris-page-section
Title:          "iHRIS Page Section"
Description:    "iHRIS Page Section information."
* ^context.type = #element
* ^context.expression = "IhrisPage"
* extension contains
      title 1..1 MS and
      description 1..1 MS and
      name 1..1 MS and
      field 0..* MS and
      resource 0..1 MS
* extension[title].value[x] only string
* extension[title].valueString MS
* extension[title].valueString ^label = "Title"
* extension[description].value[x] only string
* extension[description].valueString 1..1 MS
* extension[description].valueString ^label = "Description"
* extension[name].value[x] only string
* extension[name].valueString 1..1 MS
* extension[name].valueString ^label = "Name"
* extension[field].value[x] only string
* extension[field].valueString 1..1 MS
* extension[field].valueString ^label = "Field"
* extension[resource].extension contains
      resource 1..1 MS and
      linkfield 1..1 MS and
      searchfield 0..1 MS and
      column 1..* MS and
      action 0..* MS
* extension[resource].extension[resource].value[x] only Reference
* extension[resource].extension[resource].valueReference only Reference(StructureDefinition)
* extension[resource].extension[resource].valueReference MS
* extension[resource].extension[resource].valueReference ^label = "Secondary Resource"
* extension[resource].extension[linkfield].value[x] only string
* extension[resource].extension[linkfield].valueString MS
* extension[resource].extension[linkfield].valueString ^label = "Secondary Resource Link Field"
* extension[resource].extension[searchfield].value[x] only string
* extension[resource].extension[searchfield].valueString MS
* extension[resource].extension[searchfield].valueString ^label = "Secondary Resource Search Field (if different from the link field)"
* extension[resource].extension[column].extension contains
      header 1..1 MS and
      field 1..1 MS
* extension[resource].extension[column].extension[header].value[x] only string 
* extension[resource].extension[column].extension[header].valueString MS
* extension[resource].extension[column].extension[header].valueString ^label = "Column Header"
* extension[resource].extension[column].extension[field].value[x] only string 
* extension[resource].extension[column].extension[field].valueString MS
* extension[resource].extension[column].extension[field].valueString ^label = "FHIRPath Expression"
* extension[resource].extension[action].extension contains
      link 1..1 MS and
      text 1..1 MS and
      row 0..1 MS and
      condition 0..1 MS and
      emptyDisplay 0..1 MS and
      class 0..1 MS 
* extension[resource].extension[action].extension[link].value[x] only string
* extension[resource].extension[action].extension[link].valueString MS
* extension[resource].extension[action].extension[link].valueString ^label = "Action Link"
* extension[resource].extension[action].extension[text].value[x] only string
* extension[resource].extension[action].extension[text].valueString MS
* extension[resource].extension[action].extension[text].valueString ^label = "Action Text"
* extension[resource].extension[action].extension[row].value[x] only boolean
* extension[resource].extension[action].extension[row].valueBoolean MS
* extension[resource].extension[action].extension[row].valueBoolean ^label = "Is Row Action?"
* extension[resource].extension[action].extension[condition].value[x] only string
* extension[resource].extension[action].extension[condition].valueString MS
* extension[resource].extension[action].extension[condition].valueString ^label = "FHIRPation Condition do Display"
* extension[resource].extension[action].extension[emptyDisplay].value[x] only boolean
* extension[resource].extension[action].extension[emptyDisplay].valueBoolean MS
* extension[resource].extension[action].extension[emptyDisplay].valueBoolean ^label = "Show when no records?"
* extension[resource].extension[action].extension[class].value[x] only string
* extension[resource].extension[action].extension[class].valueString MS
* extension[resource].extension[action].extension[class].valueString ^label = "Element Class for the Action"


Instance:       ihris-page-practitioner
InstanceOf:     IhrisPage
Title:          "iHRIS Practitioner Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-personal-information)
* extension[display].extension[search][0].valueString = "First Name|Practitioner.name.given"
* extension[display].extension[search][1].valueString = "Last Name|Practitioner.name.family"
* extension[display].extension[search][2].valueString = "National Identification Number|Practitioner.identifier.value"
* extension[display].extension[search][3].valueString = "Gender|Practitioner.gender|gender"
* extension[display].extension[search][4].valueString = "Birth date|Practitioner.birthDate|birthDate"
/*
* extension[display].extension[search][4].valueString = "Employment Title (Cadre)|Practitioner.PractitionerRole.extension.where(url='http://ihris.org/fhir/CodeSystem/ihris-employment').display"
* extension[display].extension[search][5].valueString = "MER Category|Practitioner.PractitionerRole.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-MERCategory-ext').display"
* extension[display].extension[search][6].valueString = "SNU1/Region|Practitioner.PractitionerRole.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-snu-ext').valueCoding.display"
* extension[display].extension[search][7].valueString = "PSNU/District|PractitionerRole.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-psnu-ext').valueCoding.display"
* extension[display].extension[search][8].valueString = "PSNU/District|PractitionerRole.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-progarea-ext').valueCoding.display"
/*
* extension[display].extension[search][3].valueString = "Father's Name|Practitioner.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-familynames').extension.where(url='fathers').valueString"
* extension[display].extension[search][4].valueString = "Grand Father'sName|Practitioner.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-familynames').extension.where(url='grandfatherslastname').valueString"
* extension[display].extension[search][5].valueString = "Mothers'sName|Practitioner.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-familynames').extension.where(url='mothers').valueString"
* extension[display].extension[search][6].valueString = "Birth Date|Practitioner.birthDate"
* extension[display].extension[search][7].valueString = "PIN ID|Practitioner.id"
*/

* extension[display].extension[filter][0].valueString = "First Name|Pratitioner.name.given:contains"
* extension[display].extension[filter][0].valueString = "Last Name|Practitioner.name.family:contains"
* extension[display].extension[filter][1].valueString = "Gender|Practitioner.gender:contains"
/*
* extension[display].extension[filter][1].valueString = "Father's Name|fathersname:contains"
* extension[display].extension[filter][2].valueString = "Grand Father's Name|grandfathersname:contains"
* extension[display].extension[filter][3].valueString = "Employee ID|identifier.where(type.coding.code='employeeId'):text"
* extension[display].extension[filter][4].valueString = "PIN ID|_id"
*/
* extension[display].extension[field][0].extension[path].valueString = "Practitioner.id"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[display].extension[add].extension[url].valueUrl = "/questionnaire/ihris-personal-information/practitioner"
* extension[display].extension[add].extension[icon].valueString = "mdi-account-plus"
* extension[display].extension[add].extension[class].valueString = "accent"

* extension[section][0].extension[title].valueString = "Health Worker"
* extension[section][0].extension[description].valueString = "Primary Person details"
* extension[section][0].extension[name].valueString = "Practitioner"
* extension[section][0].extension[field][0].valueString = "Practitioner.gender"
* extension[section][0].extension[field][1].valueString = "Practitioner.indentifier"
* extension[section][0].extension[field][2].valueString = "Practitioner.name.family"
* extension[section][0].extension[field][3].valueString = "Practitioner.name.given"
/*
* extension[section][0].extension[title].valueString = "Names"
* extension[section][0].extension[description].valueString = "Health worker names"
* extension[section][0].extension[name].valueString = "Practitioner.name"
* extension[section][0].extension[field][0].valueString = "Practitioner.name.given"
* extension[section][0].extension[field][1].valueString = "Practitioner.name.family"
*/

* extension[section][1].extension[title].valueString = "Demographic Details"
* extension[section][1].extension[description].valueString = "Demographic Informations"
* extension[section][1].extension[name].valueString = "demographic"
* extension[section][1].extension[field][0].valueString = "Practitioner.gender"


* extension[section][2].extension[title].valueString = "Current  Positions"
* extension[section][2].extension[description].valueString = "Position the person holds"
* extension[section][2].extension[name].valueString = "position"
* extension[section][2].extension[field][0].valueString = "PractitionerRole.code"
* extension[section][2].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-job-description)
* extension[section][2].extension[resource].extension[linkfield].valueString = "PractitionerRole.practitioner"
/*
* extension[section][2].extension[resource].extension[column][0].extension[header].valueString = "Position information"
* extension[section][2].extension[resource].extension[column][0].extension[field].valueString = "PractitionerRole.code.coding[0]"

* extension[section][2].extension[resource].extension[column][1].extension[header].valueString = "Facility/Community"
* extension[section][2].extension[resource].extension[column][1].extension[field].valueString = "PractitionerRole.location"
*/
* extension[section][2].extension[resource].extension[column][1].extension[header].valueString = "Employment Title (Cadre)"
* extension[section][2].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-employment-ext').valueCoding.display"

* extension[section][2].extension[resource].extension[column][2].extension[header].valueString = "MER Category"
* extension[section][2].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-MERCategory-ext').valueCoding.display"

* extension[section][2].extension[resource].extension[column][3].extension[header].valueString = "SNU1/Region"
* extension[section][2].extension[resource].extension[column][3].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-snu-ext').valueCoding.display"

* extension[section][2].extension[resource].extension[column][4].extension[header].valueString = "PSNU/District"
* extension[section][2].extension[resource].extension[column][4].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-psnu-ext').valueCoding.display"

* extension[section][2].extension[resource].extension[column][5].extension[header].valueString = "PEPFAR Program Area"
* extension[section][2].extension[resource].extension[column][5].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-progarea-ext').valueCoding.display"

* extension[section][2].extension[resource].extension[column][6].extension[header].valueString = "Primary Function"
* extension[section][2].extension[resource].extension[column][6].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-primaryFunction-ext').valueString"

* extension[section][2].extension[resource].extension[column][7].extension[header].valueString = "Actions"
* extension[section][2].extension[resource].extension[column][7].extension[field].valueString = "_action"

* extension[section][2].extension[resource].extension[action][0].extension[link].valueString = "/resource/add/practitionerrole?PractitionerRole.practitioner.reference=Practitioner/FHIRID"
* extension[section][2].extension[resource].extension[action][0].extension[text].valueString = "Assign Position"
* extension[section][2].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][2].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
/*
* extension[section][2].extension[resource].extension[action][0].extension[condition].valueString = "PractitionerRole.period.end.exists()" */
* extension[section][2].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][2].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/practitionerrole/ITEMID"
* extension[section][2].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][2].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][2].extension[resource].extension[action][1].extension[class].valueString = "primary"
/*
* extension[section][2].extension[resource].extension[action][2].extension[link].valueString = "/questionnaire/ihris-endrole/practitionerrole?practitionerrole=ITEMID"
* extension[section][2].extension[resource].extension[action][2].extension[text].valueString = "Terminate Job"
* extension[section][2].extension[resource].extension[action][2].extension[row].valueBoolean = true
* extension[section][2].extension[resource].extension[action][2].extension[condition].valueString = "PractitionerRole.period.end.empty()"
* extension[section][2].extension[resource].extension[action][2].extension[class].valueString = "warning"
* extension[section][2].extension[resource].extension[action][3].extension[link].valueString = "/questionnaire/ihris-promotion-ethiopia/practitionerrole?practitionerrole=ITEMID"
* extension[section][2].extension[resource].extension[action][3].extension[text].valueString = "Change Position"
* extension[section][2].extension[resource].extension[action][3].extension[row].valueBoolean = true
* extension[section][2].extension[resource].extension[action][3].extension[condition].valueString = "PractitionerRole.period.end.empty()"
* extension[section][2].extension[resource].extension[action][3].extension[class].valueString = "accent"
*/

/*
* extension[section][3].extension[title].valueString = "Identifiers"
* extension[section][3].extension[description].valueString = "National Identification Number"
* extension[section][3].extension[name].valueString = "National Identification Number"
* extension[section][3].extension[field][0].valueString = "Practitioner.identifier[0]"
*/
/*
* extension[section][3].extension[field][1].valueString = "Practitioner.identifier.use"
* extension[section][3].extension[field][2].valueString = "Practitioner.identifier.type"
* extension[section][3].extension[field][3].valueString = "Practitioner.identifier.value"
* extension[section][3].extension[field][4].valueString = "Practitioner.extension:drivingLicense"
*/
/*

* extension[section][5].extension[title].valueString = "Contact Details"
* extension[section][5].extension[description].valueString = "email, phone numbers"
* extension[section][5].extension[name].valueString = "contact"
* extension[section][5].extension[field][0].valueString = "Practitioner.extension:residence"
* extension[section][5].extension[field][1].valueString = "Practitioner.extension:ethiopiaPhone"
* extension[section][5].extension[field][2].valueString = "Practitioner.extension:ethiopiaWorkPhone"
* extension[section][5].extension[field][3].valueString = "Practitioner.extension:ethiopiaEmail"
* extension[section][6].extension[title].valueString = "Language Details"
* extension[section][6].extension[description].valueString = "Languages spoken"
* extension[section][6].extension[name].valueString = "language"
* extension[section][6].extension[field][0].valueString = "Practitioner.communication"
* extension[section][7].extension[title].valueString = "Dependents Details"
* extension[section][7].extension[description].valueString = "Dependents"
* extension[section][7].extension[name].valueString = "dependents"
* extension[section][7].extension[field][0].valueString = "Practitioner.extension:dependents"
* extension[section][8].extension[title].valueString = "Training Details"
* extension[section][8].extension[description].valueString = "Training Information"
* extension[section][8].extension[name].valueString = "training"
* extension[section][8].extension[field][0].valueString = "Practitioner.extension:specialTraining"
* extension[section][8].extension[field][1].valueString = "Practitioner.extension:category"
* extension[section][9].extension[title].valueString = "Remarks"
* extension[section][9].extension[description].valueString = "Remarks or Notes "
* extension[section][9].extension[name].valueString = "remarks"
* extension[section][9].extension[field][0].valueString = "Practitioner.extension:remarkNote"
* extension[section][10].extension[title].valueString = "Current Job Positions"
* extension[section][10].extension[description].valueString = "Position the person holds"
* extension[section][10].extension[name].valueString = "position"
* extension[section][10].extension[field][0].valueString = "PractitionerRole.code"
* extension[section][10].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-job-description)
* extension[section][10].extension[resource].extension[linkfield].valueString = "PractitionerRole.practitioner"
* extension[section][10].extension[resource].extension[column][0].extension[header].valueString = "Job"
* extension[section][10].extension[resource].extension[column][0].extension[field].valueString = "PractitionerRole.code.coding[0]"
* extension[section][10].extension[resource].extension[column][1].extension[header].valueString = "Place Of Work"
* extension[section][10].extension[resource].extension[column][1].extension[field].valueString = "PractitionerRole.location.reference"
* extension[section][10].extension[resource].extension[column][2].extension[header].valueString = "First Employment Date"
* extension[section][10].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-first-employment-date').valueDate"
* extension[section][10].extension[resource].extension[column][3].extension[header].valueString = "Start Date"
* extension[section][10].extension[resource].extension[column][3].extension[field].valueString = "PractitionerRole.period.start"
* extension[section][10].extension[resource].extension[column][4].extension[header].valueString = "Shift"
* extension[section][10].extension[resource].extension[column][4].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-shift').valueCoding.display"
* extension[section][10].extension[resource].extension[column][5].extension[header].valueString = "Job Type"
* extension[section][10].extension[resource].extension[column][5].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-job-type').valueCoding.display"
* extension[section][10].extension[resource].extension[column][6].extension[header].valueString = "Employment Status"
* extension[section][10].extension[resource].extension[column][6].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-employment-status').valueCoding.display"
* extension[section][10].extension[resource].extension[column][7].extension[header].valueString = "End Date"
* extension[section][10].extension[resource].extension[column][7].extension[field].valueString = "PractitionerRole.period.end"
* extension[section][10].extension[resource].extension[column][8].extension[header].valueString = "Actions"
* extension[section][10].extension[resource].extension[column][8].extension[field].valueString = "_action"
* extension[section][10].extension[resource].extension[action][0].extension[link].valueString = "/resource/add/practitionerrole?PractitionerRole.practitioner.reference=Practitioner/FHIRID"
* extension[section][10].extension[resource].extension[action][0].extension[text].valueString = "Assign Job"
* extension[section][10].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][10].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][10].extension[resource].extension[action][0].extension[condition].valueString = "PractitionerRole.period.end.exists()"
* extension[section][10].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][10].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/practitionerrole/ITEMID"
* extension[section][10].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][10].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][10].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][10].extension[resource].extension[action][2].extension[link].valueString = "/questionnaire/ihris-endrole/practitionerrole?practitionerrole=ITEMID"
* extension[section][10].extension[resource].extension[action][2].extension[text].valueString = "Terminate Job"
* extension[section][10].extension[resource].extension[action][2].extension[row].valueBoolean = true
* extension[section][10].extension[resource].extension[action][2].extension[condition].valueString = "PractitionerRole.period.end.empty()"
* extension[section][10].extension[resource].extension[action][2].extension[class].valueString = "warning"
* extension[section][10].extension[resource].extension[action][3].extension[link].valueString = "/questionnaire/ihris-promotion-ethiopia/practitionerrole?practitionerrole=ITEMID"
* extension[section][10].extension[resource].extension[action][3].extension[text].valueString = "Change Position"
* extension[section][10].extension[resource].extension[action][3].extension[row].valueBoolean = true
* extension[section][10].extension[resource].extension[action][3].extension[condition].valueString = "PractitionerRole.period.end.empty()"
* extension[section][10].extension[resource].extension[action][3].extension[class].valueString = "accent"
* extension[section][11].extension[title].valueString = "Leave Stock Information"
* extension[section][11].extension[description].valueString = "Leave Stock  Details for the Person"
* extension[section][11].extension[name].valueString = "leavestock"
* extension[section][11].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-ethiopia-leave-stock)
* extension[section][11].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][11].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][11].extension[resource].extension[column][0].extension[header].valueString = "Leave Type"
* extension[section][11].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave-stock').extension.where(url='leave-type').valueCoding"
* extension[section][11].extension[resource].extension[column][1].extension[header].valueString = "Number Of Days"
* extension[section][11].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave-stock').extension.where(url='numDays').valueInteger"
* extension[section][11].extension[resource].extension[column][2].extension[header].valueString = "Year"
* extension[section][11].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave-stock').extension.where(url='year').valueDate"
* extension[section][11].extension[resource].extension[column][3].extension[header].valueString = "Actions"
* extension[section][11].extension[resource].extension[column][3].extension[field].valueString = "_action"
* extension[section][11].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-leave-stock-ethiopia/leavestock?practitioner=FHIRID"
* extension[section][11].extension[resource].extension[action][0].extension[text].valueString = "Add Leave Stock"
* extension[section][11].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][11].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][11].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][11].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/leavestock/ITEMID"
* extension[section][11].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][11].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][11].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][12].extension[title].valueString = "Leave Information"
* extension[section][12].extension[description].valueString = "Leave Details for the Person"
* extension[section][12].extension[name].valueString = "leave"
* extension[section][12].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-ethiopia-leave)
* extension[section][12].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][12].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][12].extension[resource].extension[column][0].extension[header].valueString = "Leave Type"
* extension[section][12].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave').extension.where(url='leave-type').valueCoding"
* extension[section][12].extension[resource].extension[column][1].extension[header].valueString = "Days Requested"
* extension[section][12].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave').extension.where(url='daysRequested').valueInteger"
* extension[section][12].extension[resource].extension[column][2].extension[header].valueString = "Requested Date"
* extension[section][12].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave').extension.where(url='dateRequested').valueDate"
* extension[section][12].extension[resource].extension[column][3].extension[header].valueString = "Start Date"
* extension[section][12].extension[resource].extension[column][3].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave').extension.where(url='period').valuePeriod.start"
* extension[section][12].extension[resource].extension[column][4].extension[header].valueString = "End Date"
* extension[section][12].extension[resource].extension[column][4].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-ethiopia-leave').extension.where(url='period').valuePeriod.end"
* extension[section][12].extension[resource].extension[column][5].extension[header].valueString = "Actions"
* extension[section][12].extension[resource].extension[column][5].extension[field].valueString = "_action"
* extension[section][12].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-leave-ethiopia/basicleave?practitioner=FHIRID"
* extension[section][12].extension[resource].extension[action][0].extension[text].valueString = "Add Leave"
* extension[section][12].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][12].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][12].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][12].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/basicleave/ITEMID"
* extension[section][12].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][12].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][12].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][13].extension[title].valueString = "Education History Information"
* extension[section][13].extension[description].valueString = "Education History Details for the Person"
* extension[section][13].extension[name].valueString = "education-history"
* extension[section][13].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-education-history)
* extension[section][13].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][13].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][13].extension[resource].extension[column][0].extension[header].valueString = "Education Institution"
* extension[section][13].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='institution').valueReference.reference"
* extension[section][13].extension[resource].extension[column][1].extension[header].valueString = "Degree"
* extension[section][13].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='degree').valueCoding"
* extension[section][13].extension[resource].extension[column][2].extension[header].valueString = "level"
* extension[section][13].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='level').valueCoding"
* extension[section][13].extension[resource].extension[column][3].extension[header].valueString = "Educational Major"
* extension[section][13].extension[resource].extension[column][3].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='educationalMajor').valueCoding"
* extension[section][13].extension[resource].extension[column][4].extension[header].valueString = "Year"
* extension[section][13].extension[resource].extension[column][4].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='year').valueDate"
* extension[section][13].extension[resource].extension[column][5].extension[header].valueString = "Actions"
* extension[section][13].extension[resource].extension[column][5].extension[field].valueString = "_action"
* extension[section][13].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-education-history/basic-education-history?practitioner=FHIRID"
* extension[section][13].extension[resource].extension[action][0].extension[text].valueString = "Add Education History"
* extension[section][13].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][13].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][13].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][13].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/basic-education-history/ITEMID"
* extension[section][13].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][13].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][13].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][14].extension[title].valueString = "Performance Evaluation Information"
* extension[section][14].extension[description].valueString = "Performance Evaluation for the Person"
* extension[section][14].extension[name].valueString = "performance"
* extension[section][14].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-performance)
* extension[section][14].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][14].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][14].extension[resource].extension[column][0].extension[header].valueString = "Performance Type"
* extension[section][14].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-performance').extension.where(url='performanceType').valueCoding.display"
* extension[section][14].extension[resource].extension[column][1].extension[header].valueString = "Evaluator's Name"
* extension[section][14].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-performance').extension.where(url='evaluator').valueString"
* extension[section][14].extension[resource].extension[column][2].extension[header].valueString = "Score"
* extension[section][14].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-performance').extension.where(url='score').valueString"
* extension[section][14].extension[resource].extension[column][3].extension[header].valueString = "Start Date"
* extension[section][14].extension[resource].extension[column][3].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-performance').extension.where(url='period').valuePeriod.start"
* extension[section][14].extension[resource].extension[column][4].extension[header].valueString = "End Date"
* extension[section][14].extension[resource].extension[column][4].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-performance').extension.where(url='period').valuePeriod.end"
* extension[section][14].extension[resource].extension[column][5].extension[header].valueString = "Actions"
* extension[section][14].extension[resource].extension[column][5].extension[field].valueString = "_action"
* extension[section][14].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-performance/performance?practitioner=FHIRID"
* extension[section][14].extension[resource].extension[action][0].extension[text].valueString = "Add Perfromamce Evaluation"
* extension[section][14].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][14].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][14].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][14].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/performance/ITEMID"
* extension[section][14].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][14].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][14].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][15].extension[title].valueString = "Employment History"
* extension[section][15].extension[description].valueString = "Employment History for the Person"
* extension[section][15].extension[name].valueString = "employment-history"
* extension[section][15].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-employment-history)
* extension[section][15].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][15].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][15].extension[resource].extension[column][0].extension[header].valueString = "Organization Name"
* extension[section][15].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-employment-history').extension.where(url='organization').valueString"
* extension[section][15].extension[resource].extension[column][1].extension[header].valueString = "Position"
* extension[section][15].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-employment-history').extension.where(url='startingPosition').valueString"
* extension[section][15].extension[resource].extension[column][2].extension[header].valueString = "Date Started"
* extension[section][15].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-employment-history').extension.where(url='period').valuePeriod.start"
* extension[section][15].extension[resource].extension[column][3].extension[header].valueString = "Date Ended"
* extension[section][15].extension[resource].extension[column][3].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-employment-history').extension.where(url='period').valuePeriod.end"
* extension[section][15].extension[resource].extension[column][4].extension[header].valueString = "Actions"
* extension[section][15].extension[resource].extension[column][4].extension[field].valueString = "_action"
* extension[section][15].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-employment-history/employment-history?practitioner=FHIRID"
* extension[section][15].extension[resource].extension[action][0].extension[text].valueString = "Add Employment History"
* extension[section][15].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][15].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][15].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][15].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/employment-history/ITEMID"
* extension[section][15].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][15].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][15].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][16].extension[title].valueString = "Professional License Category"
* extension[section][16].extension[description].valueString = "Professional License Category for the Person"
* extension[section][16].extension[name].valueString = "professional"
* extension[section][16].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-professional)
* extension[section][16].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][16].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][16].extension[resource].extension[column][0].extension[header].valueString = "Professional License Category"
* extension[section][16].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-professional').extension.where(url='profession').valueCoding.display"
* extension[section][16].extension[resource].extension[column][1].extension[header].valueString = "Actions"
* extension[section][16].extension[resource].extension[column][1].extension[field].valueString = "_action"
* extension[section][16].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-professional/professional?practitioner=FHIRID"
* extension[section][16].extension[resource].extension[action][0].extension[text].valueString = "Add Professional License Category"
* extension[section][16].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][16].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][16].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][16].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/professional/ITEMID"
* extension[section][16].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][16].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][16].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][17].extension[title].valueString = "Emergency Contact"
* extension[section][17].extension[description].valueString = "Emergency Contact for the Person"
* extension[section][17].extension[name].valueString = "emergency"
* extension[section][17].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-emergency)
* extension[section][17].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][17].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][17].extension[resource].extension[column][0].extension[header].valueString = "Name"
* extension[section][17].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-emergency').extension.where(url='name').valueString"
* extension[section][17].extension[resource].extension[column][1].extension[header].valueString = "Relationship"
* extension[section][17].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-emergency').extension.where(url='relation').valueCoding.display"
* extension[section][17].extension[resource].extension[column][2].extension[header].valueString = "Mobile Phone"
* extension[section][17].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-emergency').extension.where(url='mobile').valueString"
* extension[section][17].extension[resource].extension[column][3].extension[header].valueString = "Location"
* extension[section][17].extension[resource].extension[column][3].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-emergency').extension.where(url='location').valueReference.Reference"
* extension[section][17].extension[resource].extension[column][4].extension[header].valueString = "Actions"
* extension[section][17].extension[resource].extension[column][4].extension[field].valueString = "_action"
* extension[section][17].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-emergency/emergency?practitioner=FHIRID"
* extension[section][17].extension[resource].extension[action][0].extension[text].valueString = "Add Emergency Contact"
* extension[section][17].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][17].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][17].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][17].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/emergency/ITEMID"
* extension[section][17].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][17].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][17].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][18].extension[title].valueString = "Collateral"
* extension[section][18].extension[description].valueString = "Collateral for the Person"
* extension[section][18].extension[name].valueString = "collateral"
* extension[section][18].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-collateral)
* extension[section][18].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][18].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][18].extension[resource].extension[column][0].extension[header].valueString = "Name"
* extension[section][18].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-collateral').extension.where(url='name').valueString"
* extension[section][18].extension[resource].extension[column][1].extension[header].valueString = "Gender"
* extension[section][18].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-collateral').extension.where(url='gender').valueCoding.display"
* extension[section][18].extension[resource].extension[column][2].extension[header].valueString = "Mobile Phone"
* extension[section][18].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-collateral').extension.where(url='mobile').valueString"
* extension[section][18].extension[resource].extension[column][3].extension[header].valueString = "Location"
* extension[section][18].extension[resource].extension[column][3].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-collateral').extension.where(url='location').valueReference.Reference"
* extension[section][18].extension[resource].extension[column][4].extension[header].valueString = "Actions"
* extension[section][18].extension[resource].extension[column][4].extension[field].valueString = "_action"
* extension[section][18].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-collateral/collateral?practitioner=FHIRID"
* extension[section][18].extension[resource].extension[action][0].extension[text].valueString = "Add Collateral"
* extension[section][18].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][18].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][18].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][18].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/collateral/ITEMID"
* extension[section][18].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][18].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][18].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][19].extension[title].valueString = "Employee Discipline Information"
* extension[section][19].extension[description].valueString = "Employee Discipline for the Person"
* extension[section][19].extension[name].valueString = "Employee Discipline"
* extension[section][19].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-discipline)
* extension[section][19].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][19].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][19].extension[resource].extension[column][0].extension[header].valueString = "Discipline Action Type"
* extension[section][19].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-discipline').extension.where(url='actionType').valueCoding.display"
* extension[section][19].extension[resource].extension[column][1].extension[header].valueString = "Action Taken"
* extension[section][19].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-discipline').extension.where(url='actionTaken').valueString"
* extension[section][19].extension[resource].extension[column][2].extension[header].valueString = "Start Date"
* extension[section][19].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-discipline').extension.where(url='period').valuePeriod.start"
* extension[section][19].extension[resource].extension[column][3].extension[header].valueString = "End Date"
* extension[section][19].extension[resource].extension[column][3].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-discipline').extension.where(url='period').valuePeriod.end"
* extension[section][19].extension[resource].extension[column][4].extension[header].valueString = "Actions"
* extension[section][19].extension[resource].extension[column][4].extension[field].valueString = "_action"
* extension[section][19].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-discipline/discipline?practitioner=FHIRID"
* extension[section][19].extension[resource].extension[action][0].extension[text].valueString = "Add Disciplinary Action"
* extension[section][19].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][19].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][19].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][19].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/discipline/ITEMID"
* extension[section][19].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][19].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][19].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][20].extension[title].valueString = "Employee Salary Information"
* extension[section][20].extension[description].valueString = "Employee Salary Information for the Person"
* extension[section][20].extension[name].valueString = "Employee Salary Information"
* extension[section][20].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-salary)
* extension[section][20].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][20].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][20].extension[resource].extension[column][0].extension[header].valueString = "Pay Grade"
* extension[section][20].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-salary').extension.where(url='salaryScale').valueCoding.display"
* extension[section][20].extension[resource].extension[column][1].extension[header].valueString = "Basic Salary"
* extension[section][20].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-salary').extension.where(url='bsalary').valueString"
* extension[section][20].extension[resource].extension[column][2].extension[header].valueString = "Allowances"
* extension[section][20].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-salary').extension.where(url='allowance').valueString"
* extension[section][20].extension[resource].extension[column][3].extension[header].valueString = "Benefits"
* extension[section][20].extension[resource].extension[column][3].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-salary').extension.where(url='benefits').valueString"
* extension[section][20].extension[resource].extension[column][4].extension[header].valueString = "Total"
* extension[section][20].extension[resource].extension[column][4].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-salary').extension.where(url='total').valueString"
* extension[section][20].extension[resource].extension[column][5].extension[header].valueString = "Start Date"
* extension[section][20].extension[resource].extension[column][5].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-salary').extension.where(url='period').valuePeriod.start"
* extension[section][20].extension[resource].extension[column][6].extension[header].valueString = "End Date"
* extension[section][20].extension[resource].extension[column][6].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-salary').extension.where(url='period').valuePeriod.end"
* extension[section][20].extension[resource].extension[column][7].extension[header].valueString = "Actions"
* extension[section][20].extension[resource].extension[column][7].extension[field].valueString = "_action"
* extension[section][20].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-salary/salary?practitioner=FHIRID"
* extension[section][20].extension[resource].extension[action][0].extension[text].valueString = "Add Salary Info"
* extension[section][20].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][20].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][20].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][20].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/salary/ITEMID"
* extension[section][20].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][20].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][20].extension[resource].extension[action][1].extension[class].valueString = "primary"

*/
Instance:       ihris-page-progarea
InstanceOf:     IhrisPage
Title:          "iHRIS program area CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-prog-area)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Program areas"
* extension[section][0].extension[description].valueString = "Program areas"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-paymechanism
InstanceOf:     IhrisPage
Title:          "iHRIS pay mechanism CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-pay-mechanism)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Payment mechanism"
* extension[section][0].extension[description].valueString = "Payment mechanism"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-mercategory
InstanceOf:     IhrisPage
Title:          "iHRIS MER Category CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-mer-category)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "MER Category"
* extension[section][0].extension[description].valueString = "MER Category"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-snu
InstanceOf:     IhrisPage
Title:          "iHRIS SNU CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-snu)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "SNU/Region"
* extension[section][0].extension[description].valueString = "SNU/Region"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-psnu
InstanceOf:     IhrisPage
Title:          "iHRIS PSNU CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-psnu)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "PSNU/District"
* extension[section][0].extension[description].valueString = "PSNU/District"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-serviceDelivery
InstanceOf:     IhrisPage
Title:          "iHRIS PSNU CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-serviceDelivery)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Service Delivery Type"
* extension[section][0].extension[description].valueString = "Service Delivery Type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"


Instance:       ihris-page-employmentStatus
InstanceOf:     IhrisPage
Title:          "iHRIS PSNU CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-employmentStatus)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Employment status"
* extension[section][0].extension[description].valueString = "Employment status"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-job
InstanceOf:     IhrisPage
Title:          "iHRIS Job CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-job-ethiopia)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[search][2].valueString = "Cadre|cadre"
* extension[display].extension[search][3].valueString = "Classification|classification"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Job"
* extension[section][0].extension[description].valueString = "Employment Title (Cadre)"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.code"
* extension[section][0].extension[field][1].valueString = "CodeSystem.definition"
* extension[section][0].extension[field][2].valueString = "CodeSystem.display"
* extension[section][0].extension[field][3].valueString = "CodeSystem.cadre"
* extension[section][0].extension[field][4].valueString = "CodeSystem.classification"
* extension[section][0].extension[field][5].valueString = "CodeSystem.salary-grade"
* extension[section][0].extension[field][6].valueString = "CodeSystem.designation[0].language"
* extension[section][0].extension[field][7].valueString = "CodeSystem.designation[0].value"


Instance:       ihris-page-identifier
InstanceOf:     IhrisPage
Title:          "iHRIS identifier type CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-ethiopia-identifier)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Identifier Type"
* extension[section][0].extension[description].valueString = "Identifier Type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-employment
InstanceOf:     IhrisPage
Title:          "iHRIS cadres CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-employment)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Cadre"
* extension[section][0].extension[description].valueString = "Cadre"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-ownership
InstanceOf:     IhrisPage
Title:          "iHRIS facility ownership CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-ownership-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Facility ownership"
* extension[section][0].extension[description].valueString = "Facility ownership"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"


Instance:       ihris-page-kephlevel
InstanceOf:     IhrisPage
Title:          "iHRIS facility KEPH Level CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-kephlevel-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "KEPH Level"
* extension[section][0].extension[description].valueString = "KEPH Level"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"


Instance:       ihris-page-mercadre
InstanceOf:     IhrisPage
Title:          "iHRIS MER cadre CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-mercadre-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "MER Cadre"
* extension[section][0].extension[description].valueString = "MER Cadre"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-supporttype
InstanceOf:     IhrisPage
Title:          "iHRIS Support type CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-supporttype-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Support type"
* extension[section][0].extension[description].valueString = "Support type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-sitetype
InstanceOf:     IhrisPage
Title:          "iHRIS site type CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/location-physical-type)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Site type"
* extension[section][0].extension[description].valueString = "Site type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"


Instance:       ihris-page-users
InstanceOf:     IhrisPage
Title:          "Users"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-person-user)
* extension[display].extension[search][0].valueString = "User|Person.name.where(use='official').text"
* extension[display].extension[search][1].valueString = "Username/Email|Person.telecom.where(system='email').value"
* extension[display].extension[search][2].valueString = "Role|Person.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-assign-role').valueReference.reference"
* extension[section][0].extension[title].valueString = "System Users"
* extension[section][0].extension[description].valueString = "System Users details"
* extension[section][0].extension[name].valueString = "Person"
* extension[section][0].extension[field][0].valueString = "Person.name"
* extension[section][0].extension[field][1].valueString = "Person.telecom:"
* extension[section][0].extension[field][2].valueString = "Person.extension:role.valueReference"

Instance:       ihris-page-gender
InstanceOf:     IhrisPage
Title:          "iHRIS Gender CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-gender-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Gender"
* extension[section][0].extension[description].valueString = "Gender"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"