tableextension 74410 "AYBKBU Ledger" extends "AYBK Booking Ledger"
{
    fields
    {
        modify("Booked Unit No.")
        {
            TableRelation = if ("Booking Type" = const(Bounce)) "AYBU Bounce Unit" where(Blocked = const(false));
        }
    }
}
