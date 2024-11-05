page 50001 "Student Card"
{
    ApplicationArea = All;
    Caption = 'Student Card';
    PageType = Document;
    SourceTable = Students;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    Editable = false;
                }
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the value of the First Name field.', Comment = '%';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ToolTip = 'Specifies the value of the Middle Name field.', Comment = '%';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the value of the Last Name field.', Comment = '%';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ToolTip = 'Specifies the value of the Birth Date field.', Comment = '%';
                }


                field(Stream; Rec.Stream)
                {
                    ToolTip = 'Specifies the value of the Stream field.', Comment = '%';
                }
                field(Session; Rec.Session)
                {
                    ToolTip = 'Specifies the value of the Stream field.', Comment = '%';
                }
                field("Guardian Name"; Rec."Guardian Name")
                {
                    ToolTip = 'Specifies the value of the Guardian Name field.', Comment = '%';
                }
                field("Relation with Guardian"; Rec."Relation with Guardian")
                {
                    ToolTip = 'Specifies the value of the Relation with Guardian field.', Comment = '%';
                }
                field(Picture; Rec.Picture)
                {
                    ToolTip = 'Specifies the value Picture.', Comment = '%';
                    Width = 500;

                }
            }
            group("Address & Contact")
            {
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.', Comment = '%';
                }
                field(State; Rec.State)
                {
                    ToolTip = 'Specifies the value of the State field.', Comment = '%';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ToolTip = 'Specifies the value of the Post Code field.', Comment = '%';
                }
                field("Alternative Address"; Rec."Alternative Address")
                {
                    ToolTip = 'Specifies the value of the Alternative Address field.', Comment = '%';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.', Comment = '%';
                }
                field("Guardian Mobile No."; Rec."Guardian Mobile No.")
                {
                    ToolTip = 'Specifies the value of the Guardian Mobile No. field.', Comment = '%';
                }
            }
            group(Administration)
            {
                field("Admission Date"; Rec."Admission Date")
                {
                    ToolTip = 'Specifies the value of the Admission Date field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field("Roll No."; Rec."Roll No.")
                {
                    ToolTip = 'Specifies the value of the Roll No. field.', Comment = '%';
                }
                field("Passout Date"; Rec."Passout Date")
                {
                    ToolTip = 'Specifies the value of the Passout Date field.', Comment = '%';
                }
                field("Termination Date"; Rec."Termination Date")
                {
                    ToolTip = 'Specifies the value of the Termination Date field.', Comment = '%';
                }

            }
            part(Classes; "Student Classes Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Student No." = field("No.");
                Caption = 'Classes';
            }
        }
    }
    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.GET(UserId);
        if UserSetup."User Type" = UserSetup."User Type"::Teacher then begin
            CurrPage.Editable(false);
        end;
    end;
}
