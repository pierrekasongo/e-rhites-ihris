const path = require('path');
const fs = require('fs');
const csv=require('csvtojson');
const moment = require('moment');
const url=require('url');
const mappingConfig = require('../config/resources-mapping');
const _ = require('underscore');
const http = require('http')
const axios = require('axios')
const Fhir = require('fhir').Fhir

var csvHeaderData=[]
 var csvHeaderData=csvHeaderData.concat(mappingConfig.app.headersData); 
const profilePECCsvConverter={
    noheader:false,
    trim:true,
    headers:csvHeaderData
};

exports.createPractitionerFromCSV = function readCSVData(filePath,callback)
{
    //var csvHeaderData=csvHeaderData.concat(headersData);
    var records=[];
    csv(profilePECCsvConverter).fromFile(filePath).then((jsonObj)=>{

        records = records.concat(jsonObj);

        let bundle = {
            resourceType: "Bundle",
            type: "transaction",
            entry:[]
          }

        records.forEach(rc => {

            let dt =  ""

            let birthdate = rc.birthDate;

            if(birthdate === "")
                birthdate = "1900-01-01";
            
            dt = birthdate.split("-");

            let d = dt[0];

            let dob="";

            if(d <= 31){
                dob = dt[2]+"-"+dt[1]+"-"+dt[0];
            }else dob = birthdate;

            practitioner = {
              resourceType: "Practitioner", 
              id:rc.personid,
              meta:{
                lastUpdated: "2021-02-17T21:32:37.945+02:00",
                profile: [ "http://ihris.org/fhir/StructureDefinition/ihris-personal-information" ]
              },
              extension:[{
                url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-nationality",
                valueCoding: {
                  system: "urn:iso:std:iso:3166",
                  code: "UG",
                  display: "Uganda"
                }
              },
              {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-uid",
                valueString: rc.uid
              },
              {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-related-group",
                extension: [ {
                  url: "practitioner",
                    valueString: "Practitioner/"+rc.personid
                } ]
              } ],
              identifier: [ {
                type: {
                  coding: [ {
                    system: "http://terminology.hl7.org/CodeSystem/v2-0203",
                    code: "CZ",
                    display: "Citizenship Card"
                  } ]
                },
                value: rc.id_num
              } ],
              name: [ {
                text:rc.middlename,
                family: rc.lastname,
                given: rc.firstname
              } ],
              gender: rc.gender.toLowerCase(),
              birthDate: dob
            }

            bundle.entry.push(practitioner)
         
        });
          
        callback(bundle);
    });
}

