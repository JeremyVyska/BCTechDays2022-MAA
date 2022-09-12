tableextension 74430 "AYBKTX Ledger" extends "AYBK Booking Ledger"
{
    fields
    {
        modify("Booked Unit No.")
        {
            TableRelation = if ("Booking Type" = const(Track)) "AYTX Track" where(Blocked = const(false));
        }
    }
}
