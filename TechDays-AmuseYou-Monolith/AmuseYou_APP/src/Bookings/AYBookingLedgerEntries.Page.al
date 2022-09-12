page 74123 "AY Booking Ledger Entries"
{
    ApplicationArea = All;
    Caption = 'Booking Ledger Entries';
    PageType = List;
    SourceTable = "AY Booking Ledger";
    UsageCategory = History;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                    ApplicationArea = All;
                }
                field("Registering Date"; Rec."Registering Date")
                {
                    ToolTip = 'Specifies the value of the Registering Date field.';
                    ApplicationArea = All;
                }
                field("Sell-To Customer No."; Rec."Sell-To Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                }
                field("Sales Invoice No."; Rec."Sales Invoice No.")
                {
                    ToolTip = 'Specifies the value of the Sales Invoice No. field.';
                    ApplicationArea = All;
                }
                field("Booking Date"; Rec."Booking Date")
                {
                    ToolTip = 'Specifies the value of the Booking Date field.';
                    ApplicationArea = All;
                }
                field("Booking No."; Rec."Booking No.")
                {
                    ToolTip = 'Specifies the value of the Booking No. field.';
                    ApplicationArea = All;
                }
                field("Booking Type"; Rec."Booking Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Booking Type field.';
                }
                field("Booked Unit No."; Rec."Booked Unit No.")
                {
                    ToolTip = 'Specifies the value of the Booked Unit No. field.';
                    ApplicationArea = All;
                }
                field(Price; Rec."Price")
                {
                    ToolTip = 'Specifies the value of the Price field.';
                    ApplicationArea = All;
                }
                field(Cancelled; Rec.Cancelled)
                {
                    ToolTip = 'Specifies the value of the Cancelled field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CancelledEntriesAction)
            {
                ApplicationArea = All;
                Image = CancelledEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                PromotedIsBig = true;
                Enabled = not Rec.Cancelled;
                Caption = 'Cancel Booking';
                ToolTip = 'This will mark the selected confirmed Booking Ledger Entries as cancelled.';

                trigger OnAction()
                var
                    AYBookingLedger: Record "AY Booking Ledger";
                    AYCancelConfirmedBooking: Codeunit "AY Cancel Confirmed Booking";
                    CancelSingleBookingQst: Label 'Are you sure you want to cancel the Booking for %1 on %2?';
                    CancelMultipleBookings: Label 'Are you sure you want to cancel %1 Bookings?';
                begin
                    Clear(AYCancelConfirmedBooking);
                    CurrPage.SetSelectionFilter(AYBookingLedger); // This sets the AYBookingLedger variable to match which lines the User selected with Select More

                    if AYBookingLedger.Count = 1 then begin
                        // a single entry is selected, so we can be more specific in the inquiry step
                        if Confirm(CancelSingleBookingQst, false, Rec."Booked Unit No.", Rec."Booking Date") then
                            AYCancelConfirmedBooking.Run(Rec);
                    end else begin
                        // the user has selected multiple entries, so ask if they're sure with a count
                        if Confirm(CancelMultipleBookings, false, AYBookingLedger.Count) then begin
                            AYBookingLedger.FindFirst();
                            repeat
                                Clear(AYCancelConfirmedBooking);
                                AYCancelConfirmedBooking.Run(Rec);
                            until AYBookingLedger.Next() = 0;
                        end;
                    end;
                end;
            }

        }
    }
}
