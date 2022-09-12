table 74114 "AY Booking Line"
{
    Caption = 'Booking Line';
    DataClassification = ToBeClassified;

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
            TableRelation = if ("Booking Type" = const(Bounce)) "AY Bounce Unit" where(Blocked = const(false)) else
            if ("Booking Type" = const(Arena)) "AY Laser Arena" where(Blocked = const(false)) else
            if ("Booking Type" = const(Track)) "AY GK Track" where(Blocked = const(false)) else
            if ("Booking Type" = const(Escape)) "AY Escape Room" where(Blocked = const(false));

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
    var
        AYBounceUnit: Record "AY Bounce Unit";
    begin
        if AYBounceUnit.get(BookedUnit) then begin
            AYBounceUnit.TestField("Price Per Day");
            exit(AYBounceUnit."Price Per Day");
        end;

    end;

    local procedure ValidateDateUnitCombo()
    var
        AYBookingManagement: Codeunit "AY Booking Management";
    begin
        if (Rec."Booked Unit" <> '') and (Rec.Date <> 0D) then
            AYBookingManagement.ValidateBookingDate(Rec);
    end;

    local procedure ValidateBookedUnit()
    var
        AYBounceUnit: Record "AY Bounce Unit";
    begin
        if (Rec."Booked Unit" <> '') then
            case Rec."Booking Type" of
                Rec."Booking Type"::Bounce:
                    if AYBounceUnit.Get(Rec."Booked Unit") then
                        AYBounceUnit.CheckBounceUnitForBooking();
            end;
    end;
}
