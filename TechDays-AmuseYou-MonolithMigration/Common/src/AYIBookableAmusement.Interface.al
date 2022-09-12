interface "AY IBookableAmusement"
{
    procedure SetPriceFromBookedUnit(BookedUnitNo: Code[20]): Decimal;

    procedure ValidateBookedUnit(BookedUnitNo: Code[20]): Boolean;

    procedure GetBookingChargeAccount(BookedUnitNo: Code[20]) GLAccountNo: Code[20];
}
