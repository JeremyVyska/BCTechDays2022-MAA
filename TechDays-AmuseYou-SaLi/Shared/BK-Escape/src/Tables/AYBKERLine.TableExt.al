tableextension 74421 "AYBKER Line" extends "AYBK Booking Line"
{
    fields
    {
        modify("Booked Unit")
        {
            TableRelation = if ("Booking Type" = const(Escape)) "AYER Escape Room" where(Blocked = const(false));
        }
    }
}
