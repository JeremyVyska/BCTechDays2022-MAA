tableextension 74401 "AYBKLA Line" extends "AYBK Booking Line"
{
    fields
    {
        modify("Booked Unit")
        {
            TableRelation = if ("Booking Type" = const(Arena)) "AYLA Laser Arena" where(Blocked = const(false));
        }
    }
}