exports.createPractitionerRoleFromCSV = function readCSVData(filePath,callback)
{
    //var csvHeaderData=csvHeaderData.concat(headersData);
    var records=[];

    csv(profilePECCsvConverter).fromFile(filePath).then((jsonObj)=>{

        records = records.concat(jsonObj);

        let bundle = {
            resourceType: "Bundle",
            type: "transaction",
            entry:[]
          }

        records.forEach(rc => {

            practitionerRole = {
              resourceType: "PractitionerRole", 
              id:rc.id,
              meta:{
                lastUpdated: "2021-02-17T21:32:37.945+02:00",
                profile: [ "http://ihris.org/fhir/StructureDefinition/ihris-job-description" ]
              },
              extension: [ {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-employment-ext",
                valueCoding: {
                  system: "http://ihris.org/fhir/CodeSystem/ihris-employment",
                  code: rc.employment_id,
                  display: rc.employment
                }
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-MERCategory-ext",
                valueCoding: {
                  system: "http://ihris.org/fhir/CodeSystem/ihris-mer-category",
                  code: rc.mer_category_id,
                  display: rc.mer_category
                }
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-snu-ext",
                valueCoding: {
                  system: "http://ihris.org/fhir/CodeSystem/ihris-snu",
                  code: rc.snu_id,
                  display: rc.snu
                }
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-psnu-ext",
                valueCoding: {
                  system: "http://ihris.org/fhir/CodeSystem/ihris-psnu",
                  code: rc.psnu_id,
                  display: rc.psnu
                }
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-progarea-ext",
                valueCoding: {
                  system: "http://ihris.org/fhir/CodeSystem/ihris-prog-area",
                  code: rc.prog_area_id,
                  display: rc.prog_area.replace("|",",")
                }
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-primaryFunction-ext",
                valueString: rc.primary_function.replace("|",",")
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-serviceDelivery-ext",
                valueCoding: {
                  system: "http://ihris.org/fhir/CodeSystem/ihris-serviceDelivery",
                  code: rc.service_delivery_id,
                  display: rc.service_delivery
                }
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-monthnum-ext",
                valuePositiveInt: rc.month_number
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-employmentStatus-Ext",
                valueCoding: {
                  system: "http://ihris.org/fhir/CodeSystem/ihris-employmentStatus",
                  code: rc.emp_status_id,
                  display: rc.emp_status
                }
              },{
                url: "http://ihris.org/fhir/StructureDefinition/ihris-payMechanism-ext",
                valueCoding: {
                  system: "http://ihris.org/fhir/CodeSystem/ihris-pay-mechanism",
                  code: rc.pay_mechanism_id,
                  display: rc.pay_mechanism
                }
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-annualSalary-Ext",
                valuePositiveInt: rc.annual_salary
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-annualStipend-Ext",
                valuePositiveInt: rc.annual_stipend
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-annualNonMonetary-Ext",
                valuePositiveInt: rc.annual_non_monetary
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-totalAnnual-Ext",
                valuePositiveInt: rc.total_annual
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-totalExpenditure-Ext",
                valuePositiveInt: rc.total_expenditure
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-includeFringe-Ext",
                valueBoolean: rc.include_fringe //(true, false)
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-annFringe-ext",
                valuePositiveInt: rc.annual_fringe
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-rcvcompensation-Ext",
                valueBoolean: rc.rcv_compensation
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-rcvMonetaryComp-Ext",
                valueBoolean: rc.rcv_monetary_comp//(true, false)
              },
              {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-withinMOH-schedule-Ext",
                valueBoolean: rc.within_moh
              }, 
              {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-level-Ext",
                valueCoding: {
                  system: "http://ihris.org/fhir/CodeSystem/ihris-level",
                  code: rc.level_id,
                  display: rc.level
                }
              },
               {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-service-provided-Ext",
                valueCoding: {
                  system: "http://ihris.org/fhir/CodeSystem/ihris-service-provided",
                  code: rc.service_provided_id,
                  display: rc.service_provided
                }
              },
              {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-sourceComp-Ext",
                valueString: rc.source_compensation
              }, {
                url: "http://ihris.org/fhir/StructureDefinition/ihris-related-group",
                extension: [ {
                  url: "practitioner",
                  valueString: "Practitioner/"+rc.practitionerid
                } ]
              } ],
                active: true,
                period: {
                    "start": rc.start_date
                },
              practitioner: {
                reference: "Practitioner/"+rc.practitionerid
              },
              location: [ {
                reference: "Location/"+rc.locationid
              } ]
            }

            bundle.entry.push(practitionerRole)
         
        });
          
        callback(bundle);
    });
}

