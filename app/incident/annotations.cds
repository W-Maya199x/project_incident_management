using IncidentService as service from '../../srv/IncidentService';

annotate service.Incidents with @(

    UI.HeaderInfo : {

        TypeName : 'Incident',

        TypeNamePlural : 'Incidents',

        Title : {

            Value : name,

        },

        Description : {

            Value : incidentnumber,

        },

    },

    UI.FieldGroup #GeneratedGroup : {

        $Type : 'UI.FieldGroupType',

        Data : [

            {

                $Type : 'UI.DataField',

                Label : 'Name',

                Value : name,

            },

            {

                $Type : 'UI.DataField',

                Label : 'Description',

                Value : description,

            },

            {

                $Type : 'UI.DataField',

                Label : 'Incident Number',

                Value : incidentnumber,

            },

            {

                $Type : 'UI.DataField',

                Label : 'Type',

                Value : type,

            },

            {

                $Type : 'UI.DataField',

                Label : 'Status',

                Value : status_code,

                Criticality : (case

                    when status.code = 'CLOSED'

                        then 3

                    when status.code = 'IN PROGRESS'

                        then 2

                    when status.code = 'NEW'

                        then 1

                end),

            },
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },

        ],

    },

    UI.Facets : [

        {

            $Type : 'UI.ReferenceFacet',

            ID : 'GeneratedFacet1',

            Label : 'General Information',

            Target : '@UI.FieldGroup#GeneratedGroup',

        },

        {

            $Type : 'UI.ReferenceFacet',

            Label : 'Managed Information',

            ID : 'ManagedInformation',

            Target : '@UI.FieldGroup#ManagedInformation',

        },

    ],

    UI.LineItem : [

        {

            $Type : 'UI.DataField',

            Label : 'Incident Number',

            Value : incidentnumber,

        },

        {

            $Type : 'UI.DataField',

            Label : 'Name',

            Value : name,

        },

        {

            $Type : 'UI.DataField',

            Label : 'Description',

            Value : description,

        },

        {

            $Type : 'UI.DataField',

            Label : 'Type',

            Value : type,

        },

        {

            $Type : 'UI.DataField',

            Label : 'Status',

            Value : status_code,

            Criticality : (case

                when status.code = 'CLOSED'

                    then 3

                when status.code = 'IN PROGRESS'

                    then 2

                when status.code = 'NEW'

                    then 1

            end),

        },

    ],

    UI.FieldGroup #ManagedInformation : {

        $Type : 'UI.FieldGroupType',

        Data : [

            {

                $Type : 'UI.DataField',

                Label : 'Created On',

                Value : createdAt,

            },

            {

                $Type : 'UI.DataField',

                Label : 'Created By',

                Value : createdBy,

            },

            {

                $Type : 'UI.DataField',

                Label : 'Changed On',

                Value : modifiedAt,

            },

            {

                $Type : 'UI.DataField',

                Label : 'Changed By',

                Value : modifiedBy,

            },

        ],

    },

);

annotate service.Incidents with {

    status @Common.ValueList : {

        $Type : 'Common.ValueListType',

        CollectionPath : 'IncidentStatuses',

        Parameters : [

            {

                $Type : 'Common.ValueListParameterInOut',

                LocalDataProperty : status_code,

                ValueListProperty : 'code',

            },

            {

                $Type : 'Common.ValueListParameterDisplayOnly',

                ValueListProperty : 'description',

            },

        ],

    };

};