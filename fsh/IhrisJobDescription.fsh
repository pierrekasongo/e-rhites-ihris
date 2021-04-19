Invariant:      ihris-date-lessthantoday
Description:    "Date must not be in the future."
Expression:     "period.start < today() + 1 day"
Severity:       #error

Invariant:      ihris-enddate-lessthan-start
Description:    "End date must be greater than Start date"
Expression:     "period.end < period.start"
Severity:       #error

Profile:        IhrisJobDescription
Parent:         PractitionerRole
Id:             ihris-job-description
Title:          "Position(s)"
Description:    "iHRIS profile of Practitioner."
/** identifier 0..0 MS
 identifier ^label = "Identifier"
* identifier.system MS
* identifier.system ^label = "System"
* identifier.value MS
* identifier.value ^label = "Value"
* identifier.type MS
* identifier.type ^label = "Type"
* identifier.type.coding 1..1 MS
* active 0..1 MS
* active ^label = "Status"*/
* practitioner 0..1 MS
* practitioner ^label = "Health Worker"
/* practitioner.reference ^label = "Health Worker"
/*
* healthcareService 0..0
* telecom 0..0
*/
* location 1..1 MS
* location ^label = "Facility/Community"
* location.reference ^label = "Facility/Community"

* active 1..1 MS
* active ^label = "Active"
* period 1..1 MS
* period ^label = "Employment period"
* period ^constraint[0].key = "ihris-period-start-end"
* period ^constraint[0].severity = #error
* period ^constraint[0].human = "The end date must be after the start date"
* period ^constraint[0].expression = "end.empty() or end = '' or end >= start"
* period.start 1..1 MS
* period.start ^label = "Initial Employment Date"
* period.start ^minValueDateTime = "1950-01-01"
* period.start ^maxValueDateTime = "2030-01-01"
* period.end 0..1 MS
* period.end ^label = "End Date"

* extension contains 
    IhrisEmploymentExt named cadre 1..1 MS and
    IhrisMERCategoryExt named MERcategory 1..1 MS and
    IhrisSnuExt named snu 1..1 MS and
    IhrisPsnuExt named psnu 1..1 MS and
    IhrisProgAreaExt named progarea 1..1 MS and
    IhrisPrimaryFunctionExt named primaryFunction 1..1 MS and
    IhrisServiceDeliveryExt named serviceDelivery 1..1 MS and
    IhrisMonthNumExt named monthNum 1..1 MS and
    IhrisEmploymentStatusExt named employmentStatus 1..1 MS and
    IhrisRcvSalaryExt named rcvSalary 1..1 MS and
    IhrisWeekPercentExt named weekPercent 1..1 MS and
    IhrisPayMechanismExt named payMechanism 1..1 MS and
    IhrisAnnualSalaryExt named annSalary 0..1 MS and
    IhrisAnnualStipendExt named annStipend 0..1 MS and
    IhrisAnnualNonMonetaryExt named annNonMonetary 0..1 MS and
    IhrisTotalAnnualExt named totalAnnual 0..1 MS and
    IhrisTotalExpenditureExt named totalExpenditure 0..1 MS and
    IhrisIncludeFringeExt named includeFringe 0..1 MS and
    IhrisAnnFringeExt named annFringe 1..1 MS and
    IhrisRcvCompensationExt named rcvCompensation 0..1 MS and
    IhrisRcvMonetaryCompExt named rcvMonetaryComp 0..1 MS and
    IhrisSourceCompExt named sourceCompensation 0..1 MS and

    IhrisWithMoHScheduleExt named withinMoHSchedule 0..1 MS and
    IhrisLevelExt named level 0..1 MS and
    IhrisServiceProvidedExt named serviceProvided 0..1 MS and


    IhrisCommentExt named comment 0..1 MS


