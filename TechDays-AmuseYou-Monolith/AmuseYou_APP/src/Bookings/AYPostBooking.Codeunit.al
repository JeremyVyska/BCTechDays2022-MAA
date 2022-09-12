codeunit 74102 "AY Post Booking"
{
    TableNo = "AY Booking Header";

    trigger OnRun()
    var
        AYBookingLine: Record "AY Booking Line";
        BUCheckBooking: Codeunit "AY Check Booking";
    begin
        // Check the Booking first
        BUCheckBooking.Run(Rec);

        GenerateInvoice(Rec);

        GenerateLedgers(Rec);

        ArchiveBooking(Rec);
    end;

    local procedure GenerateInvoice(Rec: Record "AY Booking Header"): Code[20]
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        AYBookingLine: Record "AY Booking Line";
        AYBounceUnit: Record "AY Bounce Unit";
        BUPostingGroup: Record "AY Bounce Posting Group";
        SalesPost: Codeunit "Sales-Post";
        RevenueGLAccount: Code[20];
        NextLineNo: Integer;
    begin
        NextLineNo := 10000;

        SalesHeader.Init();
        SalesHeader."Document Type" := SalesHeader."Document Type"::Invoice;
        SalesHeader.Insert(true);
        SalesHeader.SetHideValidationDialog(true); // no user messages at this stage
        SalesHeader.Validate("Sell-to Customer No.", Rec."Sell-To Customer No.");
        SalesHeader."Posting Date" := WorkDate();
        SalesHeader."Document Date" := WorkDate();
        SalesHeader.Modify(true);

        AYBookingLine.SetRange("Booking No.", Rec."No.");
        if AYBookingLine.FindSet() then
            repeat
                case AYBookingLine."Booking Type" of
                    "AY Booking Type"::Bounce:
                        begin
                            AYBounceUnit.Get(AYBookingLine."Booked Unit");
                            BUPostingGroup.Get(AYBounceUnit."Bounce Posting Group");
                            RevenueGLAccount := BUPostingGroup."Sales G/L Account";
                        end;
                end;
                SalesLine.init();
                SalesLine."Document Type" := SalesHeader."Document Type";
                SalesLine."Document No." := SalesHeader."No.";
                SalesLine."Line No." := NextLineNo;
                NextLineNo := NextLineNo + 10000;
                SalesLine.Validate(Type, SalesLine.Type::"G/L Account");
                SalesLine.Validate("No.", RevenueGLAccount);
                SalesLine.Validate(Quantity, 1);
                SalesLine.validate("Unit Price", AYBookingLine.Price);
                SalesLine.Insert(true);
            until AYBookingLine.Next() = 0;

        SalesPost.Run(SalesHeader);
    end;

    local procedure GenerateLedgers(Rec: Record "AY Booking Header")
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        AYBookingLine: Record "AY Booking Line";
        AYBookingLedger: Record "AY Booking Ledger";
        NextEntryNo: Integer;
    begin
        if AYBookingLedger.FindLast() then
            NextEntryNo := AYBookingLedger."Entry No." + 1
        else
            NextEntryNo := 1;
        AYBookingLedger.Reset();

        SalesInvoiceHeader.FindLast();

        AYBookingLine.SetRange("Booking No.", Rec."No.");
        if AYBookingLine.FindSet() then
            repeat
                AYBookingLedger.Init();
                AYBookingLedger."Entry No." := NextEntryNo;
                NextEntryNo := NextEntryNo + 1;

                AYBookingLedger."Booking Date" := AYBookingLine.Date;
                AYBookingLedger."Booking No." := Rec."No.";
                AYBookingLedger."Booking Type" := AYBookingLine."Booking Type";
                AYBookingLedger."Booked Unit No." := AYBookingLine."Booked Unit";
                AYBookingLedger."Registering Date" := WorkDate();
                AYBookingLedger."Sell-To Customer No." := Rec."Sell-To Customer No.";
                AYBookingLedger."Price" := AYBookingLine.Price;
                AYBookingLedger."Sales Invoice No." := SalesInvoiceHeader."No.";
                AYBookingLedger.Insert(true);
            until AYBookingLine.Next() = 0;
    end;

    local procedure ArchiveBooking(Rec: Record "AY Booking Header")
    var
        AYBookingLine: Record "AY Booking Line";
        AYBookingArchHeader: Record "AY Booking Arch. Header";
        AYBookingArchLine: Record "AY Booking Arch. Line";
    begin

        AYBookingArchHeader.Init();
        AYBookingArchHeader.TransferFields(Rec, true);
        AYBookingArchHeader.Insert(true);

        AYBookingLine.SetRange("Booking No.", Rec."No.");
        if AYBookingLine.FindSet() then
            repeat
                AYBookingArchLine.Init();
                AYBookingArchLine.TransferFields(AYBookingLine, true);
                AYBookingArchLine.Insert(true);
            until AYBookingLine.Next() = 0;

        Rec.Delete();
        AYBookingLine.DeleteAll();
    end;
}
