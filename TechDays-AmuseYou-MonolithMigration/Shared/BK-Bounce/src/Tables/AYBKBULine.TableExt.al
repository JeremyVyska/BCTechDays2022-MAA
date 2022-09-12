tableextension 74411 "AYBKBU Line" extends "AYBK Booking Line"
{
    fields
    {
        modify("Booked Unit")
        {
            TableRelation = if ("Booking Type" = const(Bounce)) "AYBU Bounce Unit" where(Blocked = const(false));
        }
    }
}
