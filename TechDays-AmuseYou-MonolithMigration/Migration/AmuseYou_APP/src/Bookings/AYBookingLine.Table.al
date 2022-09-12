table 74114 "AY Booking Line"
{
    Caption = 'Booking Line';
    DataClassification = ToBeClassified;

    ObsoleteReason = 'Moved to SaLi Structure';
    ObsoleteState = Pending;
    ObsoleteTag = '2022-09-01';

    fields
    {
        field(1; "Booking No."; Code[20])
        {
            Caption = 'Booking No.';
            DataClassification = CustomerContent;
            TableRelation = "AY Booking Header";
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

            trigger OnValidate()
            begin
                ValidateDateUnitCombo();
            end;
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

            trigger OnValidate()
            begin
                ValidateBookedUnit();
                ValidateDateUnitCombo();
                Rec.Price := SetPriceFromBookedUnit(Rec."Booking Type", Rec."Booked Unit");
            end;
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


    local procedure SetPriceFromBookedUnit(BookedType: Enum "AY Booking Type"; BookedUnit: Code[20]): Decimal
    begin

    end;

    local procedure ValidateDateUnitCombo()
    begin

    end;

    local procedure ValidateBookedUnit()
    begin
    end;
}
