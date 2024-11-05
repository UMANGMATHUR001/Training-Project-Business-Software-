page 50004 "Class Card"
{
    ApplicationArea = All;
    Caption = 'Class Card';
    PageType = Card;
    SourceTable = Class;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Class Code"; Rec."Class Code")
                {
                    ToolTip = 'Specifies the value of the Class Code field.', Comment = '%';
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Stream; Rec.Stream)
                {
                    ToolTip = 'Specifies the value of the Stream field.', Comment = '%';
                }
                field(Semester; Rec.Semester)
                {
                    ToolTip = 'Specifies the value of the Semester field.', Comment = '%';
                }

                field(Session; Rec.Session)
                {
                    ToolTip = 'Specifies the value of the Session field.', Comment = '%';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.', Comment = '%';
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {

            action(Actvive)
            {
                ApplicationArea = All;
                Caption = 'Active Class';
                Image = New;
                Promoted = true;
                PromotedCategory = Process;
                Visible = IsAdmin;

                trigger OnAction()
                begin
                    if Confirm('Do you want to activate this class?') then begin
                        Rec.Status := Rec.Status::Active;
                        Rec.Modify();
                        CurrPage.Update();
                    end;
                end;
            }
            action(Closed)
            {
                ApplicationArea = All;
                Caption = 'Closed Class';
                Image = CloseYear;
                Promoted = true;
                PromotedCategory = Process;
                Visible = IsAdmin;

                trigger OnAction()
                begin
                    if Confirm('Do you want to close this class?') then begin
                        Rec.Status := Rec.Status::Closed;
                        Rec.Modify();
                        CurrPage.Update();
                    end;
                end;
            }
        }
    }
    var
        IsAdmin: Boolean;

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.GET(UserId);
        if UserSetup."User Type" = UserSetup."User Type"::Teacher then begin
            CurrPage.Editable(false);
            IsAdmin := false;
        end;
        if UserSetup."User Type" = UserSetup."User Type"::Admin then begin
            CurrPage.Editable(true);
            IsAdmin := true;
        end;

    end;
}
