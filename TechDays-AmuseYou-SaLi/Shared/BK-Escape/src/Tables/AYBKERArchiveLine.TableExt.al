tableextension 74422 "AYBKER Archive Line" extends "AYBK Booking Arch. Line"
{
    fields
    {
        modify("Booked Unit")
        {
            TableRelation = if ("Booking Type" = const(Escape)) "AYER Escape Room" where(Blocked = const(false));
        }
    }
}
