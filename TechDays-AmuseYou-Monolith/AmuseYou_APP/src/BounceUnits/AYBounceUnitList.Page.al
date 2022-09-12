page 74104 "AY Bounce Unit List"
{
    ApplicationArea = All;
    Caption = 'Bounce Unit List';
    PageType = List;
    SourceTable = "AY Bounce Unit";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "AY Bounce Unit Card";

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
                field("Bounce Unit Type"; Rec."Bounce Unit Type")
                {
                    ToolTip = 'Specifies the value of the Bounce Unit Type field.';
                    ApplicationArea = All;
                }
                field("Target Age Group"; Rec."Target Age Group")
                {
                    ToolTip = 'Specifies the value of the Target Age Group field.';
                    ApplicationArea = All;
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
