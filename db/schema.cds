namespace project_incident_management;

using {
    cuid,
    managed
} from '@sap/cds/common';


entity Incident : cuid, managed {
    name           : String;
    description    : String;
    incidentnumber : Int16;
    type           : String;
    //  status         : Association to one Incident_status;
    status         : Association to one IncidentStatus;
}

entity IncidentStatus {
    key code           : current_status;
        description    : String;
        start_incident : Date;
        end_incident   : Date;
}

type current_status : String(20) enum {
    active = 'NEW';
    closed = 'CLOSED';
    in_progress = 'IN PROGRESS'; // TBD: need to think how to check time for in progress

}

// entity Incident_status : cuid, managed {
//     description    : String;
//     start_incident : Date;
//     end_incident   : Date;
//     status         : current_status = case
//                                           when end_incident is not null
//                                                then 'CLOSED'
//                                           else 'NEW'
//                                       end;
//     incident       : Association to one Incident;
// }
