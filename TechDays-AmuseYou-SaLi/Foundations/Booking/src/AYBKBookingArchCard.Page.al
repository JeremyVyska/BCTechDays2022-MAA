page 74294 "AYBK Booking Arch. Card"
{
    Caption = 'Archived Booking';
    PageType = Document;
    SourceTable = "AYBK Booking Arch. Header";
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
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
                field("Archived Date"; Rec."Archived Date")
                {
                    ToolTip = 'Specifies the value of the Archive Date field.';
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.';
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ToolTip = 'Specifies the value of the Address 2 field.';
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.';
                    ApplicationArea = All;
                }
                field(County; Rec.County)
                {
                    ToolTip = 'Specifies the value of the County field.';
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ToolTip = 'Specifies the value of the Post Code field.';
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.';
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the value of the Email field.';
                    ApplicationArea = All;
                }
                field("Delivery Description"; Rec."Delivery Description")
                {
                    ToolTip = 'Specifies the value of the Delivery Description field.';
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
            part(BookingLines; "AYBK Booking Subpage")
            {
                SubPageLink = "Booking No." = field("No.");
                Caption = 'Booking Lines';
                ApplicationArea = All;
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Bill-To Address"; Rec."Bill-To Address")
                {
                    ToolTip = 'Specifies the value of the Address field.';
                    ApplicationArea = All;
                }
                field("Bill-To Address 2"; Rec."Bill-To Address 2")
                {
                    ToolTip = 'Specifies the value of the Address 2 field.';
                    ApplicationArea = All;
                }
                field("Bill-To City"; Rec."Bill-To City")
                {
                    ToolTip = 'Specifies the value of the City field.';
                    ApplicationArea = All;
                }
                field("Bill-To County"; Rec."Bill-To County")
                {
                    ToolTip = 'Specifies the value of the County field.';
                    ApplicationArea = All;
                }
                field("Bill-To Post Code"; Rec."Bill-To Post Code")
                {
                    ToolTip = 'Specifies the value of the Post Code field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
