table 74113 "AY Booking Header"
{
    Caption = 'Booking Header';
    DataClassification = ToBeClassified;

    ObsoleteReason = 'Moved to SaLi Structure';
    ObsoleteState = Pending;
    ObsoleteTag = '2022-09-01';

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

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if Rec."Sell-To Customer No." <> '' then begin
                    Customer.Get(Rec."Sell-To Customer No.");
                    Customer.TestField(Blocked, Customer.Blocked::" ");
                    TransferAddressFields(Customer);
                end;
            end;
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

            trigger OnValidate()
            begin
                ValidateEmail();
            end;
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
        field(1000; "Booking Start Date"; Date)
        {
            Caption = 'Booking Start Date';
            FieldClass = FlowField;
            CalcFormula = min("AY Booking Line".Date where("Booking No." = field("No.")));
            Editable = false;
        }
        field(1001; "Booking End Date"; Date)
        {
            Caption = 'Booking End Date';
            FieldClass = FlowField;
            CalcFormula = max("AY Booking Line".Date where("Booking No." = field("No.")));
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

    trigger OnInsert()
    var
        BounceSetup: Record "AY Amusements Setup OBS";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            BounceSetup.Get();
            BounceSetup.TestField("Booking No. Series");
            NoSeriesMgt.InitSeries(BounceSetup."Booking No. Series", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnDelete()
    var
        AYBookingLine: Record "AY Booking Line";
    begin
        AYBookingLine.SetRange("Booking No.", Rec."No.");
        AYBookingLine.DeleteAll();
    end;

    local procedure TransferAddressFields(Customer: Record Customer)
    begin
        Rec."Customer Name" := Customer.Name;
        Rec.Address := Customer.Address;
        Rec."Address 2" := Customer."Address 2";
        Rec.City := Customer.City;
        Rec.County := Customer.County;
        Rec."Post Code" := Customer."Post Code";
        Rec."Phone No." := Customer."Phone No.";
        Rec."E-Mail" := Customer."E-Mail";

        Rec."Bill-To Address" := Customer.Address;
        Rec."Bill-To Address 2" := Customer."Address 2";
        Rec."Bill-To City" := Customer.City;
        Rec."Bill-To County" := Customer.County;
        Rec."Bill-To Post Code" := Customer."Post Code";
    end;

    local procedure ValidateEmail()
    var
        MailManagement: Codeunit "Mail Management";
    begin
        if "E-Mail" = '' then
            exit;
        MailManagement.CheckValidEmailAddresses("E-Mail");
    end;
}
