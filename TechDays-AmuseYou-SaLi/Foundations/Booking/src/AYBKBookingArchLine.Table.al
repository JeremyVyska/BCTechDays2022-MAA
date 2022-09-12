table 74293 "AYBK Booking Arch. Line"
{
    Caption = 'Archive Booking Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Booking No."; Code[20])
        {
            Caption = 'Booking No.';
            DataClassification = CustomerContent;
            TableRelation = "AYBK Booking Arch. Header";
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
        field(11; "Booking Type"; Enum "AY Amusement Type")
        {
            Caption = 'Booking Type';
            DataClassification = CustomerContent;
        }
        field(12; "Booked Unit"; Code[20])
        {
            Caption = 'Booked Unit';
            DataClassification = CustomerContent;
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
