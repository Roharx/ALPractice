page 50102 "My New Page"
{
    Caption = 'My New Page';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "My New Table";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {

                }

                field(Description; Rec.Description)
                {

                }

                field("Item No."; Rec."Item No.")
                {

                }

                field("Created At"; Rec."Created At")
                {

                }

                field("Changed At"; Rec."Changed At")
                {
                    Visible = IsVisible;
                }
            }
        }
    }
    var
        IsVisible: Boolean;


    // Triggers when the page is opened
    trigger OnOpenPage()
    begin
        Message('OnOpenPage');
        IsVisible := false;
    end;

    // Triggers when there is a record and we're clicking into the record
    trigger OnAfterGetRecord()
    begin
        Message('OnAfterGetRecord ' + Rec.Code);
    end;

    // Triggers when we click into a new or existing record
    trigger OnAfterGetCurrRecord()
    begin
        Message('OnAfterGetCurrRecord' + Rec.Code);
        if Rec.Description = '' then
            Rec.Description := 'Sample Description';
    end;

    // Triggers before closing the page
    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if Confirm('Do you want to close this page?', true) then
            exit(true);
        exit(false);
    end;

    // Triggers after closing the page
    trigger OnClosePage()
    begin
        Message('Page was closed.');
    end;
}