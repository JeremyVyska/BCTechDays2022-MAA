page 74105 "AY Laser Arena Card"
{
    Caption = 'Laser Arena Card';
    PageType = Card;
    SourceTable = "AY Laser Arena";

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
                field("Laser Arena Type"; Rec."Laser Arena Type")
                {
                    ToolTip = 'Specifies the value of the Laser Arena Type field.';
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Maximum Player Count"; Rec."Maximum Player Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Maximum Player Count field.';
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
                field("Arena Posting Group"; Rec."Arena Posting Group")
                {
                    ToolTip = 'Specifies the value of the Arena Posting Group field.';
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Price Per Day"; Rec."Price Per Day")
                {
                    ToolTip = 'Specifies the value of the Price Per Day field.';
                    ApplicationArea = All;
                    Importance = Promoted;
                }
            }
            group(Control)
            {
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
