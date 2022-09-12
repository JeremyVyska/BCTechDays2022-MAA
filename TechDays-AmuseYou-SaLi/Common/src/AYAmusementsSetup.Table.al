table 74280 "AY Amusements Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {

        }

        field(10; "Bounce No. Series"; Code[10])
        {
            Caption = 'Bounce No. Series';
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }

        field(11; "Booking No. Series"; Code[10])
        {
            Caption = 'Booking No. Series';
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }
        field(12; "Escape No. Series"; Code[10])
        {
            Caption = 'Escape No. Series';
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }
        field(13; "Track No. Series"; Code[10])
        {
            Caption = 'Track No. Series';
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }
        field(14; "Arena No. Series"; Code[10])
        {
            Caption = 'Arena No. Series';
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }

    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        RecordHasBeenRead: Boolean;

    procedure GetRecordOnce()
    begin
        if RecordHasBeenRead then
            exit;
        Rec.Get();
        RecordHasBeenRead := true;
    end;

    procedure InsertIfNotExists()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert(true);
        end;
    end;


}