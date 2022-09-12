tableextension 74420 "AYBKER Ledger" extends "AYBK Booking Ledger"
{
    fields
    {
        modify("Booked Unit No.")
        {
            TableRelation = if ("Booking Type" = const(Escape)) "AYER Escape Room" where(Blocked = const(false));
        }
    }
}
