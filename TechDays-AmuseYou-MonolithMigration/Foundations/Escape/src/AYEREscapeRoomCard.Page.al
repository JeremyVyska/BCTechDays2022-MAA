page 74221 "AYER Escape Room Card"
{
    Caption = 'Escape Room Card';
    PageType = Card;
    SourceTable = "AYER Escape Room";

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
                field("Escape Room Type"; Rec."Escape Room Type")
                {
                    ToolTip = 'Specifies the value of the Escape Room Type field.';
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Target Age Group"; Rec."Target Age Group")
                {
                    ToolTip = 'Specifies the value of the Target Age Group field.';
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Suggested Minimum People"; Rec."Suggested Minimum People")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Suggested Minimum People field.';
                }
                field("Suggested Maximum People"; Rec."Suggested Maximum People")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Suggested Maximum People field.';
                }
                field("Avg. Completion Time (Minutes)"; Rec."Avg. Completion Time (Minutes)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Avg. Completion Time (Minutes) field.';
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
                field("Escape Posting Group"; Rec."Escape Posting Group")
                {
                    ToolTip = 'Specifies the value of the Escape Posting Group field.';
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Price Per Day"; Rec."Price Per Day")
                {
                    ToolTip = 'Specifies the value of the Price Per DAYTX field.';
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