* extension[cadre].valueCoding  MS
* extension[cadre].valueCoding ^label = "Employment Title (Cadre)"
* extension[MERcategory].valueCoding MS
* extension[MERcategory].valueCoding ^label = "MER Category"
* extension[snu].valueCoding MS
* extension[snu].valueCoding ^label = "SNU1/Region"
* extension[psnu].valueCoding MS
* extension[psnu].valueCoding ^label = "PSNU/District"
* extension[progarea].valueCoding MS
* extension[progarea].valueCoding ^label = "PEPFAR Program Area"
* extension[primaryFunction].valueString MS
* extension[primaryFunction].valueString ^label = "Primary Function"
* extension[serviceDelivery].valueCoding MS
* extension[serviceDelivery].valueCoding ^label = "PEPFAR Site Service Delivery Type"
* extension[monthNum].valuePositiveInt MS
* extension[monthNum].valuePositiveInt ^label = "How many months in the current financial Year?"
* extension[employmentStatus].valueCoding MS
* extension[employmentStatus].valueCoding ^label = "PEPFAR Employment Status"
* extension[rcvSalary].valueBoolean  MS
* extension[rcvSalary].valueBoolean ^label = "Does the staff receive salary?"
* extension[weekPercent].valuePositiveInt MS
* extension[weekPercent].valuePositiveInt ^label = "Percent of Full-Time work week spent on HIV."
* extension[payMechanism].valueCoding MS
* extension[payMechanism].valueCoding ^label = "Payment Mechanism"

* extension[annSalary].valuePositiveInt MS
* extension[annSalary].valuePositiveInt ^label = "Amount of Annual Salary Compensation From PEPFAR"
* extension[annStipend].valuePositiveInt MS
* extension[annStipend].valuePositiveInt ^label = "Amount of Annual Stipend, Allowance or Honoraium Compensation"
* extension[annNonMonetary].valuePositiveInt MS
* extension[annNonMonetary].valuePositiveInt ^label = "Amount of Annual Non-Monetary Compensation"
* extension[totalAnnual].valuePositiveInt MS
* extension[totalAnnual].valuePositiveInt ^label = "What is the Total Annual PEPFAR Budgeted Compensation for This Position"
* extension[totalExpenditure].valuePositiveInt MS
* extension[totalExpenditure].valuePositiveInt ^label = "What is the Total Expenditure for this Position in the current FY"
* extension[includeFringe].valueBoolean MS
* extension[includeFringe].valueBoolean ^label = "Indicate if Reported Compensation Includes Fringe Benefits"
* extension[annFringe].valuePositiveInt MS
* extension[annFringe].valuePositiveInt ^label = "If Known, Please Indicate Amount of Fringe Benefit"
* extension[rcvCompensation].valueBoolean MS
* extension[rcvCompensation].valueBoolean ^label = "Does the Staff Member Receive  Compensation from other USG Sources"
* extension[rcvMonetaryComp].valueBoolean MS
* extension[rcvMonetaryComp].valueBoolean ^label = "Does Staff Member Receive Monetary Compensation from Non-USG Sources"
* extension[sourceCompensation].valueString MS
* extension[sourceCompensation].valueString ^label = "Please indicate source of non-USG compensation"

* extension[withinMoHSchedule].valueBoolean MS
* extension[withinMoHSchedule].valueBoolean ^label = "Position within MOH Autorized Schedule?"

* extension[level].valueCoding MS
* extension[level].valueCoding ^label = "Staff Position level"

* extension[serviceProvided].valueCoding MS
* extension[serviceProvided].valueCoding ^label = "Service provided"

* extension[comment].valueString MS
* extension[comment].valueString ^label = "Notes/Comments"


Extension:  IhrisWithMoHScheduleExt
Id:         ihris-withinMOH-schedule-Ext
Title:      "iHRIS Within MOH Schedule extension"
Description: "iHRIS Within MOH Schedule extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only boolean
* valueBoolean 1..1 MS
* valueBoolean ^label = "iHRIS Within MOH Schedule extension"

Extension:  IhrisLevelExt
Id:         ihris-level-Ext
Title:      "iHRIS Level extension"
Description: "iHRIS Level extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "iHRIS Level extension"
* valueCoding from IhrisLevelValueSet (required)

Extension:  IhrisServiceProvidedExt
Id:         ihris-service-provided-Ext
Title:      "iHRIS Service Provided extension"
Description: "iHRIS Service Provided extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "iHRIS Service Provided extension"
* valueCoding from IhrisServiceProvidedValueSet (required)

Extension:  IhrisAnnualSalaryExt
Id:         ihris-annualSalary-Ext
Title:      "iHRIS Annual Salary extension"
Description: "iHRIS annual salary extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only positiveInt
* valuePositiveInt 1..1 MS
* valuePositiveInt ^label = "Amount of Annual Salary"

