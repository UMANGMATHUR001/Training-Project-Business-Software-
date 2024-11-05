table 50005 "Student Classes"
{
    Caption = 'Student Classes';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Student No."; Code[20])
        {
            Caption = 'Student No.';
        }
        field(2; "Year"; Integer)
        {
            Caption = 'Year';
        }
        field(3; "Class Code"; Code[20])
        {
            Caption = 'Class Code';
            TableRelation = Class."Class Code" where(Year = field(Year));

            trigger OnValidate()
            var
                Class: Record Class;
            begin
                Class.GET("Class Code", Year);
                "Class Name" := Class.Name;
                Semester := Class.Semester;
                Status := Class.Status;
                "Start Date" := Class."Start Date";
                "End Date" := Class."End Date";
            end;
        }
        field(4; "Class Name"; Text[50])
        {
            Caption = 'Class Name';
            Editable = false;
        }
        field(5; Semester; Option)
        {
            Caption = 'Semester';
            OptionMembers = "1","2","3","4","5","6","7","8";
            Editable = false;
        }
        field(6; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = "Not Started",Active,Closed;
        }

        field(7; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(8; "End Date"; Date)
        {
            Caption = 'End Date';
        }
    }
    keys
    {
        key(PK; "Student No.", "Year", "Class Code")
        {
            Clustered = true;
        }
    }
}
