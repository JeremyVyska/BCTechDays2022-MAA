page 74101 "AY Laser Arena List"
{
    ApplicationArea = All;
    Caption = 'Laser Arena List';
    PageType = List;
    SourceTable = "AY Laser Arena";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "AY Laser Arena Card";

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
                field("Laser Arena Type"; Rec."Laser Arena Type")
                {
                    ToolTip = 'Specifies the value of the Laser Arena Type field.';
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
