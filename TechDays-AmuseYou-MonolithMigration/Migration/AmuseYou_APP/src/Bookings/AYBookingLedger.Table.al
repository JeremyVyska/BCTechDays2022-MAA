table 74117 "AY Booking Ledger"
{
    Caption = 'Booking Ledger';
    DataClassification = ToBeClassified;

    ObsoleteReason = 'Moved to SaLi Structure';
    ObsoleteState = Pending;
    ObsoleteTag = '2022-09-01';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; "Registering Date"; Date)
        {
            Caption = 'Registering Date';
            DataClassification = CustomerContent;
        }
        field(3; "Sales Invoice No."; Code[20])
        {
            Caption = 'Sales Invoice No.';
            DataClassification = CustomerContent;
            TableRelation = "Sales Invoice Header";
        }
        field(4; "Sell-To Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = Customer;
        }
        field(5; "Booking Date"; Date)
        {
            Caption = 'Booking Date';
            DataClassification = CustomerContent;
        }
        field(6; "Booking No."; Code[20])
        {
            Caption = 'Booking No.';
            DataClassification = CustomerContent;
            TableRelation = "AY Booking Arch. Header";
        }
        field(10; "Booking Type"; Enum "AY Booking Type")
        {
            Caption = 'Booking Type';
            DataClassification = CustomerContent;
        }
        field(11; "Booked Unit No."; Code[20])
        {
            Caption = 'Booked Unit No.';
            DataClassification = CustomerContent;
            TableRelation = if ("Booking Type" = const(Bounce)) "AY Bounce Unit" where(Blocked = const(false)) else
            if ("Booking Type" = const(Arena)) "AY Laser Arena" where(Blocked = const(false)) else
            if ("Booking Type" = const(Track)) "AY GK Track" where(Blocked = const(false)) else
            if ("Booking Type" = const(Escape)) "AY Escape Room" where(Blocked = const(false));
        }
        field(15; Price; Decimal)
        {
            Caption = 'Price';
            DataClassification = CustomerContent;
        }
        field(20; Cancelled; Boolean)
        {
            Caption = 'Cancelled';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
