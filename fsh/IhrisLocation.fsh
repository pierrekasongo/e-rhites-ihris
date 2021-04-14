Profile:        IhrisLocation
Parent:         Location
Id:             ihris-location
Title:          "Facility/Community"
Description:    "iHRIS profile of Location."


* name 1..1 MS
* name ^label = "Name"
* status 0..1 MS
* status ^label = "Status"
* position 0..1 MS
* position ^label = "Position"
* position.longitude 1..1 MS
* position.longitude ^label = "Longitude"
* position.latitude 1..1 MS
* position.latitude ^label = "Latitude"
* position.altitude 0..1 MS
* position.altitude ^label = "Altitude"
* type 0..1 MS
* type ^label = "HRH Work Location Type"
* type.coding 1..1 MS
* type.coding ^label = "HRH Work Location Type"
* description MS
* description ^label = "Description"
* partOf 0..1 MS
* partOf ^label = "Parent facility"
* type.coding from IhrisFacilityTypeValueSet (required)

ValueSet:         IhrisFacilityTypeValueSet
Id:               ihris-facility-type-valueset
Title:            "iHRIS Facility type ValueSet"
* ^date = "2021-01-29T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisFacilityTypeCodeSystem

CodeSystem:      IhrisFacilityTypeCodeSystem
Id:              ihris-facility-type-codesystem
Title:           "Facility type"
* ^date = "2021-01-29T08:41:04.362Z"
* ^version = "0.2.0"
* #facility "Facility"
* #community "Community"


/*
* description MS
* description ^label = "Description"
* type 0..1 MS
* type ^label = "Facility Type"
* type.coding 1..1 MS
* type.coding ^label = "Ownership"
* type.coding from IhrisOwnershipValueSet
* physicalType MS
* physicalType ^label = "Facility Type"
* physicalType.coding 1..1 MS
* physicalType.coding ^label = "Facility Type"
* partOf 0..1 MS
* partOf ^label = "Parent facility"
* extension contains
    IhrisLocationLevel named level 0..1 MS
* extension[level].valueCoding MS
* extension[level] ^label = "KEPH Level"*/

/* position 0..1 MS
* position ^label = "Geo-Coordinates"
* position.longitude 1..1 MS
* position.longitude ^label = "Longitude"
* position.latitude 1..1 MS
* position.latitude ^label = "Latitude"
* position.altitude 0..0 MS
* telecom MS
* telecom ^label = "Telecom"
* telecom.system MS
* telecom.system ^label = "Type"
* telecom.value MS
* telecom.value ^label = "Value"
* telecom.use MS
* telecom.use ^label = "Use"*/
/*

Instance:       ihris-page-location
InstanceOf:     IhrisPage
Title:          "iHRIS Location Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-location)
* extension[display].extension[search][0].valueString = "Facility Name|name"
* extension[display].extension[search][1].valueString = "Facility Type|type.coding[0]"

* extension[display].extension[filter][0].valueString = "Name|name:contains"
* extension[display].extension[filter][1].valueString = "Facility Ownership|type|http://hl7.org/fhir/ValueSet/ihris-ownership-valueset"
* extension[display].extension[filter][2].valueString = "Facility Type|physicalType|http://hl7.org/fhir/ValueSet/location-physical-type"
* extension[section][0].extension[title].valueString = "Facility"
* extension[section][0].extension[description].valueString = "Facility"
* extension[section][0].extension[name].valueString = "Facility"
* extension[section][0].extension[field][0].valueString = "Location.name"
* extension[section][0].extension[field][1].valueString = "Location.description"
* extension[section][0].extension[field][2].valueString = "Location.type"

* extension[section][0].extension[field][3].valueString = "Location.status"
* extension[section][0].extension[field][4].valueString = "Location.position.longitude"
* extension[section][0].extension[field][5].valueString = "Location.position.latitude"

* extension[section][1].extension[title].valueString = "Parent"
* extension[section][1].extension[description].valueString = "Parent"
* extension[section][1].extension[name].valueString = "Facility parent"
* extension[section][1].extension[field][0].valueString = "Location.partOf"

*/
