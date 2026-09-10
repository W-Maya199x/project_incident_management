import cds from '@sap/cds';

import Before_Create_Draft_Incidents
    from './Code/IncidentService/Before_Create_Draft_Incidents.js';

import Validate_Incident_Status_Change
    from './Code/IncidentService/Validate_Incident_Status_Change.js';

export default class IncidentService extends cds.ApplicationService {

    init() {

        const {
            Incidents
        } = this.entities;

        this.before(
            'CREATE',
            Incidents.drafts,
            Before_Create_Draft_Incidents
        );

        this.before(
            'UPDATE',
            Incidents.drafts,
            Validate_Incident_Status_Change
        );

        return super.init();
    }
}