exports.readCSVData=function readCSVData(filePath,callback)
{
    //var csvHeaderData=csvHeaderData.concat(headersData);
    var fileRecords=[];
    csv(profilePECCsvConverter).fromFile(filePath).then((jsonObj)=>{
        fileRecords=fileRecords.concat(jsonObj);
        callback(fileRecords);
    });
}
exports.buildPractitioner=function buildPractitioner(recordsPractitioner){
    //console.log(ageGroupRange);
    let bundle={
        resourceType:"Bundle",
        type:"history",
        total:0,
        entry:[]
    };
    let listPractitioners=[];
    //Get the mapping profile for the Practitioner
    var practitionerMapping=mappingConfig.mapping.find(mapping=>mapping.resourceType=="Practitioner");
    var practitionerMappingFields=practitionerMapping.fieldsMapping.filter(fieldMapping=>fieldMapping.active==true);


    //console.log(practitionerMappingFields);
    for(let record of recordsPractitioner)
	{
        var practitioner={
            resourceType: "Practitioner",
            meta: {
                profile: [
                    mappingConfig.configs.practitionerProfile
                ]
              },
            active:true
            
        };
        var practitionerName={
            use:"official"
        }
        var practitionerTelecom={
            use:mappingConfig.configs.defaultTelecomPhoneAttributes.use,
            system:mappingConfig.configs.defaultTelecomPhoneAttributes.system
        }
        var codeElement={valueCoding:{}, url: "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-nationality", valueString:{url:": http://ihris.org/fhir/StructureDefinition/ihris-practitioner-uid"}};

       for(let mappingObject of practitionerMappingFields)
       {
            if(record.hasOwnProperty(mappingObject.csvfieldId))
            {
                if(mappingObject.fhirBaseElement=="Practitioner")
                {
                    if(mappingObject.fhirField=="gender" && record[mappingObject.csvfieldId]!="NULL")
                    {
                        practitioner[mappingObject.fhirField]=record[mappingObject.csvfieldId];
                    }
                    else if(mappingObject.fhirField!="gender")
                    {
                        practitioner[mappingObject.fhirField]=record[mappingObject.csvfieldId];
                    }
                    
                } 
                if(mappingObject.fhirBaseElement=="name"){
                    switch(mappingObject.fhirField)
                    {
                        case "text":
                            practitionerName[mappingObject.fhirField]=record[mappingObject.csvfieldId];
                        break;
                        case "family":
                            practitionerName[mappingObject.fhirField]=record[mappingObject.csvfieldId];
                        break;
                        case "given":
                            practitionerName[mappingObject.fhirField]=[record[mappingObject.csvfieldId]];
                        break;
                    }
                }
                if(mappingObject.fhirBaseElement=="nationality"){
                    
                    switch(mappingObject.fhirField)
                    {
                        case code:
                            codeElement.valueCoding[mappingObject.fhirField]=record[mappingObject.csvfieldId];
                        break;
                        case display:
                            codeElement.valueCoding[mappingObject.fhirField]=record[mappingObject.csvfieldId];
                        break;
                        case "text":
                            codeElement[mappingObject.fhirField]=record[mappingObject.csvfieldId];
                        break;
                    }
                }

                if(mappingObject.fhirBaseElement=="uid"){
                    
                    switch(mappingObject.fhirField)
                    {
                        case "valueString":
                            codeElement.valueString[mappingObject.fhirField]=record[mappingObject.csvfieldId];
                        break;
                    }
                }
                /*
                if(mappingObject.fhirBaseElement=="code"){
                    switch(mappingObject.fhirField)
                    {
                        case code:
                            codeElement.coding[0][mappingObject.fhirField]=record[mappingObject.csvfieldId];
                        break;
                        case display:
                            codeElement.coding[0][mappingObject.fhirField]=record[mappingObject.csvfieldId];
                        break;
                        case "text":
                            codeElement[mappingObject.fhirField]=record[mappingObject.csvfieldId];
                        break;
                    }
                }*/
                if(mappingObject.fhirBaseElement=="telecom"){
                    if(mappingObject.fhirField=="value" && 
                    mappingConfig.configs.appendCountryCodeToPhoneNumber.append===true)
                    {
                        practitionerTelecom[mappingObject.fhirField]=`${mappingConfig.configs.appendCountryCodeToPhoneNumber.value }${record[mappingObject.csvfieldId]}`;
                    }
                    if(mappingObject.fhirField=="value" && 
                    mappingConfig.configs.appendCountryCodeToPhoneNumber.append===false)
                    {
                        practitionerTelecom[mappingObject.fhirField]=record[mappingObject.csvfieldId];
                    }
                    if(mappingObject.fhirField!="value")
                    {
                        practitionerTelecom[mappingObject.fhirField]=record[mappingObject.csvfieldId];
                    }
                    
                }
            }
       }
       if(practitionerName.hasOwnProperty("text")||practitionerName.hasOwnProperty("family")||
       practitionerName.hasOwnProperty("given"))
       {
            practitioner["name"]=[practitionerName];
       }
       if(practitionerTelecom.hasOwnProperty("value")){
            practitioner["telecom"]=[practitionerTelecom];
       }
       if(codeElement.valueCoding.hasOwnProperty("nationality")||codeElement.valueCoding.hasOwnProperty("display"))
       {
        practitioner["extension"]=[codeElement];
       }
       /*if(codeElement.valueString.hasOwnProperty("uid"))
       {
            practitioner.extension.push([codeElement]);
       }*/
       
       listPractitioners.push(practitioner);
    }
    if(listPractitioners.length>0){
        bundle.total=listPractitioners.length;
        for(let practitioner of listPractitioners){
            bundle.entry.push(
                {
                    resource:practitioner
                }
            );
        }
    }
    console.log(bundle.entry)
    return bundle;
}
exports.buildPractitionerRole=function buildPractitionerRole(recordsPractitioner){
    //console.log(ageGroupRange);
    let bundle={
        resourceType:"Bundle",
        type:"history",
        total:0,
        entry:[]
    };
    let listPractitionersRole=[];
    //Get the mapping profile for the Practitioner
    var practitionerRoleMapping=mappingConfig.mapping.find(mapping=>mapping.resourceType=="PractitionerRole");
    var practitionerRoleMappingFields=practitionerRoleMapping.fieldsMapping.filter(fieldMapping=>fieldMapping.active==true);
    //console.log(practitionerMappingFields);
    for(let record of recordsPractitioner)
	{
        var practitionerRole={
            resourceType: "PractitionerRole",
            meta: {
                profile: [
                    mappingConfig.configs.practitionerRoleProfile
                ]
              },
            active:true
            
        };
        var codeElement={coding:[{}]};
       for(let mappingObject of practitionerRoleMappingFields)
       {
            if(record.hasOwnProperty(mappingObject.csvfieldId))
            {
                if(mappingObject.fhirBaseElement=="PractitionerRole")
                {
                    practitionerRole[mappingObject.fhirField]=record[mappingObject.csvfieldId];
                } 
                if(mappingObject.fhirBaseElement=="code"){
                    switch(mappingObject.fhirField)
                    {
                        case code:
                            codeElement.coding[0][mappingObject.fhirField]=record[mappingObject.csvfieldId];
                        break;
                        case display:
                            codeElement.coding[0][mappingObject.fhirField]=record[mappingObject.csvfieldId];
                        break;
                        case "text":
                            codeElement[mappingObject.fhirField]=record[mappingObject.csvfieldId];
                        break;
                    }
                }
                if(mappingObject.fhirBaseElement=="Practitioner"){
                    practitionerRole[mappingObject.fhirField]={reference:`Practitioner/${record[mappingObject.csvfieldId]}`};
                }
                if(mappingObject.fhirBaseElement=="Location"){
                    practitionerRole[mappingObject.fhirField]=[{reference:`Location/${record[mappingObject.csvfieldId]}`}];
                }
            }
       }
       if(codeElement.coding[0].hasOwnProperty("code")||codeElement.coding[0].hasOwnProperty("display")||
       codeElement.hasOwnProperty("text"))
       {
        //codeElement.coding[0]['system']="http://ihris.org/fhir/CodeSystem/ihris-job";
        practitionerRole["code"]=[codeElement];
       }
       
       listPractitionersRole.push(practitionerRole);
    }
    //return listPractitionersRole;
    if(listPractitionersRole.length>0){
        bundle.total=listPractitionersRole.length;
        for(let practitionerRole of listPractitionersRole){
            bundle.entry.push(
                {
                    resource:practitionerRole
                }
            );
        }
    }
    return bundle;
}
exports.buildLocation=function buildLocation(recordsPractitioner){
    //console.log(ageGroupRange);
    let bundle={
        resourceType:"Bundle",
        type:"history",
        total:0,
        entry:[]
    };
    let listLocations=[];
    let recordsJobs=[];
    var locationMapping=mappingConfig.mapping.find(mapping=>mapping.resourceType=="Location");
    var locationMappingFields=locationMapping.fieldsMapping.filter(fieldMapping=>fieldMapping.active==true);
    //Get only location data
    for(let record of recordsPractitioner)
    {
        recordsJobs.push(
            {
                structureid:record['structureid'],
                structure:record['structure']
            }
        );
    }
    let uniqueListIndices= recordsPractitioner.map(item=>item.structureid).filter((value,index,self)=>self.indexOf(value) === index);
    //Get the mapping profile for the Location

    for(let locationid of  uniqueListIndices)
    {
        let locationRecord=recordsJobs.find(record=>record.structureid==locationid);
        var location={
            resourceType: "Location",
            status:"active",
            mode: "instance"
        };
        for(let mappingObject of locationMappingFields)
        {
            if(locationRecord.hasOwnProperty(mappingObject.csvfieldId))
            {
                if(mappingObject.fhirBaseElement=="Location")
                {
                    location[mappingObject.fhirField]=locationRecord[mappingObject.csvfieldId];
                } 
            }
       }
       listLocations.push(location);

    }
    //console.log(uniqueListIndices);
    //return listLocations;
    if(listLocations.length>0){
        bundle.total=listLocations.length;
        for(let resource of listLocations){
            bundle.entry.push(
                {
                    resource:resource
                }
            );
        }
    }
    return bundle;
}
exports.buildJob=function buildJob(recordsPractitioner){
    //console.log(ageGroupRange);
    let bundle={
        resourceType:"Bundle",
        type:"history",
        total:0,
        entry:[]
    };
    let listJobs=[];
    let recordsJob=[];
    var jobMapping=mappingConfig.mapping.find(mapping=>mapping.resourceType=="Job-ValueSet");
    var jobMappingFields=jobMapping.fieldsMapping.filter(fieldMapping=>fieldMapping.active==true);
    //Get only location data
    for(let record of recordsPractitioner)
    {
        recordsJob.push(
            {
                specialiteid:record['specialiteid'],
                specialite:record['specialite']
            }
        );
    }
    let uniqueListIndices= recordsPractitioner.map(item=>item.specialiteid).filter((value,index,self)=>self.indexOf(value) === index);
    //Get the mapping profile for the Location
    var job={
        resourceType: "ValueSet",
        contact: [
            {
              telecom: [
                {
                  system: "url",
                  value: "http://ihris.org"
                }
              ]
            }
          ],
        compose:{
            include:[
                {
                    //system: "http://ihris.org/fhir/CodeSystem/ihris-job",
                    concept:[]
                }
            ]
        }
    };
    var listDefaultAttributeKeys=Object.keys(mappingConfig.configs.jobValueSetDefaultAttributes);
    for(let key of listDefaultAttributeKeys){
        job[key]=mappingConfig.configs.jobValueSetDefaultAttributes[key];
    }
    for(let jobId of  uniqueListIndices)
    {
        var concept={};
        let jobRecord=recordsJob.find(record=>record.specialiteid==jobId);
        
        for(let mappingObject of jobMappingFields)
        {
            if(jobRecord.hasOwnProperty(mappingObject.csvfieldId))
            {
                if(mappingObject.fhirBaseElement=="ValueSet")
                {
                    job[mappingObject.fhirField]=jobRecord[mappingObject.csvfieldId];
                } 
                if(mappingObject.fhirBaseElement=="concept")
                {
                    concept[mappingObject.fhirField]=jobRecord[mappingObject.csvfieldId]
                }
            }
       }
       job.compose.include[0].concept.push(concept);
       //listJobs.push(job);

    }
    //console.log(uniqueListIndices);
    listJobs.push(job);
    //return listJobs;
    if(listJobs.length>0){
        bundle.total=listJobs.length;
        for(let resource of listJobs){
            bundle.entry.push(
                {
                    resource:resource
                }
            );
        }
    }
    return bundle;
}






