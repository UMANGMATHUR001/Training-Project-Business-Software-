table 50002 Class
{
    Caption = 'Class';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Class Code"; Code[20])
        {
            Caption = 'Class Code';
        }
        field(2; "Year"; Integer)
        {
            Caption = 'Year';
        }

        field(3; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(4; Semester; Option)
        {
            Caption = 'Semester';
            OptionMembers = "1","2","3","4","5","6","7","8";
        }
        field(5; Session; Code[10])
        {
            Caption = 'Session';
        }
        field(6; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(7; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(8; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = "Not Started",Active,Closed;
            //Editable = false;
        }
        field(9; Stream; enum "Btech Stream")
        {

        }
    }
    keys
    {
        key(PK; "Class Code", "Year")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.GET(UserId);
        if UserSetup."User Type" = UserSetup."User Type"::Teacher then
            Error('You do not have permission to insert new class.');
    end;

    trigger OnModify()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.GET(UserId);
        if UserSetup."User Type" = UserSetup."User Type"::Teacher then
            Error('You do not have permission to modify class.');
    end;

    trigger OnDelete()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.GET(UserId);
        if UserSetup."User Type" = UserSetup."User Type"::Teacher then
            Error('You do not have permission to delete class.');
    end;
}
