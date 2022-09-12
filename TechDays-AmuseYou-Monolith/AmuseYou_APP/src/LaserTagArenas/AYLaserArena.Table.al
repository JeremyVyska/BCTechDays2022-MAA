table 74101 "AY Laser Arena"
{
    Caption = 'Laser Arena';
    DataClassification = ToBeClassified;
    LookupPageId = "AY Laser Arena List";
    DrillDownPageId = "AY Laser Arena List";

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
        field(11; "Laser Arena Type"; Code[10])
        {
            Caption = 'Laser Arena Type';
            DataClassification = SystemMetadata;
            TableRelation = "AY Laser Arena Type";
        }
        field(12; "Target Age Group"; Enum "AY Target Age Group")
        {
            Caption = 'Target Age Group';
            DataClassification = CustomerContent;
        }
        field(20; "Maximum Player Count"; Integer)
        {
            Caption = 'Maximum Player Count';
            DataClassification = CustomerContent;
            BlankZero = true;
            MinValue = 0;
        }
        field(21; "Price Per Day"; Decimal)
        {
            Caption = 'Price Per Day';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 2;
            BlankZero = true;
        }
        field(30; "Last Inspection Date"; Date)
        {
            Caption = 'Last Inspection Date';
            DataClassification = CustomerContent;
        }
        field(31; "Serial No."; Text[100])
        {
            Caption = 'Serial No.';
            DataClassification = CustomerContent;
        }
        field(40; "Arena Posting Group"; Code[10])
        {
            Caption = 'Arena Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "AY Arena Posting Group";
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
                    WarnIfPendingBookings();
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
        ArenaSetup: Record "AY Amusements Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            ArenaSetup.Get();
            ArenaSetup.TestField("Arena No. Series");
            NoSeriesMgt.InitSeries(ArenaSetup."Arena No. Series", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    local procedure WarnIfPendingBookings()
    var
        AYBookingLine: Record "AY Booking Line";
        AYBookingLedger: Record "AY Booking Ledger";
        WarningPendingBookings: Label 'There are unconfirmed or confirmed Bookings for this unit.';
    begin
        // Any unconfirmed booking
        AYBookingLine.SetRange("Booking Type", AYBookingLine."Booking Type"::Arena);
        AYBookingLine.SetRange("Booked Unit", Rec."No.");

        // Any future uncancelled confirmed booking'
        AYBookingLedger.SetRange("Booking Type", AYBookingLedger."Booking Type"::Arena);
        AYBookingLedger.SetRange("Booked Unit No.", Rec."No.");
        AYBookingLedger.SetRange(Cancelled, false);
        AYBookingLedger.SetFilter("Booking Date", '%1..', WorkDate());

        if (not AYBookingLine.IsEmpty) or (not AYBookingLedger.IsEmpty) then
            Message(WarningPendingBookings);
    end;

    procedure CheckArenaUnitForBooking()
    begin
        TestField("Arena Posting Group");
        TestField(Blocked, false);
        TestField("Price Per Day");
    end;
}
