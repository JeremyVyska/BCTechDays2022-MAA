table 74116 "AY Booking Arch. Line"
{
    Caption = 'Archive Booking Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Booking No."; Code[20])
        {
            Caption = 'Booking No.';
            DataClassification = CustomerContent;
            TableRelation = "AY Booking Arch. Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = SystemMetadata;
        }
        field(10; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(11; "Booking Type"; Enum "AY Booking Type")
        {
            Caption = 'Booking Type';
            DataClassification = CustomerContent;
        }
        field(12; "Booked Unit"; Code[20])
        {
            Caption = 'Booked Unit';
            DataClassification = CustomerContent;
            TableRelation = if ("Booking Type" = const(Bounce)) "AY Bounce Unit" where(Blocked = const(false)) else
            if ("Booking Type" = const(Arena)) "AY Laser Arena" where(Blocked = const(false)) else
            if ("Booking Type" = const(Track)) "AY GK Track" where(Blocked = const(false)) else
            if ("Booking Type" = const(Escape)) "AY Escape Room" where(Blocked = const(false));
        }
        field(13; Price; Decimal)
        {
            Caption = 'Price';
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 2;
            BlankZero = true;
        }
    }
    keys
    {
        key(PK; "Booking No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
