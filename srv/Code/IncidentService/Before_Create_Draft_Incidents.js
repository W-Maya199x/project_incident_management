export default function Before_Create_Draft_Incidents(req) {

    if (!req.data.status_code) {
        req.data.status_code = 'NEW';
    }
}