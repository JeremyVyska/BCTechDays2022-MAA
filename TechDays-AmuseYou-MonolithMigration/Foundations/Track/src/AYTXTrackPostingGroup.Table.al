table 74231 "AYTX Track Posting Group"
{
    Caption = 'Track Posting Group';
    DataClassification = ToBeClassified;

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
        field(10; "Sales G/L Account"; Code[10])
        {
            Caption = 'Sales G/L Account';
            DataClassification = SystemMetadata;
            TableRelation = "G/L Account" where("Direct Posting" = const(true));
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
