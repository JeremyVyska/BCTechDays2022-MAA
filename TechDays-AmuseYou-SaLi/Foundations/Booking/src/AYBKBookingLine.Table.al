table 74291 "AYBK Booking Line"
{
    Caption = 'Booking Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Booking No."; Code[20])
        {
            Caption = 'Booking No.';
            DataClassification = CustomerContent;
            TableRelation = "AYBK Booking Header";
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
        field(11; "Booking Type"; Enum "AY Amusement Type")
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


    local procedure SetPriceFromBookedUnit(BookedType: Enum "AY Amusement Type"; BookedUnit: Code[20]): Decimal
    var
        BookableAmusementImpl: Interface "AY IBookableAmusement";
    begin
        BookableAmusementImpl := BookedType;
        exit(BookableAmusementImpl.SetPriceFromBookedUnit(BookedUnit));
    end;

    local procedure ValidateDateUnitCombo()
    var
        AYBookingManagement: Codeunit "AYBK Booking Management";
    begin
        if (Rec."Booked Unit" <> '') and (Rec.Date <> 0D) then
            AYBookingManagement.ValidateBookingDate(Rec);
    end;

    local procedure ValidateBookedUnit()
    var
        BookableAmusementImpl: Interface "AY IBookableAmusement";
    begin
        BookableAmusementImpl := Rec."Booking Type";
        BookableAmusementImpl.ValidateBookedUnit(Rec."Booked Unit");
    end;
}
