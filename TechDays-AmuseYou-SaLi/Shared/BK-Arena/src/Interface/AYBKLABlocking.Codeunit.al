codeunit 74401 "AYBKLA Blocking"
{
    [EventSubscriber(ObjectType::Table, Database::"AYLA Laser Arena", 'OnAfterBlocked', '', false, false)]
    local procedure WarnIfPendingBookings(Rec: Record "AYLA Laser Arena")
    var
        AYBookingLine: Record "AYBK Booking Line";
        AYBookingLedger: Record "AYBK Booking Ledger";
        WarningPendingBookings: Label 'There are unconfirmed or confirmed Bookings for this unit.';
    begin
        // Any unconfirmed booking
        AYBookingLine.SetRange("Booking Type", AYBookingLine."Booking Type"::Arena);
        AYBookingLine.SetRange("Booked Unit", Rec."No.");

        // Any future uncancelled confirmed booking'
        AYBookingLedger.SetRange("Booking Type", AYBookingLedger."Booking Type"::Arena);
        AYBookingLedger.SetRange("Booked Unit No.", Rec."No.");
        AYBookingLedger.SetRange(Cancelled, false);
        AYBookingLedger.SetFilter("Booking Date", '%1..', WorkDate());

        if (not AYBookingLine.IsEmpty) or (not AYBookingLedger.IsEmpty) then
            Message(WarningPendingBookings);
    end;
}
