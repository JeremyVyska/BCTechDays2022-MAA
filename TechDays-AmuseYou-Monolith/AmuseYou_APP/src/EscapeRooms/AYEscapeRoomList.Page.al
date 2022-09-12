page 74103 "AY Escape Room List"
{
    ApplicationArea = All;
    Caption = 'Escape Room List';
    PageType = List;
    SourceTable = "AY Escape Room";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "AY Escape Room Card";

    layout
    {
        area(content)
        {
            repeater(General)
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
                }
                field("Target Age Group"; Rec."Target Age Group")
                {
                    ToolTip = 'Specifies the value of the Target Age Group field.';
                    ApplicationArea = All;
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
                field("Last Inspection Date"; Rec."Last Inspection Date")
                {
                    ToolTip = 'Specifies the value of the Last Inspection Date field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
