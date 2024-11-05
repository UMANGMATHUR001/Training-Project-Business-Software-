table 50000 Students
{
    Caption = 'Students';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(3; "Middle Name"; Text[30])
        {
            Caption = 'Middle Name';
        }
        field(4; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
        }
        field(5; Address; Text[250])
        {
            Caption = 'Address';
        }
        field(6; Session; Text[10])
        {
            Caption = 'Session';
        }
        field(7; City; Text[30])
        {
            Caption = 'City';
        }
        field(8; State; Text[30])
        {
            Caption = 'State';
        }
        field(9; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
        }
        field(10; "Alternative Address"; Text[250])
        {
            Caption = 'Alternative Address';
        }
        field(11; Gender; Option)
        {
            Caption = 'Gender';
            OptionMembers = " ",Male,Female,"Third-Gender";
        }
        field(12; "Birth Date"; Date)
        {
            Caption = 'Birth Date';
        }
        field(13; "Mobile Phone No."; Text[30])
        {
            Caption = 'Mobile Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(14; "E-Mail"; Text[80])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(15; Picture; BLOB)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(16; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = Active,Passout,Terminated;
        }
        field(17; "Admission Date"; Date)
        {
            Caption = 'Admission Date';
        }
        field(18; "Termination Date"; Date)
        {
            Caption = 'Termination Date';
        }
        field(19; "Passout Date"; Date)
        {
            Caption = 'Passout Date';
        }
        field(20; "Guardian Name"; Text[100])
        {
            Caption = 'Guardian Name';
        }
        field(21; "Guardian Mobile No."; Text[30])
        {
            Caption = 'Guardian Mobile No.';
        }
        field(22; "Relation with Guardian"; Text[30])
        {
            Caption = 'Relation with Guardian';
        }
        field(24; Stream; enum "Btech Stream")
        {
        }
        field(26; "Roll No."; Integer)
        {
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        NoSeriesMgt: Codeunit "No. Series";
        UserSetup: Record "User Setup";
    begin
        UserSetup.GET(UserId);
        if UserSetup."User Type" = UserSetup."User Type"::Teacher then
            Error('You do not have permission to insert new student.');

        IF "No." = '' THEN BEGIN
            "No." := NoSeriesMgt.GetNextNo('STUDENT', Today, TRUE);
        END;
    end;


    trigger OnModify()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.GET(UserId);
        if UserSetup."User Type" = UserSetup."User Type"::Teacher then
            Error('You do not have permission to modify student.');
    end;

    trigger OnDelete()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.GET(UserId);
        if UserSetup."User Type" = UserSetup."User Type"::Teacher then
            Error('You do not have permission to delete student.');
    end;
}
