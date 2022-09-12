codeunit 74400 "AYBKLA BookableAmusement" implements "AY IBookableAmusement"
{
    procedure SetPriceFromBookedUnit(BookedUnitNo: Code[20]) DailyPrice: Decimal
    var
        LaserArena: Record "AYLA Laser Arena";
    begin
        LaserArena.Get(BookedUnitNo);
        DailyPrice := LaserArena."Price Per Day";
        OnAfterGetDailyPrice(LaserArena, DailyPrice);
    end;

    procedure ValidateBookedUnit(BookedUnitNo: Code[20]) Valid: Boolean
    var
        LaserArena: Record "AYLA Laser Arena";
        IsHandled: Boolean;
    begin
        LaserArena.Get(BookedUnitNo);
        OnBeforeValidate(LaserArena, Valid, IsHandled);
        if IsHandled then
            exit(Valid);
        LaserArena.TestField("Arena Posting Group");
        LaserArena.TestField(Blocked, false);
        LaserArena.TestField("Price Per Day");
        exit(true);
    end;

    procedure GetBookingChargeAccount(BookedUnitNo: Code[20]) GLAccountNo: Code[20]
    var
        LaserArena: Record "AYLA Laser Arena";
        AYLAArenaPostingGroup: Record "AYLA Arena Posting Group";
        IsHandled: Boolean;
    begin
        LaserArena.Get(BookedUnitNo);
        OnBeforeGetBookingChargeAccount(LaserArena, GLAccountNo, IsHandled);
        if IsHandled then
            exit(GLAccountNo);
        AYLAArenaPostingGroup.Get(LaserArena."Arena Posting Group");
        exit(AYLAArenaPostingGroup."Sales G/L Account");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetDailyPrice(LaserArena: Record "AYLA Laser Arena"; var DailyPrice: Decimal)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidate(LaserArena: Record "AYLA Laser Arena"; var Valid: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetBookingChargeAccount(LaserArena: Record "AYLA Laser Arena"; var GLAccountNo: Code[20]; var IsHandled: Boolean)
    begin
    end;
}
