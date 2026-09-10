namespace project_incident_management;

using {
    cuid,
    managed
} from '@sap/cds/common';


entity incident : cuid, managed {
    name : String;
    description : String;
    incidentnumber : Int16;
    type : String;;
}


entity incident_status : cuid, managed {
    active = 'ACTIVE';
    inactive = 'INACTIVE';
    incident : Association to incident;
}