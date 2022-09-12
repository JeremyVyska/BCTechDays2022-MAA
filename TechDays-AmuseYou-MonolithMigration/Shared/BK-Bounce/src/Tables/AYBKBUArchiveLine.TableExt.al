tableextension 74412 "AYBKBU Archive Line" extends "AYBK Booking Arch. Line"
{
    fields
    {
        modify("Booked Unit")
        {
            TableRelation = if ("Booking Type" = const(Bounce)) "AYBU Bounce Unit" where(Blocked = const(false));
        }
    }
}
