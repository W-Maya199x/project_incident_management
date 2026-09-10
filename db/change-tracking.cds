using { project_incident_management.Incident } from './schema';

annotate Incident with @changelog: [incidentnumber, name] {

    name @changelog;

    description @changelog;

    type @changelog;

    status @changelog: [status.code];

};

