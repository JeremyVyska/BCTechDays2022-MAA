table 74230 "AYTX Track"
{
    Caption = 'GK Track';
    DataClassification = ToBeClassified;
    LookupPageId = "AYTX Track List";
    DrillDownPageId = "AYTX Track List";

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
        field(11; "GK Track Type"; Code[10])
        {
            Caption = 'GK Track Type';
            DataClassification = SystemMetadata;
            TableRelation = "AYTX Track Type";
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
        field(25; "Maximum Cars"; Integer)
        {
            Caption = 'Maximum Cars';
            DataClassification = CustomerContent;
            BlankZero = true;
            MinValue = 0;
        }
        field(30; "Last Inspection Date"; Date)
        {
            Caption = 'Last Inspection Date';
            DataClassification = CustomerContent;
        }
        field(40; "Track Posting Group"; Code[10])
        {
            Caption = 'Track Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "AYTX Track Posting Group";
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
        TrackSetup: Record "AY Amusements Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            TrackSetup.Get();
            TrackSetup.TestField("Track No. Series");
            NoSeriesMgt.InitSeries(TrackSetup."Track No. Series", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    procedure CheckTrackUnitForBooking()
    begin
        TestField("Track Posting Group");
        TestField(Blocked, false);
        TestField("Price Per Day");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterBlocked(Rec: Record "AYTX Track")
    begin
    end;
}
