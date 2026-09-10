import cds from '@sap/cds';

import Before_Create_Draft_Incidents
    from './Code/IncidentService/Before_Create_Draft_Incidents.js';

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

        return super.init();
    }
}