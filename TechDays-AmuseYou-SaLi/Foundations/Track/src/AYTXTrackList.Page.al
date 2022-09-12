page 74230 "AYTX Track List"
{
    ApplicationArea = All;
    Caption = 'GK Track List';
    PageType = List;
    SourceTable = "AYTX Track";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "AYTX Track Card";

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
                field("GK Track Type"; Rec."GK Track Type")
                {
                    ToolTip = 'Specifies the value of the GK Track Type field.';
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
