page 74122 "AY Booking Arch. Subpage"
{
    Caption = 'Archived Booking Lines';
    PageType = ListPart;
    SourceTable = "AY Booking Arch. Line";
    Editable = false;

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
                }
                field("Booked Unit"; Rec."Booked Unit")
                {
                    ToolTip = 'Specifies the value of the Booked Unit field.';
                    ApplicationArea = All;
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
