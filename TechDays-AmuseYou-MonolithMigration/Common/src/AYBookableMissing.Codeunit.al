codeunit 74280 "AY Bookable Missing" implements "AY IBookableAmusement"
{
    procedure SetPriceFromBookedUnit(BookedUnitNo: Code[20]): Decimal
    var
        UnimplementedErr: Label 'Unimplemented Bookable Type. Contact a system administrator.';
    begin
        Error(UnimplementedErr);
    end;

    procedure ValidateBookedUnit(BookedUnitNo: Code[20]): Boolean
    var
        UnimplementedErr: Label 'Unimplemented Bookable Type. Contact a system administrator.';
    begin
        Error(UnimplementedErr);
    end;

    procedure GetBookingChargeAccount(BookedUnitNo: Code[20]) GLAccountNo: Code[20]
    var
        UnimplementedErr: Label 'Unimplemented Bookable Type. Contact a system administrator.';
    begin
        Error(UnimplementedErr);
    end;
}