Extension:  IhrisAnnualStipendExt
Id:         ihris-annualStipend-Ext
Title:      "iHRIS Annual Stipend extension"
Description: "iHRIS annual stipend extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only positiveInt
* valuePositiveInt 1..1 MS
* valuePositiveInt ^label = "Annual stipend"
 
Extension:  IhrisAnnualNonMonetaryExt
Id:         ihris-annualNonMonetary-Ext
Title:      "iHRIS annual non monetary extension"
Description: "iHRIS annual non monetary extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only positiveInt
* valuePositiveInt 1..1 MS
* valuePositiveInt ^label = "Annual non monetary"

Extension:  IhrisTotalAnnualExt
Id:         ihris-totalAnnual-Ext
Title:      "iHRIS total annual extension"
Description: "iHRIS total annual extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only positiveInt
* valuePositiveInt 1..1 MS
* valuePositiveInt ^label = "Total annual"

Extension:  IhrisTotalExpenditureExt
Id:         ihris-totalExpenditure-Ext
Title:      "iHRIS total expenditure extension"
Description: "iHRIS total expenditure extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only positiveInt
* valuePositiveInt 1..1 MS
* valuePositiveInt ^label = "Total annual expenditure"

Extension:  IhrisIncludeFringeExt
Id:         ihris-includeFringe-Ext
Title:      "iHRIS include fringe extension"
Description: "iHRIS include fringe extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only boolean
* valueBoolean 1..1 MS
* valueBoolean ^label = "Total include fringe"

Extension:  IhrisRcvCompensationExt
Id:         ihris-rcvcompensation-Ext
Title:      "iHRIS receive compensation extension"
Description: "iHRIS receive compensation extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only boolean
* valueBoolean 1..1 MS
* valueBoolean ^label = "Receive compensation"

Extension:  IhrisRcvMonetaryCompExt
Id:         ihris-rcvMonetaryComp-Ext
Title:      "iHRIS receive monetary compensation extension"
Description: "iHRIS receive monetary compensation extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only boolean
* valueBoolean 1..1 MS
* valueBoolean ^label = "Receive monetary compensation"


Extension:  IhrisSourceCompExt
Id:         ihris-sourceComp-Ext
Title:      "iHRIS source of compensation extension"
Description: "iHRIS source of compensation extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Source of compensation"

Extension:  IhrisEmploymentStatusExt
Id:         ihris-employmentStatus-Ext
Title:      "iHRIS Employment status extension"
Description: "iHRIS employment extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "PEPFAR Employment Status"
* valueCoding from IhrisEmploymentStatusValueSet (required)

Extension:  IhrisEmploymentExt
Id:         ihris-employment-ext
Title:      "iHRIS employment extension"
Description: "iHRIS employment extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Employment Title (Cadre)"
* valueCoding from IhrisEmploymentValueSet (required)

Extension: IhrisMERCategoryExt
Id:         ihris-MERCategory-ext
Title:      "iHRIS MER Category extension"
Description: "iHRIS MER Category extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "MER Category"
* valueCoding from IhrisMERCategoryValueSet (required)

Extension: IhrisSnuExt
Id:         ihris-snu-ext
Title:      "iHRIS snu extension"
Description: "iHRIS snu extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "SNU/Region"
* valueCoding from IhrisSnuValueSet (required)

Extension: IhrisPsnuExt
Id:         ihris-psnu-ext
Title:      "iHRIS psnu extension"
Description: "iHRIS psnu extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "PSNU/District"
* valueCoding from IhrisPsnuValueSet (required)

Extension: IhrisProgAreaExt
Id:         ihris-progarea-ext
Title:      "iHRIS program area extension"
Description: "iHRIS program area extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "PEPFAR Program Area"
* valueCoding from IhrisProgAreaValueSet (required)

Extension: IhrisServiceDeliveryExt
Id:         ihris-serviceDelivery-ext
Title:      "iHRIS service delivery extension"
Description: "iHRIS service delivery extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "PEPFAR Site Service Delivery Type"
* valueCoding from IhrisServiceDeliveryValueSet (required)

Extension: IhrisMonthNumExt
Id:         ihris-monthnum-ext
Title:      "iHRIS month number extension"
Description: "iHRIS month number extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only positiveInt
* valuePositiveInt 1..1 MS
* valuePositiveInt ^label = "How many months in the current financial Year?"


