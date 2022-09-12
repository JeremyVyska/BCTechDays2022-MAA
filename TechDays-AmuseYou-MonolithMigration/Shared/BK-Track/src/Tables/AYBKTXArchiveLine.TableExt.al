tableextension 74432 "AYBKTX Archive Line" extends "AYBK Booking Arch. Line"
{
    fields
    {
        modify("Booked Unit")
        {
            TableRelation = if ("Booking Type" = const(Track)) "AYTX Track" where(Blocked = const(false));
        }
    }
}
