page 74119 "AY Booking Subpage"
{
    Caption = 'Booking Lines';
    PageType = ListPart;
    SourceTable = "AY Booking Line";
    AutoSplitKey = true;
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Booking No."; Rec."Booking No.")
                {
                    ToolTip = 'Specifies the value of the Booking No. field.';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Booking Type"; Rec."Booking Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Booking Type field.';
                }
                field("Booked Unit"; Rec."Booked Unit")
                {
                    ToolTip = 'Specifies the value of the Booked Unit field.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.';
                    ApplicationArea = All;
                }
            }
        }
    }


}
