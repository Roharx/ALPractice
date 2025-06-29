tableextension 50203 CustomerExt extends Customer
{
    fields
    {
        field(50201; Car; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Car';
            TableRelation = Car.Car;
        }
    }
}