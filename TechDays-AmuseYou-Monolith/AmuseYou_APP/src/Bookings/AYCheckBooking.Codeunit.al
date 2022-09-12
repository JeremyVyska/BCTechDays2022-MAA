codeunit 74101 "AY Check Booking"
{
    TableNo = "AY Booking Header";

    trigger OnRun()
    var
        AYBookingLine: Record "AY Booking Line";
        BookingDatePastErr: Label 'Booking %1 for %2 is not a future date.';
        NothingToPostErr: Label 'There are no Booking Lines to post.';
    begin
        Rec.TestField("Sell-To Customer No.");

        AYBookingLine.SetRange("Booking No.", Rec."No.");
        if AYBookingLine.FindSet() then
            repeat
                AYBookingLine.TestField("Booked Unit");
                AYBookingLine.TestField(Date);
                AYBookingLine.TestField(Price);

                if AYBookingLine.Date <= WorkDate() then
                    Error(BookingDatePastErr, AYBookingLine.Date, AYBookingLine."Booked Unit");
            until AYBookingLine.Next() = 0
        else
            Error(NothingToPostErr);
    end;
}
