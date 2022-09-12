page 74290 "AYBK Booking List"
{
    ApplicationArea = All;
    Caption = 'Booking List';
    PageType = List;
    SourceTable = "AYBK Booking Header";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "AYBK Booking";

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
                field("Sell-To Customer No."; Rec."Sell-To Customer No.")
                {
                    ToolTip = 'Specifies the value of the Sell-To Customer No. field.';
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                }
                field("Booking Start Date"; Rec."Booking Start Date")
                {
                    ToolTip = 'Specifies the value of the Booking Start Date field.';
                    ApplicationArea = All;
                }
                field("Booking End Date"; Rec."Booking End Date")
                {
                    ToolTip = 'Specifies the value of the Booking End Date field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
