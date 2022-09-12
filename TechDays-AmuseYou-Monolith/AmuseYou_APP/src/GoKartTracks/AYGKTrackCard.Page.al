page 74106 "AY GK Track Card"
{
    Caption = 'GK Track Card';
    PageType = Card;
    SourceTable = "AY GK Track";

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
                field("GK Track Type"; Rec."GK Track Type")
                {
                    ToolTip = 'Specifies the value of the GK Track Type field.';
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Target Age Group"; Rec."Target Age Group")
                {
                    ToolTip = 'Specifies the value of the Target Age Group field.';
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Maximum Cars"; Rec."Maximum Cars")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Maximum Cars field.';
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
                field("Track Posting Group"; Rec."Track Posting Group")
                {
                    ToolTip = 'Specifies the value of the Track Posting Group field.';
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
