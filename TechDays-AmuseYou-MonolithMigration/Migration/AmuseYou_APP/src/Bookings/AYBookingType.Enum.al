enum 74104 "AY Booking Type"
{
    Extensible = true;

    ObsoleteReason = 'Moved to SaLi Structure';
    ObsoleteState = Pending;
    ObsoleteTag = '2022-09-01';

    value(0; Bounce)
    {
        Caption = 'Bounce';
    }
    value(1; Escape)
    {
        Caption = 'Escape';
    }
    value(2; Track)
    {
        Caption = 'GoKart Track';
    }
    value(3; Arena)
    {
        Caption = 'Lasertag Arena';
    }
}
