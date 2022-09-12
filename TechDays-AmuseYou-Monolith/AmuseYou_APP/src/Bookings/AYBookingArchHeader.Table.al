table 74115 "AY Booking Arch. Header"
{
    Caption = 'Archive Booking Header';
    DataClassification = ToBeClassified;
    LookupPageId = "AY Booking Arch. List";
    DrillDownPageId = "AY Booking Arch. List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(9; "Sell-To Customer No."; Code[20])
        {
            Caption = 'Sell-To Customer No.';
            DataClassification = EndUserIdentifiableInformation;
            TableRelation = Customer;
        }
        field(10; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }
        field(11; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(12; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(13; City; Text[30])
        {
            Caption = 'City';
        }
        field(14; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(15; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
        }
        field(16; County; Text[30])
        {
            Caption = 'County';
        }
        field(17; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;
        }

        field(21; "Bill-To Address"; Text[100])
        {
            Caption = 'Address';
        }
        field(22; "Bill-To Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(23; "Bill-To City"; Text[30])
        {
            Caption = 'City';
        }
        field(25; "Bill-To Post Code"; Code[20])
        {
            Caption = 'Post Code';
        }
        field(26; "Bill-To County"; Text[30])
        {
            Caption = 'County';
        }

        field(50; "Delivery Description"; Text[200])
        {
            Caption = 'Delivery Description';
            DataClassification = CustomerContent;
        }
        field(60; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = SystemMetadata;
        }

        field(100; "Archived Date"; Date)
        {
            Caption = 'Archive Date';
            DataClassification = SystemMetadata;
        }

        field(1000; "Booking Start Date"; Date)
        {
            Caption = 'Booking Start Date';
            FieldClass = FlowField;
            CalcFormula = min("AY Booking Arch. Line".Date where("Booking No." = field("No.")));
            Editable = false;
        }
        field(1001; "Booking End Date"; Date)
        {
            Caption = 'Booking End Date';
            FieldClass = FlowField;
            CalcFormula = max("AY Booking Arch. Line".Date where("Booking No." = field("No.")));
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

}
