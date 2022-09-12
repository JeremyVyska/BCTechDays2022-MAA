table 74104 "AY Bounce Unit"
{
    Caption = 'Bounce Unit';
    DataClassification = ToBeClassified;

    ObsoleteReason = 'Moved to SaLi Structure';
    ObsoleteState = Pending;
    ObsoleteTag = '2022-09-01';

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
        field(11; "Bounce Unit Type"; Code[10])
        {
            Caption = 'Bounce Unit Type';
            DataClassification = SystemMetadata;
            TableRelation = "AY Bounce Unit Type";
        }
        field(12; "Target Age Group"; Enum "AY Target Age Group")
        {
            Caption = 'Target Age Group';
            DataClassification = CustomerContent;
        }
        field(20; "Purchase Date"; Date)
        {
            Caption = 'Purchase Date';
            DataClassification = CustomerContent;
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
        field(40; "Bounce Posting Group"; Code[10])
        {
            Caption = 'Bounce Posting Group';
            DataClassification = SystemMetadata;
            TableRelation = "AY Bounce Posting Group";
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
        BounceSetup: Record "AY Amusements Setup OBS";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            BounceSetup.Get();
            BounceSetup.TestField("Bounce No. Series");
            NoSeriesMgt.InitSeries(BounceSetup."Bounce No. Series", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    local procedure WarnIfPendingBookings()
    var
        AYBookingLine: Record "AY Booking Line";
        AYBookingLedger: Record "AY Booking Ledger";
        WarningPendingBookings: Label 'There are unconfirmed or confirmed Bookings for this unit.';
    begin
        // Any unconfirmed booking
        AYBookingLine.SetRange("Booking Type", AYBookingLine."Booking Type"::Bounce);
        AYBookingLine.SetRange("Booked Unit", Rec."No.");

        // Any future uncancelled confirmed booking'
        AYBookingLedger.SetRange("Booking Type", AYBookingLedger."Booking Type"::Bounce);
        AYBookingLedger.SetRange("Booked Unit No.", Rec."No.");
        AYBookingLedger.SetRange(Cancelled, false);
        AYBookingLedger.SetFilter("Booking Date", '%1..', WorkDate());

        if (not AYBookingLine.IsEmpty) or (not AYBookingLedger.IsEmpty) then
            Message(WarningPendingBookings);
    end;

    procedure CheckBounceUnitForBooking()
    begin
        TestField("Bounce Posting Group");
        TestField(Blocked, false);
        TestField("Price Per Day");
    end;
}