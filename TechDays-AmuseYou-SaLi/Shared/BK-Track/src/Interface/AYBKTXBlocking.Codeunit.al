codeunit 74431 "AYBKTX Blocking"
{
    [EventSubscriber(ObjectType::Table, Database::"AYTX Track", 'OnAfterBlocked', '', false, false)]
    local procedure WarnIfPendingBookings(Rec: Record "AYTX Track")
    var
        AYBookingLine: Record "AYBK Booking Line";
        AYBookingLedger: Record "AYBK Booking Ledger";
        WarningPendingBookings: Label 'There are unconfirmed or confirmed Bookings for this unit.';
    begin
        // Any unconfirmed booking
        AYBookingLine.SetRange("Booking Type", AYBookingLine."Booking Type"::Track);
        AYBookingLine.SetRange("Booked Unit", Rec."No.");

        // Any future uncancelled confirmed booking'
        AYBookingLedger.SetRange("Booking Type", AYBookingLedger."Booking Type"::Track);
        AYBookingLedger.SetRange("Booked Unit No.", Rec."No.");
        AYBookingLedger.SetRange(Cancelled, false);
        AYBookingLedger.SetFilter("Booking Date", '%1..', WorkDate());

        if (not AYBookingLine.IsEmpty) or (not AYBookingLedger.IsEmpty) then
            Message(WarningPendingBookings);
    end;
}
