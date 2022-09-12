codeunit 74293 "AYBK Cancel Confirmed Booking"
{
    TableNo = "AYBK Booking Ledger";
    Permissions = tabledata "AYBK Booking Ledger" = m;

    trigger OnRun()
    begin
        CancelBookingLedger(Rec);
    end;

    local procedure CancelBookingLedger(Rec: Record "AYBK Booking Ledger")
    begin
        Rec.Cancelled := True;
        Rec.Modify(true);
    end;
}
