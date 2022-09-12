page 74111 "AY Escape Posting Groups"
{
    ApplicationArea = All;
    Caption = 'Escape Posting Groups';
    PageType = List;
    SourceTable = "AY Escape Posting Group";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Sales G/L Account"; Rec."Sales G/L Account")
                {
                    ToolTip = 'Specifies the value of the Sales G/L Account field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
