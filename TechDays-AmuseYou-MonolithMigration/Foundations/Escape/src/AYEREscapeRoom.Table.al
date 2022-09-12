table 74220 "AYER Escape Room"
{
    Caption = 'Escape Room';
    DataClassification = ToBeClassified;
    LookupPageId = "AYER Escape Room List";
    DrillDownPageId = "AYER Escape Room List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = SystemMetadata;
        }
        field(10; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(11; "Escape Room Type"; Code[10])
        {
            Caption = 'Escape Room Type';
            DataClassification = SystemMetadata;
            TableRelation = "AYER Escape Room Type";
        }
        field(12; "Target Age Group"; Enum "AY Target Age Group")
        {
            Caption = 'Target Age Group';
            DataClassification = CustomerContent;
        }
        field(21; "Price Per Day"; Decimal)
        {
            Caption = 'Price Per Day';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 2;
            BlankZero = true;
        }
        field(25; "Suggested Minimum People"; Integer)
        {
            Caption = 'Suggested Minimum People';
            DataClassification = CustomerContent;
            BlankZero = true;
            MinValue = 0;
        }
        field(26; "Suggested Maximum People"; Integer)
        {
            Caption = 'Suggested Maximum People';
            DataClassification = CustomerContent;
            BlankZero = true;
            MinValue = 0;
        }
        field(29; "Avg. Completion Time (Minutes)"; Integer)
        {
            Caption = 'Avg. Completion Time (Minutes)';
            DataClassification = CustomerContent;
            BlankZero = true;
            MinValue = 0;
        }
        field(30; "Last Inspection Date"; Date)
        {
            Caption = 'Last Inspection Date';
            DataClassification = CustomerContent;
        }
        field(40; "Escape Posting Group"; Code[10])
        {
            Caption = 'Escape Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "AYER Escape Posting Group";
        }
        field(41; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
        }
        field(50; Blocked; Boolean)
        {
            Caption = 'Blocked';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if Rec.Blocked then
                    OnAfterBlocked(Rec);
            end;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        EscapeSetup: Record "AY Amusements Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            EscapeSetup.Get();
            EscapeSetup.TestField("Escape No. Series");
            NoSeriesMgt.InitSeries(EscapeSetup."Escape No. Series", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    procedure CheckEscapeUnitForBooking()
    begin
        TestField("Escape Posting Group");
        TestField(Blocked, false);
        TestField("Price Per Day");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterBlocked(Rec: Record "AYER Escape Room")
    begin
    end;
}
