tableextension 74431 "AYBKTX Line" extends "AYBK Booking Line"
{
    fields
    {
        modify("Booked Unit")
        {
            TableRelation = if ("Booking Type" = const(Track)) "AYTX Track" where(Blocked = const(false));
        }
    }
}
