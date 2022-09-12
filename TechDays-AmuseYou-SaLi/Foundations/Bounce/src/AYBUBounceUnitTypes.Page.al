page 74213 "AYBU Bounce Unit Types"
{
    ApplicationArea = All;
    Caption = 'Bounce Unit Types';
    PageType = List;
    SourceTable = "AYBU Bounce Unit Type";
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
            }
        }
    }
}
