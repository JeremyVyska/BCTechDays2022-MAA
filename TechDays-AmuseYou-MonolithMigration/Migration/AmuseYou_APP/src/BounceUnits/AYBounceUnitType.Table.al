table 74112 "AY Bounce Unit Type"
{
    Caption = 'Bounce Unit Type';
    DataClassification = ToBeClassified;

    ObsoleteReason = 'Moved to SaLi Structure';
    ObsoleteState = Pending;
    ObsoleteTag = '2022-09-01';

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = SystemMetadata;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
