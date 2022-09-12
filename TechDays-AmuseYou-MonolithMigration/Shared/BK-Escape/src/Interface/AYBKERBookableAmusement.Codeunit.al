codeunit 74420 "AYBKER BookableAmusement" implements "AY IBookableAmusement"
{
    procedure SetPriceFromBookedUnit(BookedUnitNo: Code[20]) DailyPrice: Decimal
    var
        EscapeRoom: Record "AYER Escape Room";
    begin
        EscapeRoom.Get(BookedUnitNo);
        DailyPrice := EscapeRoom."Price Per Day";
        OnAfterGetDailyPrice(EscapeRoom, DailyPrice);
    end;

    procedure ValidateBookedUnit(BookedUnitNo: Code[20]) Valid: Boolean
    var
        EscapeRoom: Record "AYER Escape Room";
        IsHandled: Boolean;
    begin
        EscapeRoom.Get(BookedUnitNo);
        OnBeforeValidate(EscapeRoom, Valid, IsHandled);
        if IsHandled then
            EscapeRoom.TestField("Escape Posting Group");
        EscapeRoom.TestField(Blocked, false);
        EscapeRoom.TestField("Price Per Day");
        exit(true);
    end;

    procedure GetBookingChargeAccount(BookedUnitNo: Code[20]) GLAccountNo: Code[20]
    var
        EscapeRoom: Record "AYER Escape Room";
    begin
        EscapeRoom.Get(BookedUnitNo);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetDailyPrice(EscapeRoom: Record "AYER Escape Room"; var DailyPrice: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidate(EscapeRoom: Record "AYER Escape Room"; var Valid: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetBookingChargeAccount(EscapeRoom: Record "AYER Escape Room"; var GLAccountNo: Code[20]; var IsHandled: Boolean)
    begin
    end;
}
