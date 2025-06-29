pageextension 50203 CustomerCard extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field(Car; Rec.Car)
            {
                ToolTip = 'This is the customer car';
            }
        }
    }
}