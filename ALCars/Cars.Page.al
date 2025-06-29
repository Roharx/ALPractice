page 50202 "Cars Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Car;

    layout
    {
        area(Content)
        {
            repeater(repeater1)
            {
                field(Car; Rec.Car)
                {
                    ToolTip = 'This is the car code.';
                }

                field(Description; Rec.Description)
                {
                    ToolTip = 'This is the car description';
                }
            }
        }
    }
}