Extension: IhrisRcvSalaryExt
Id:         ihris-rcvsalary-ext
Title:      "iHRIS rcvSalary extension"
Description: "iHRIS rcvSalary extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only boolean
* valueBoolean 1..1 MS
* valueBoolean ^label = "Does the staff receive salary?"

Extension: IhrisWeekPercentExt
Id:         ihris-weekPercent-ext
Title:      "iHRIS week Percent extension"
Description: "iHRIS week Percent extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only positiveInt
* valuePositiveInt 1..1 MS
* valuePositiveInt ^label = "Percent of Full-Time work week spent on HIV."

Extension: IhrisAnnFringeExt
Id:         ihris-annFringe-ext
Title:      "iHRIS annual fringe extension"
Description: "iHRIS annual fringe extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only positiveInt
* valuePositiveInt 1..1 MS
* valuePositiveInt ^label = "Annual PEPFAR Support (Fringe)"

Extension: IhrisPayMechanismExt
Id:         ihris-payMechanism-ext
Title:      "iHRIS pay mechanism extension"
Description: "iHRIS pay mechanism extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Payment Mechanism"
* valueCoding from IhrisPayMechanismValueSet (required)


Extension: IhrisCommentExt
Id:         ihris-comment-ext
Title:      "iHRIS comment extension"
Description: "iHRIS comment extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only string
* valueString 0..1 MS
* valueString ^label = "Notes/Comments"

Extension: IhrisPrimaryFunctionExt
Id:         ihris-primaryFunction-ext
Title:      "iHRIS primary function extension"
Description: "iHRIS primary function extension"
* ^context.type = #element
* ^context.expression = "PractitionerRole"
* value[x] only string
* valueString 0..1 MS
* valueString ^label = "Primary Function"

/**************************************************
*************E-RHITES CUSTOMIZATIONS***************
***************************************************/

CodeSystem:         IhrisPayMechanism
Id:                 ihris-pay-mechanism
Title:              "Payment Mechanism"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* #1 "Directly through IP"
* #2 "Sub-agreement to CBO/PNFP/PFP/NGO"
* #3 "Sub-agreement to Province/Region"
* #4 "Third Party"

ValueSet:          IhrisPayMechanismValueSet
Id:                ihris-pay-mechanism-ValueSet
Title:             "iHRIS Payment Mechanism ValueSet"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* codes from system IhrisPayMechanism

CodeSystem:         IhrisMERCategory
Id:                 ihris-mer-category
Title:              "MER Category"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* #1 "Lay workers"
* #2 "Other employees"
* #3 "Clinical workers"
* #4 "Laboratory workers"
* #5 "Pharmacy workers"
* #6 "Social service workers"
* #7 "Management workers"

CodeSystem:         IhrisSnu
Id:                 ihris-snu
Title:              "SNU1/Region"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* #1 "Mid Eastern"
* #2 "North East"

CodeSystem:         IhrisPsnu
Id:                 ihris-psnu
Title:              "PSNU/District"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* #1 "Abim District"
* #2 "Budaka District"
* #3 "Bududa District"
* #4 "Bukwo District"
* #5 "Bulambuli District"
* #6 "Butaleja District"
* #7 "Butebo District"
* #8 "Kaabong District"
* #9 "Kapchorwa District"
* #10 "Karenga District"
* #11 "Kibuku District"
* #12 "Kotido District"
* #13 "Kween District"
* #14 "Manafwa District"
* #15 "Mbale District"
* #16 "Moroto District"
* #17 "Namisindwa District"
* #18 "Pallisa District"
* #19 "Sironko District"
* #20 "Tororo District"



CodeSystem:         IhrisProgArea
Id:                 ihris-prog-area
Title:              "Program Area"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* #1 "Care and Treatment"
* #2 "HIV clinical services"
* #3 "HIV Drugs"
* #4 "Above-site: Health management information systems, surveillance, research"
* #5 "Education Assistance"
* #6 "HIV laboratory services"
* #7 "Prevention: Not disaggregated"
* #8 "Psychosocial Support"
* #9 "Testing: not disaggregated"
* #10 "VMMC"
* #11 "Facility-based testing"

ValueSet:          IhrisMERCategoryValueSet
Id:                ihris-mer-category-ValueSet
Title:             "iHRIS MER Category ValueSet"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* codes from system IhrisMERCategory


