tableextension 74402 "AYBKLA Archive Line" extends "AYBK Booking Arch. Line"
{
    fields
    {
        modify("Booked Unit")
        {
            TableRelation = if ("Booking Type" = const(Arena)) "AYLA Laser Arena" where(Blocked = const(false));
        }
    }
}
