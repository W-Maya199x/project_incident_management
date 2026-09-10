using IncidentService from '../../IncidentService';


annotate IncidentService.Incidents with {
    name        @mandatory;
    description @mandatory;
    incidentnumber @mandatory;
    type       @mandatory;

};