ValueSet:          IhrisSnuValueSet
Id:                ihris-snu-ValueSet
Title:             "iHRIS SNU ValueSet"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* codes from system IhrisSnu

ValueSet:          IhrisPsnuValueSet
Id:                ihris-psnu-ValueSet
Title:             "iHRIS PSNU ValueSet"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* codes from system IhrisPsnu

ValueSet:          IhrisProgAreaValueSet
Id:                ihris-prog-area-ValueSet
Title:             "iHRIS Program Area ValueSet"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* codes from system IhrisProgArea


ValueSet:          IhrisFacilityValueSet
Id:                ihris-facility-ValueSet
Title:             "iHRIS Facility ValueSet"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* codes from system IhrisFacility

CodeSystem:         IhrisFacility
Id:                 ihris-facility
Title:              "Facility"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* #1 "Facility 1" "Facility 1"
* #2 "Facility 2" "Facility 2"
* #3 "Facility 3" "Facility 3"


ValueSet:          IhrisLevelValueSet
Id:                ihris-level-ValueSet
Title:             "iHRIS Level ValueSet"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* codes from system IhrisLevel

CodeSystem:         IhrisLevel
Id:                 ihris-level
Title:              "Employment Level"
* ^date = "2021-01-02T11:49:10.362Z"
* ^version = "0.1.0"
* #1 "Site Level"
* #2 "Above-Site Level"


ValueSet:          IhrisServiceProvidedValueSet
Id:                ihris-service-provided-ValueSet
Title:             "iHRIS Service Provided ValueSet"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* codes from system IhrisServiceProvided

CodeSystem:         IhrisServiceProvided
Id:                 ihris-service-provided
Title:              "Service Provided"
* ^date = "2021-01-02T11:49:10.362Z"
* ^version = "0.1.0"
* #1 "Service Delivery"
* #2 "Non-Service Delivery"


ValueSet:          IhrisEmploymentValueSet
Id:                ihris-employment-ValueSet
Title:             "iHRIS Employment Titles ValueSet"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* codes from system IhrisEmployment

CodeSystem:         IhrisEmployment
Id:                 ihris-employment
Title:              "Employment titles"
* ^date = "2021-01-02T11:49:10.362Z"
* ^version = "0.1.0"
* #1 "Accountants"
* #2 "Administrators"
* #3 "Data capturers"
* #4 "Data clerks"
* #5 "Date reporting officers"
* #6 "Doctors"
* #7 "Drivers"
* #8 "Executive managers"
* #9 "Expert clients"
* #10 "Laboratory technicians"
* #11 "Lay mentors"
* #12 "Medical directors"
* #13 "Medical assitants"
* #14 "Messengers"
* #15 "Monitoring and evaluation advisor"
* #16 "Mother mentors"
* #17 "Nurses"
* #18 "Nurses midwives"
* #19 "Pharmacy dispensators"
* #20 "Pharmacy technicians"
* #21 "Security guards"
* #22 "Social workers"
* #23 "Laboratory managers"
* #24 "Laboratory QI specialists"
* #25 "Medical assistants"
* #26 "Monitoring and evaluation advisors"
* #27 "Nurse practitioners"
* #28 "Peer educators"
* #29 "Data reporting officers"
* #30 "Volunteer community workers"


ValueSet:          IhrisEmploymentStatusValueSet
Id:                ihris-employment-status-ValueSet
Title:             "iHRIS Employment status ValueSet"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* codes from system IhrisEmploymentStatus

CodeSystem:         IhrisEmploymentStatus
Id:                 ihris-employmentStatus
Title:              "Employment status"
* ^date = "2021-01-02T11:49:10.362Z"
* ^version = "0.1.0"
* #1 "Active Full Time"


ValueSet:          IhrisServiceDeliveryValueSet
Id:                ihris-service-delivery-ValueSet
Title:             "iHRIS Service delivery type ValueSet"
* ^date = "2020-12-02T11:49:10.362Z"
* ^version = "0.1.0"
* codes from system IhrisServiceDelivery

