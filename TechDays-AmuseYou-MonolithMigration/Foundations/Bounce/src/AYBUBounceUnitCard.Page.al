page 74211 "AYBU Bounce Unit Card"
{
    Caption = 'Bounce Unit Card';
    PageType = Card;
    SourceTable = "AYBU Bounce Unit";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Bounce Unit Type"; Rec."Bounce Unit Type")
                {
                    ToolTip = 'Specifies the value of the Bounce Unit Type field.';
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Target Age Group"; Rec."Target Age Group")
                {
                    ToolTip = 'Specifies the value of the Target Age Group field.';
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.';
                    ApplicationArea = All;
                    Importance = Promoted;
                }
            }
            group(Invoicing)
            {
                field("Bounce Posting Group"; Rec."Bounce Posting Group")
                {
                    ToolTip = 'Specifies the value of the Bounce Posting Group field.';
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Price Per Day"; Rec."Price Per Day")
                {
                    ToolTip = 'Specifies the value of the Price Per DAYBU field.';
                    ApplicationArea = All;
                    Importance = Promoted;
                }
            }
            group(Control)
            {
                field("Purchase Date"; Rec."Purchase Date")
                {
                    ToolTip = 'Specifies the value of the Purchase Date field.';
                    ApplicationArea = All;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies the value of the Serial No. field.';
                    ApplicationArea = All;
                }
                field("Last Inspection Date"; Rec."Last Inspection Date")
                {
                    ToolTip = 'Specifies the value of the Last Inspection Date field.';
                    ApplicationArea = All;
                    Importance = Promoted;
                }
            }
        }
    }
}
