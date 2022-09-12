codeunit 74410 "AYBKBU BookableAmusement" implements "AY IBookableAmusement"
{
    procedure SetPriceFromBookedUnit(BookedUnitNo: Code[20]) DailyPrice: Decimal
    var
        BounceUnit: Record "AYBU Bounce Unit";
    begin
        BounceUnit.Get(BookedUnitNo);
        DailyPrice := BounceUnit."Price Per Day";
        OnAfterGetDailyPrice(BounceUnit, DailyPrice);
    end;

    procedure ValidateBookedUnit(BookedUnitNo: Code[20]) Valid: Boolean
    var
        BounceUnit: Record "AYBU Bounce Unit";
        IsHandled: Boolean;
    begin
        BounceUnit.Get(BookedUnitNo);
        OnBeforeValidate(BounceUnit, Valid, IsHandled);
        if IsHandled then
            BounceUnit.TestField("Bounce Posting Group");
        BounceUnit.TestField(Blocked, false);
        BounceUnit.TestField("Price Per Day");
        exit(true);
    end;

    procedure GetBookingChargeAccount(BookedUnitNo: Code[20]) GLAccountNo: Code[20]
    var
        BounceUnit: Record "AYBU Bounce Unit";
    begin
        BounceUnit.Get(BookedUnitNo);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetDailyPrice(BounceUnit: Record "AYBU Bounce Unit"; var DailyPrice: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidate(BounceUnit: Record "AYBU Bounce Unit"; var Valid: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetBookingChargeAccount(BounceUnit: Record "AYBU Bounce Unit"; var GLAccountNo: Code[20]; var IsHandled: Boolean)
    begin
    end;
}
