codeunit 74104 "AY DemoData Installer"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        GLSetup: Record "General Ledger Setup";
        AYAmusementsSetup: Record "AY Amusements Setup";
    begin
        // AY Amusement Setup to ensure we're not recreating the same data
        // GL Setup to check if it's an empty company, rather than Demo Data.
        if AYAmusementsSetup.IsEmpty and not GLSetup.IsEmpty then begin
            GenerateSetupData();
            GenerateMasterData();
            GenerateOpenDocuments();
            GenerateHistoryData();
        end;
    end;

    local procedure GenerateSetupData()
    var
        GLAccount: Record "G/L Account";
        NoSeries: Record "No. Series";
        AYAmusementsSetup: Record "AY Amusements Setup";
        AYBouncePostingGroup: Record "AY Bounce Posting Group";
        AYBounceUnitType: Record "AY Bounce Unit Type";
        AYArenaPostingGroup: Record "AY Arena Posting Group";
        AYArenaType: Record "AY Laser Arena Type";
        AYTrackPostingGroup: Record "AY Track Posting Group";
        AYTrackType: Record "AY GK Track Type";
        AYEscapePostingGroup: Record "AY Escape Posting Group";
        AYEscapeRoomType: Record "AY Escape Room Type";
        SalesAccountNo: Code[20];
        AYBookingNos: Label 'BOOK', Locked = true;
        AYBounceUnitNos: Label 'BU', Locked = true;
        AYEscapeRoomNos: Label 'ER', Locked = true;
        AYGKTrackNos: Label 'GK', Locked = true;
        AYLaserArenaNos: Label 'LA', Locked = true;
    begin
        // CRONUS w1 G/L Account for sales
        SalesAccountNo := '6410';
        if not GLAccount.Get(SalesAccountNo) then begin
            GLAccount.Init();
            GLAccount."No." := SalesAccountNo;
            GLAccount."Direct Posting" := true;
            // More fields would need to be set if you're not using W1, like VAT or Tax, Prod Posting Group, etc
            GLAccount.Insert(true);
        end;
        if not GLAccount."Direct Posting" then begin
            GLAccount."Direct Posting" := true;
            GLAccount.Modify(true);
        end;

        // Create needed No Series Setups
        if not NoSeries.Get(AYBookingNos) then
            CreateNoSeries(NoSeries, AYBookingNos);
        if not NoSeries.Get(AYBounceUnitNos) then
            CreateNoSeries(NoSeries, AYBounceUnitNos);
        if not NoSeries.Get(AYEscapeRoomNos) then
            CreateNoSeries(NoSeries, AYEscapeRoomNos);
        if not NoSeries.Get(AYGKTrackNos) then
            CreateNoSeries(NoSeries, AYGKTrackNos);
        if not NoSeries.Get(AYLaserArenaNos) then
            CreateNoSeries(NoSeries, AYLaserArenaNos);

        AYAmusementsSetup.InsertIfNotExists();
        AYAmusementsSetup."Booking No. Series" := AYBookingNos;
        AYAmusementsSetup."Bounce No. Series" := AYBounceUnitNos;
        AYAmusementsSetup."Escape No. Series" := AYEscapeRoomNos;
        AYAmusementsSetup."Track No. Series" := AYGKTrackNos;
        AYAmusementsSetup."Arena No. Series" := AYLaserArenaNos;
        AYAmusementsSetup.Modify();


        // Create Bounce Posting Groups
        if AYBouncePostingGroup.IsEmpty then begin
            AYBouncePostingGroup.Init();
            AYBouncePostingGroup.Code := 'BOUNCE';
            AYBouncePostingGroup."Sales G/L Account" := SalesAccountNo;
            AYBouncePostingGroup.Insert();
        end;

        // Create Bounce Types
        if AYBounceUnitType.IsEmpty then begin
            AYBounceUnitType.Init();
            AYBounceUnitType.Code := 'CASTLE';
            AYBounceUnitType.Description := 'Bouncy Castle';
            AYBounceUnitType.Insert();
        end;


        // Create Arena Posting Groups
        if AYArenaPostingGroup.IsEmpty then begin
            AYArenaPostingGroup.Init();
            AYArenaPostingGroup.Code := 'WHSE';
            AYArenaPostingGroup."Sales G/L Account" := SalesAccountNo;
            AYArenaPostingGroup.Insert();
        end;

        // Create Arena Types
        if AYArenaType.IsEmpty then begin
            AYArenaType.Init();
            AYArenaType.Code := 'BLACKLIGHT';
            AYArenaType.Description := 'Black Light Room';
            AYArenaType.Insert();
        end;

        // Create Track Posting Groups
        if AYTrackPostingGroup.IsEmpty then begin
            AYTrackPostingGroup.Init();
            AYTrackPostingGroup.Code := 'OUTDOOR';
            AYTrackPostingGroup."Sales G/L Account" := SalesAccountNo;
            AYTrackPostingGroup.Insert();
        end;

        // Create Track Types
        if AYTrackType.IsEmpty then begin
            AYTrackType.Init();
            AYTrackType.Code := 'FIELD';
            AYTrackType.Description := 'Cruising Field';
            AYTrackType.Insert();
        end;

        // Create Escape Posting Groups
        if AYEscapePostingGroup.IsEmpty then begin
            AYEscapePostingGroup.Init();
            AYEscapePostingGroup.Code := 'EU';
            AYEscapePostingGroup."Sales G/L Account" := SalesAccountNo;
            AYEscapePostingGroup.Insert();
        end;

        // Create Escape Types
        if AYEscapeRoomType.IsEmpty then begin
            AYEscapeRoomType.Init();
            AYEscapeRoomType.Code := 'VAULT';
            AYEscapeRoomType.Description := 'Bank Vault Heist';
            AYEscapeRoomType.Insert();
        end;
    end;

    local procedure GenerateMasterData()
    var
        i: Integer;
    begin
        // for Workshop classes, this level of data is only lightly implemented
        for i := 1 to 10 do begin
            CreateBounceUnit();
            CreateLaserArena();
            CreateGoKartTrack();
            CreateEscapeRoom();
        end;
    end;

    local procedure GenerateOpenDocuments()
    begin
        // for Workshop classes, this level of data is not implemented
    end;

    local procedure GenerateHistoryData()
    begin
        // for Workshop classes, this level of data is not implemented
    end;


    local procedure CreateNoSeries(var NoSeries: Record "No. Series"; WhichNoSeries: Text)
    var
        NoSeriesLine: Record "No. Series Line";
    begin
        NoSeries.Init();
        NoSeries.Code := WhichNoSeries;
        NoSeries."Default Nos." := true;
        NoSeries.Insert();
        NoSeriesLine.Init();
        NoSeriesLine."Series Code" := NoSeries.Code;
        NoSeriesLine."Line No." := 10000;
        NoSeriesLine.Insert(true);
        NoSeriesLine.Validate("Starting No.", WhichNoSeries + '00000');
        NoSeriesLine.Validate("Ending No.", WhichNoSeries + '99999');
        NoSeriesLine.Validate("Increment-by No.", 1);
        NoSeriesLine.Validate("Allow Gaps in Nos.", true);
        NoSeriesLine.Validate(Open, true);
        NoSeriesLine.Modify(true);
    end;

    procedure CreateBounceUnit()
    var
        AYBouncePostingGroup: record "AY Bounce Posting Group";
        AYBounceType: Record "AY Bounce Unit Type";
        AYBounceUnit: Record "AY Bounce Unit";
    begin
        AYBouncePostingGroup.FindFirst();
        AYBounceType.FindFirst();

        AYBounceUnit.Init();
        AYBounceUnit.Insert(true);
        AYBounceUnit.Description := 'Test';
        AYBounceUnit."Bounce Posting Group" := AYBouncePostingGroup.Code;
        AYBounceUnit."Bounce Unit Type" := AYBounceType.Code;
        AYBounceUnit."Price Per Day" := 1;
        AYBounceUnit.Modify(true);
    end;

    procedure CreateLaserArena()
    var
        AYArenaPostingGroup: record "AY Arena Posting Group";
        AYArenaType: Record "AY Laser Arena Type";
        AYLaserArena: Record "AY Laser Arena";
    begin
        AYArenaPostingGroup.FindFirst();
        AYArenaType.FindFirst();

        AYLaserArena.Init();
        AYLaserArena.Insert(true);
        AYLaserArena.Description := 'Test';
        AYLaserArena."Arena Posting Group" := AYArenaPostingGroup.Code;
        AYLaserArena."Laser Arena Type" := AYArenaType.Code;
        AYLaserArena."Price Per Day" := 1;
        AYLaserArena.Modify(true);
    end;

    procedure CreateGoKartTrack()
    var
        AYTrackPostingGroup: record "AY Track Posting Group";
        AYTrackType: Record "AY GK Track Type";
        AYGoKartTrack: Record "AY GK Track";
    begin
        AYTrackPostingGroup.FindFirst();
        AYTrackType.FindFirst();

        AYGoKartTrack.Init();
        AYGoKartTrack.Insert(true);
        AYGoKartTrack.Description := 'Test';
        AYGoKartTrack."Track Posting Group" := AYTrackPostingGroup.Code;
        AYGoKartTrack."GK Track Type" := AYTrackType.Code;
        AYGoKartTrack."Price Per Day" := 1;
        AYGoKartTrack.Modify(true);
    end;

    procedure CreateEscapeRoom()
    var
        AYEscapePostingGroup: record "AY Escape Posting Group";
        AYEscapeType: Record "AY Escape Room Type";
        AYEscapeRoom: Record "AY Escape Room";
    begin
        AYEscapePostingGroup.FindFirst();
        AYEscapeType.FindFirst();

        AYEscapeRoom.Init();
        AYEscapeRoom.Insert(true);
        AYEscapeRoom.Description := 'Test';
        AYEscapeRoom."Escape Posting Group" := AYEscapePostingGroup.Code;
        AYEscapeRoom."Escape Room Type" := AYEscapeType.Code;
        AYEscapeRoom."Price Per Day" := 1;
        AYEscapeRoom.Modify(true);
    end;
}