/************************************ Old source code************************************************ */
exports.buildTEI=function buildTEI(fileData,trackedEntityTypeId,ageGroupRange,programId){
    //console.log(ageGroupRange);
    let createdTEI=[];
    for(let record of fileData)
	{
       
        /* if((record.num_dossier && record.num_dossier=="") && (record.Sexe && record.Sexe=="") 
        && (record.Age && record.Age=="")) */
        if(record.num_dossier=="" && record.Sexe=="" && record.Age=="")
        {
            continue;
        }
        var  optionsForSexeMasc=['masculin','m'];
        var optionsForSexeFem=['feminin','féminin','f'];
        var sexe;
        let createdDate;
        let dateDiagnostic;
        if(record['Date_diagnostic_HTA'] && record['Date_diagnostic_HTA']!="")
        {
            dateDiagnostic=record['Date_diagnostic_HTA'];
        }
        else if(record['Date_visite'] && record['Date_visite']!="")
        {
            dateDiagnostic=record['Date_visite'];
        }
        let returnedDate=getValidDate(dateDiagnostic);
        if(returnedDate==null)
        {
            createdDate=new Date('2003-01-01');
        }
        else if (returnedDate.getFullYear()<1990){
            createdDate=new Date('2003-01-01');
        }
        else
        {
            createdDate=returnedDate;
        }
        //let createdDate=getValidDate(record['Date_diagnostic HTA']);
        if(record.Sexe && record.Sexe!="")
        {
            if(optionsForSexeMasc.includes(record.Sexe.toLowerCase().trim())){
                sexe='M';
            }
            if(optionsForSexeFem.includes(record.Sexe.toLowerCase().trim())){
                sexe='F';
            }
        }
        
        //Generate age group now
        let generateAgeGroup;
        let dateOfBirth;
        if(record.Age && record.Age!="")
        {
            for(let ageGroup of ageGroupRange){
                let limitMax=ageGroup.interval[1];
                let limitMin=ageGroup.interval[0];
                if(record.Age >= limitMin && record.Age<= limitMax)
                {
                    generateAgeGroup=ageGroup.value;
                    break;
                }
            }
            let ageInMilliseconds=record.Age*365*24*60*60*1000;
            dateOfBirth=new Date(new Date('2020-01-01').getTime()-ageInMilliseconds);
        }
        
        //get DateOfBirth Estimation from the age
       
        
        let tei={
            //trackedEntity:record.TEI,
            created:createdDate,
            trackedEntityInstance:record.TEI,
            orgUnit:record.OrgUnitID,
            trackedEntityType:trackedEntityTypeId,
            attributes:[
                {
                    attribute:"xCB53k0Rb41",
                    value:record.num_dossier
                }
                /*, {
                    attribute:"iYMDdwJ0Kzk",
                    value:sexe
                },
                {
                    attribute:"PGvhNwKGKkH",
                    value:dateOfBirth.toISOString().split("T")[0]
                },
                
                {
                    attribute:"pleUVP7m8LX",
                    value:record.Age
                },
                {
                    attribute:"vjNskFa2nwh",
                    value:generateAgeGroup
                } */

            ],
            enrollments:[
                {
                    orgUnit:record.OrgUnitID,
                    program:programId,
                    enrollmentDate:createdDate,
                    incidentDate:createdDate,
                    status:"ACTIVE"
                }
            ]
        };
        if(sexe)
        {
            tei.attributes.push({
                attribute:"iYMDdwJ0Kzk",
                value:sexe
            });
        }
        if(dateOfBirth)
        {
            tei.attributes.push(
                {
                    attribute:"PGvhNwKGKkH",
                    value:dateOfBirth.toISOString().split("T")[0]
                }
            );
            tei.attributes.push({
                attribute:"pleUVP7m8LX",
                value:record.Age
            });
            tei.attributes.push({
                attribute:"vjNskFa2nwh",
                value:generateAgeGroup
            });
        }

        
        createdTEI.push(tei);
    }
    return createdTEI;
}
exports.buildProvenanceEvents=function buildProvenanceEvents(fileData,programId,programStageId,patientReferenceOptionSets)
{
    let createdEvents=[];
    for(let record of fileData)
	{
        let createdDate;
        let dateDiagnostic;
        if(record['Date_diagnostic_HTA'] && record['Date_diagnostic_HTA']!="")
        {
            dateDiagnostic=record['Date_diagnostic_HTA'];
        }
        else if(record['Date_visite'] && record['Date_visite']!="")
        {
            dateDiagnostic=record['Date_visite'];
        }
        let returnedDate=getValidDate(dateDiagnostic);
        if(returnedDate==null)
        {
            createdDate=new Date('2003-01-01');
        }
        else if (returnedDate.getFullYear() < 1990){
            //continue;
            createdDate=new Date('2003-01-01');
        }
        else
        {
            
            createdDate=returnedDate;
            //console.log(`Null returned date ${}`)
        }
        //console.log(`source=${dateDiagnostic} ==> ${record.TEI} `);
        //let createdDate=getValidDate(record['Date_diagnostic HTA']);
        /* console.log(`Processed TEI: ${record.TEI}`);
        console.log("###################################"); */
        let oEvent={
            program: programId,
            orgUnit: record.OrgUnitID,
            eventDate: createdDate,
            trackedEntityInstance:record.TEI,
            programStage:programStageId,
            //status: "ACTIVE",
            status:"ACTIVE",
            dataValues:[
                //{ dataElement: "JHdsvWnBIXG", value: record['Unite_de_traitement'] },
                //{ dataElement: "WfCKF3dicir", value: createdDate.toISOString().split("T")[0] },
                //{ dataElement: "zZciiFrfmpg", value: createdDate.toISOString().split("T")[0] }
            ]
        };
        if(record['Unite_de_traitement'] && record['Unite_de_traitement']!="")
        {
            oEvent.dataValues.push({ dataElement: "JHdsvWnBIXG", value: record['Unite_de_traitement'] });
        }
        if(returnedDate!=null)
        {
            oEvent.dataValues.push({ dataElement: "WfCKF3dicir", value: createdDate.toISOString().split("T")[0] });
        }
        if(record['Provenance'] && record['Provenance']!=""){
            if(record['Provenance'].toLowerCase().replace(/\s+/g, '').includes("venudelui")||record['Provenance'].toLowerCase().replace(/\s+/g, '').includes("venuedelui"))
            {
                oEvent.dataValues.push( { dataElement: "WMukKGoo8zm", value: true });
            }
            else{
                oEvent.dataValues.push( { dataElement: "WMukKGoo8zm", value: false });
                //console.log(patientReferenceOptionSets);
                var referePar=patientReferenceOptionSets.find(reference=>
                    record['Provenance'].toLowerCase().includes(reference.code));
                if(referePar)
                {
                    oEvent.dataValues.push( { dataElement: "okLzPWiQlXN", value: referePar.value });
                }
                if(returnedDate!=null)
                {
                    oEvent.dataValues.push({ dataElement: "zZciiFrfmpg", value: createdDate.toISOString().split("T")[0] });
                }
                
            }
        }
        createdEvents.push(oEvent);
    }
    return createdEvents;
}
exports.buildSuiviEvents=function buildSuiviEvents(fileData,programId,programStageId,statutPatientOptionSet)
{
    let createdEvents=[];
    for(let record of fileData)
	{
        let createdDate;
        let dateDiagnostic=null;
        if(record['Date_visite'] && record['Date_visite']!="")
        {
            dateDiagnostic=record['Date_visite'];
        }
        else if(record['Date_diagnostic_HTA'] && record['Date_diagnostic_HTA']!="")
        {
            dateDiagnostic=record['Date_diagnostic_HTA'];
        }
        let returnedDate=getValidDate(dateDiagnostic);
        if(returnedDate==null)
        {
            continue;
        } else if (returnedDate.getFullYear()<1990){
            continue;
        }
        else{
            createdDate=returnedDate;
        }
        //let createdDate=getValidDate(record['Date_visite']);
        /*console.log(`Processed TEI: ${record.TEI}`);
        console.log("###################################");*/
        let oEvent={
            program: programId,
            orgUnit: record.OrgUnitID,
            eventDate: createdDate,
            trackedEntityInstance:record.TEI,
            programStage:programStageId,
            status: "ACTIVE",
            dataValues:[
                /*{ dataElement: "G9wQG7w9GqF", value: createdDate.toISOString().split("T")[0] },
                { dataElement: "t0fchUhCuPc", value: record['PA_Bras_Gauche_Dias'] },
                { dataElement: "k0l9iAY1P7g", value: record['PA_Bras_Gauche_Syst'] },
                { dataElement: "iU1pq8kluwL", value: record['MOY_SYSTO'] },
                { dataElement: "pdlCDCu9jiC", value: record['PA_Bras_Droit_Dias'] },
                { dataElement: "oxVe6o7Fn3I", value: record['PA_Bras_Droit_Syst'] }*/

            ]
        };
        if(record['PA_Bras_Gauche_Dias'] && record['PA_Bras_Gauche_Dias']!=""){
            oEvent.dataValues.push({ dataElement: "t0fchUhCuPc", value: record['PA_Bras_Gauche_Dias'] });
        }
        if(record['PA_Bras_Gauche_Syst'] && record['PA_Bras_Gauche_Syst']!=""){
            oEvent.dataValues.push({ dataElement: "k0l9iAY1P7g", value: record['PA_Bras_Gauche_Syst'] });
        }
        if(record['MOY_SYSTO'] && record['MOY_SYSTO']!=""){
            oEvent.dataValues.push({ dataElement: "iU1pq8kluwL", value: record['MOY_SYSTO'] });
        }
        if(record['PA_Bras_Droit_Dias'] && record['PA_Bras_Droit_Dias']!=""){
            oEvent.dataValues.push({ dataElement: "pdlCDCu9jiC", value: record['PA_Bras_Droit_Dias'] });
        }
        if(record['PA_Bras_Droit_Syst'] && record['PA_Bras_Droit_Syst']!=""){
            oEvent.dataValues.push({ dataElement: "oxVe6o7Fn3I", value: record['PA_Bras_Droit_Syst'] });
        }

        if(record['PA_controlee'] && record['PA_controlee']!=""){
            let paControlee;
            if(record['PA_controlee'].toLowerCase().trim()=="oui")
            {
                paControlee=true;
            }
            else if(record['PA_controlee'].toLowerCase().trim()=="non")
            {
                paControlee=false;
            }
            oEvent.dataValues.push({ dataElement: "rrKGcWkFGv5", value: paControlee });
        }
        if(record['Traitement'] && record['Traitement']!=""){
            oEvent.dataValues.push({ dataElement: "wDk1IkO7kXQ", value: record['Traitement'] });
        }
        if(record['Suivi_MDH'] && record['Suivi_MDH']!="")
        {
            if(record['Suivi_MDH'].toLowerCase().trim().includes("oui"))
            {
                
                oEvent.dataValues.push({ dataElement: "rd5fO82lcgo", value: "Oui" });
            }
            else if(record['Suivi_MDH'].toLowerCase().trim().includes("non"))
            {
                oEvent.dataValues.push({ dataElement: "rd5fO82lcgo", value: "Non" });
            }
            else if(record['Suivi_MDH'].toLowerCase().trim().includes("parfois"))
            {
                oEvent.dataValues.push({ dataElement: "rd5fO82lcgo", value: "Parfois" });
            }
        }
        if(record['Observance_traitement'] && record['Observance_traitement']!="")
        {
            if(record['Observance_traitement'].toLowerCase().trim().includes("oui"))
            {
                
                oEvent.dataValues.push({ dataElement: "xfJBUxPIKWl", value: "Oui" });
            }
            else if(record['Observance_traitement'].toLowerCase().trim().includes("non"))
            {
                oEvent.dataValues.push({ dataElement: "xfJBUxPIKWl", value: "Non" });
            }
            else if(record['Observance_traitement'].toLowerCase().trim().includes("parfois"))
            {
                oEvent.dataValues.push({ dataElement: "xfJBUxPIKWl", value: "Parfois" });
            }
        }

        if(record['Date_prochain_RDV'] && record['Date_prochain_RDV']!="")
        {
            let dateRDV=getValidDate(record['Date_prochain_RDV']);
            if(dateRDV!=null){
                oEvent.dataValues.push({ dataElement: "fYcYjzdEEM6", value: dateRDV.toISOString().split("T")[0] });
            }
            
        }
        if(record['Statut_patient'] && record['Statut_patient']!="")
        {

            if(record['Statut_patient'].toLowerCase().trim().includes('suivi')){
                var statutPatient=statutPatientOptionSet.find(statut=>statut.code=="suivi");
                oEvent.dataValues.push({ dataElement: "IGrYxqhn6yT", value:statutPatient.value});
            }
            else{
                var statutPatient=statutPatientOptionSet.find(statut=>statut.code=="autre");
                oEvent.dataValues.push({ dataElement: "IGrYxqhn6yT", value:statutPatient.value});
                oEvent.dataValues.push({ dataElement: "wSbntS1AK09", value:record['Statut_patient'].toLowerCase()});
            }
        }
        if(oEvent.dataValues.length==0){
            continue;//skip this event if it does not contains at least one attribute
        }
        if(oEvent.dataValues.length==1 && oEvent.dataValues[0].dataElement=="iU1pq8kluwL" &&  oEvent.dataValues[0].value==0){
            continue;//skip this event if it does contains only MoySyst=0
        }
        oEvent.dataValues.push({ dataElement: "G9wQG7w9GqF", value: createdDate.toISOString().split("T")[0] });
        createdEvents.push(oEvent);
    }
    return createdEvents;
}
exports.buildTEIEnrollment=function buildTEIEnrollment(fileData,programId){
    let createdEnrollment=[];
    for(let record of fileData)
	{
        
        createdDate=getValidDate(record['Date_diagnostic_HTA']);
        let enrollement={
            trackedEntityInstance:record.TEI,
            orgUnit:record.OrgUnitID,
            program:programId,
            enrollmentDate:createdDate,
            incidentDate:createdDate,
            status:"ACTIVE"
        };
        createdEnrollment.push(enrollement);
    }
    return createdEnrollment;
}
//The standard format in the file should be mm/jj/aaaa
function getValidDate(dateString)
{
    if(dateString!=null)
    {
        if(dateString.includes("-")&& dateString.split("-").length==3)
        {
            if(dateString.replace(/-/g,'').match(/^[0-9]+$/)==null)
            {
                //invalid date
                return null;
            }
            let rebuiltDateString="";
            if( parseInt( dateString.split("-")[0])>12 && parseInt( dateString.split("-")[0])<=31)
            {
                rebuiltDateString=`${dateString.split("-")[1]}-${dateString.split("-")[0]}-${dateString.split("-")[2]}`
            }
            else if ( parseInt( dateString.split("-")[0])> 31)
            {
                return null;
            }
            else
            {
                rebuiltDateString=dateString;
            }
            return new Date(rebuiltDateString+" GMT");
        }
        else if(dateString.includes("/")&& dateString.split("/").length==3)
        {
            if(dateString.replace(/\//g,'').match(/^[0-9]+$/)==null)
            {
                //invalid date
                return null;
            }
            let rebuiltDateString="";

            if( parseInt( dateString.split("/")[0])>12 && parseInt( dateString.split("/")[0])<=31)
            {
                rebuiltDateString=`${dateString.split("/")[1]}/${dateString.split("/")[0]}/${dateString.split("/")[2]}`
            }
            else if( parseInt( dateString.split("/")[0])>31)
            {
                //rebuiltDateString=dateString;
                return null;
            }
            else{
                rebuiltDateString=dateString;
            }
            return new Date(rebuiltDateString+" GMT");
        }
        else{
            return null;
        }
    }
    else
    {
        return null;
    }
    
    
}   

exports.getValidDate=getValidDate;