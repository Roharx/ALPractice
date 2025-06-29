table 50101 "My New Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }

        field(2; Description; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }

        field(3; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item No.';

            trigger OnValidate()
            begin
                if (xRec."Item No." <> '') and (Rec."Item No." = '') then
                    Error('You cannot have an empty Item No. on this record.');
            end;

            trigger OnLookup()
            var
                Item: Record Item;
            begin
                if Page.RunModal(Page::"Item List", Item) = Action::LookupOK then
                    Rec."Item No." := Item."No.";
            end;
        }

        field(4; "Created At"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Created At';
        }

        field(5; "Changed At"; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Changed At';
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        "Created At" := CurrentDateTime;
    end;

    trigger OnModify()
    begin
        "Changed At" := CurrentDateTime;
    end;

    trigger OnRename()
    begin
        Message('Record was renamed. Old key is: %1, the new key is: %2', xRec.Code, Rec.Code);
    end;

    trigger OnDelete()
    begin
        Message('The record %1 was deleted', Rec.Code);
    end;
}