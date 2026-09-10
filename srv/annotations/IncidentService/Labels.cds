using IncidentService from '../../IncidentService';


annotate IncidentService.Incidents with {
    name           @title : 'Name';
    description    @title : 'Description';
    incidentnumber @title : 'Incident Number';
    type           @title : 'Type';
    status          @title : 'Status';
};