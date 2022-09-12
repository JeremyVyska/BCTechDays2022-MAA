codeunit 74100 "AY Booking Management"
{

    procedure ValidateBookingDate(AYBookingLine: Record "AY Booking Line")
    var
        AYBookingLine2: Record "AY Booking Line";
        AYBookingLedger: Record "AY Booking Ledger";
        FutureDateRequiredErr: Label 'Bookings must be in the future.';
        ConfirmedBookingConflictErr: Label 'There is already a confirmed booking for %1 on %2.';
        UnconfirmedBookingConflictMsg: Label 'There is already an unconfirmed Booking for this %1 on %2.';
    begin
        // Check the date is a future date first
        if (AYBookingLine.Date <= WorkDate()) then
            Error(FutureDateRequiredErr);

        // Check for uncancelled confirmed booking for this date
        AYBookingLedger.SetRange("Booking Type", AYBookingLine."Booking Type");
        AYBookingLedger.SetRange("Booked Unit No.", AYBookingLine."Booked Unit");
        AYBookingLedger.SetRange(Cancelled, false);
        AYBookingLedger.SetRange("Booking Date", AYBookingLine.Date);
        if not AYBookingLedger.IsEmpty then
            Error(ConfirmedBookingConflictErr, AYBookingLine."Booked Unit", AYBookingLine.Date);


        // Check if there's a conflicting Booking Line
        AYBookingLine2.SetRange("Booking Type", AYBookingLine."Booking Type");
        AYBookingLine2.SetRange("Booked Unit", AYBookingLine."Booked Unit");
        AYBookingLine2.SetRange(Date, AYBookingLine.Date);
        AYBookingLine2.SetFilter("Booking No.", '<>%1', AYBookingLine."Booking No.");
        if not AYBookingLine2.IsEmpty then
            Message(UnconfirmedBookingConflictMsg, AYBookingLine."Booked Unit", AYBookingLine.Date);
    end;
}
