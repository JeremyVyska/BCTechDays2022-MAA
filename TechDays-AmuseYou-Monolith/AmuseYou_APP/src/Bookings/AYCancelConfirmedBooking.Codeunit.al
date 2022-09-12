codeunit 74103 "AY Cancel Confirmed Booking"
{
    TableNo = "AY Booking Ledger";
    Permissions = tabledata "AY Booking Ledger" = m;

    trigger OnRun()
    begin
        CancelBookingLedger(Rec);
    end;

    local procedure CancelBookingLedger(Rec: Record "AY Booking Ledger")
    begin
        Rec.Cancelled := True;
        Rec.Modify(true);
    end;
}
