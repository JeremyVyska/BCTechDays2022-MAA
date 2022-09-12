codeunit 74430 "AYBKTX BookableAmusement" implements "AY IBookableAmusement"
{
    procedure SetPriceFromBookedUnit(BookedUnitNo: Code[20]) DailyPrice: Decimal
    var
        Track: Record "AYTX Track";
    begin
        Track.Get(BookedUnitNo);
        DailyPrice := Track."Price Per Day";
        OnAfterGetDailyPrice(Track, DailyPrice);
    end;

    procedure ValidateBookedUnit(BookedUnitNo: Code[20]) Valid: Boolean
    var
        Track: Record "AYTX Track";
        IsHandled: Boolean;
    begin
        Track.Get(BookedUnitNo);
        OnBeforeValidate(Track, Valid, IsHandled);
        if IsHandled then
            Track.TestField("Track Posting Group");
        Track.TestField(Blocked, false);
        Track.TestField("Price Per Day");
        exit(true);
    end;

    procedure GetBookingChargeAccount(BookedUnitNo: Code[20]) GLAccountNo: Code[20]
    var
        Track: Record "AYTX Track";
    begin
        Track.Get(BookedUnitNo);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetDailyPrice(Track: Record "AYTX Track"; var DailyPrice: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidate(Track: Record "AYTX Track"; var Valid: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetBookingChargeAccount(Track: Record "AYTX Track"; var GLAccountNo: Code[20]; var IsHandled: Boolean)
    begin
    end;
}
