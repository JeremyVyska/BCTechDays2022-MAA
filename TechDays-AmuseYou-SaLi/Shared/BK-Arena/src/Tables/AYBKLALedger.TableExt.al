tableextension 74400 "AYBKLA Ledger" extends "AYBK Booking Ledger"
{
    fields
    {
        modify("Booked Unit No.")
        {
            TableRelation = if ("Booking Type" = const(Arena)) "AYLA Laser Arena" where(Blocked = const(false));
        }
    }
}