CodeSystem:         IhrisServiceDelivery
Id:                 ihris-serviceDelivery
Title:              "Service Delivery Type"
* ^date = "2021-01-02T11:49:10.362Z"
* ^version = "0.1.0"
* #1 "Direct Service Delivery (DSD)"
* #2 "Technical Assistance (TA)"
/**********************************************
****************END E-RHITES*******************
***********************************************/
Instance:       ihris-page-practitionerrole
InstanceOf:     IhrisPage
Title:          "iHRIS PractitionerRole Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-job-description)
* extension[display].extension[link].extension[field].valueString = "PractitionerRole.practitioner.reference"
* extension[display].extension[link].extension[text].valueString = "View Health Worker"
* extension[display].extension[link].extension[button].valueBoolean = true
* extension[display].extension[link].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Practitioner|PractitionerRole.practitioner"
* extension[display].extension[search][1].valueString = "Employment (cadre)|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-employment-ext').valueCoding.display"
* extension[display].extension[search][2].valueString = "MER Cadre|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-MERCategory-ext').valueCoding.display"
* extension[display].extension[search][3].valueString = "Facility|PractitionerRole.location"
* extension[display].extension[search][4].valueString = "SNU/Region|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-snu-ext').valueCoding.display"
* extension[display].extension[search][5].valueString = "PSNU/District|PractitionerRole.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-psnu-ext').valueCoding.display"


/*
* extension[display].extension[filter][0].valueString = "Employment (cadre)|code[0].coding[0]|http://ihris.org/fhir/ValueSet/ihris-job-ethiopia"
* extension[display].extension[filter][1].valueString = "Facility|PractitionerRole.location:location"
* extension[display].extension[filter][2].valueString = "MER Cadre|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-MERCategory-ext').valueCoding:text|http://ihris.org/fhir/ValueSet/ihris-mer-category-ValueSet"
* extension[display].extension[filter][3].valueString = "SNU/Region|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-snu-ext').valueCoding:text|http://ihris.org/fhir/ValueSet/ihris-snu-valueset"
* extension[display].extension[filter][4].valueString = "PSNU/District|PractitionerRole.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-psnu-ext'):text|http://ihris.org/fhir/ValueSet/ihris-psnu-valueset"
* extension[display].extension[field][0].extension[path].valueString = "PractitionerRole.practitioner"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
*/


/*
* extension[section][0].extension[title].valueString = "Position"
* extension[section][0].extension[description].valueString = "Position details"
* extension[section][0].extension[name].valueString = "PractitionerRole"

* extension[section][0].extension[field][0].valueString = "PractitionerRole.code"
* extension[section][0].extension[field][1].valueString = "PractitionerRole.practitioner"
* extension[section][0].extension[field][2].valueString = "PractitionerRole.location"

* extension[section][0].extension[field][3].valueString = "PractitionerRole.extension:cadre.value[x]:valueCoding.display"
* extension[section][0].extension[field][4].valueString = "PractitionerRole.extension:MERcategory.value[x]:valueCoding.display"
* extension[section][0].extension[field][5].valueString = "PractitionerRole.extension:snu1.value[x]:valueCoding.display"
* extension[section][0].extension[field][6].valueString = "PractitionerRole.extension:psnu.value[x]:valueCoding.display"
* extension[section][0].extension[field][7].valueString = "PractitionerRole.extension:progarea.value[x]:valueCoding.display"
* extension[section][0].extension[field][7].valueString = "PractitionerRole.extension:payMechanism.value[x]:valueCoding.display"
*/
/*
* extension[section][0].extension[field][8].valueString = "PractitionerRole.extension:salaryScale.value[x]:valueCoding.display"
* extension[section][0].extension[field][9].valueString = "PractitionerRole.extension:salary.value[x]:valueMoney.display"

*/

/*
* extension[section][0].extension[field][3].valueString = "PractitionerRole.extension:directorate.value[x]:valueCoding.display"
* extension[section][0].extension[field][4].valueString = "PractitionerRole.extension:caseteam.value[x]:valueCoding.display"
* extension[section][0].extension[field][5].valueString = "PractitionerRole.extension:firstEmploymentDate.value[x]:valueDate"
* extension[section][0].extension[field][6].valueString = "PractitionerRole.period"
* extension[section][0].extension[field][7].valueString = "PractitionerRole.extension:jobType.value[x]:valueCoding.display"
* extension[section][0].extension[field][8].valueString = "PractitionerRole.extension:salaryScale.value[x]:valueCoding.display"
* extension[section][0].extension[field][9].valueString = "PractitionerRole.extension:salary.value[x]:valueMoney.display"

*/