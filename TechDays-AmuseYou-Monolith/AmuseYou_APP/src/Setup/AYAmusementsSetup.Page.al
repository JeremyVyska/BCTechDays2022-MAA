page 74100 "AY Amusements Setup"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "AY Amusements Setup";
    Caption = 'Amusements Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Booking No. Series"; Rec."Booking No. Series")
                {
                    ToolTip = 'Specifies the value of the Booking No. Series field.';
                    ApplicationArea = All;
                }
                field("Bounce No. Series"; Rec."Bounce No. Series")
                {
                    ToolTip = 'Specifies Bounce No. Series to use for new Bounce Units.';
                    ApplicationArea = All;
                }
                field("Escape No. Series"; Rec."Escape No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Escape No. Series field.';
                }
                field("Track No. Series"; Rec."Track No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Track No. Series field.';
                }
                field("Arena No. Series"; Rec."Arena No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Arena No. Series field.';
                }

            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;

}
