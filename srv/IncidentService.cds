using {
    project_incident_management as db
} from '../db/schema';


service IncidentService {

    @odata.draft.enabled
    entity Incidents
        as projection on db.Incident;

    @readonly
    entity IncidentStatuses
        as projection on db.IncidentStatus;

            @readonly
    entity Incident_Statuses
        as projection on db.Incident_status;
}