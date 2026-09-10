import cds from '@sap/cds';

export default async function Validate_Incident_Status_Change(req) {

    if (req.data.status_code !== 'CLOSED') {
        return;
    }

    const incidentID =
        req.data.ID ?? req.params?.[0]?.ID;

    if (!incidentID) {
        return;
    }

    const {
        Incidents
    } = cds.entities('IncidentService');

    const {
        SELECT
    } = cds.ql;

    const currentIncident =
        await SELECT.one
            .from(Incidents.drafts)
            .columns('status_code')
            .where({
                ID : incidentID
            });

    if (currentIncident?.status_code === 'NEW') {

        req.reject(
            400,
            'An Incident cannot be changed directly from NEW to CLOSED.'
        );
    }
}