table 50001 "Student Attendance"
{
    Caption = 'Student Attendance';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Student No."; Code[20])
        {
            Caption = 'Student No.';
            NotBlank = true;
            TableRelation = Students;
        }
        field(3; "Subject ID"; Code[20])
        {
            Caption = 'Subject ID';
        }
        field(4; "Roll No."; Integer)
        {
            Caption = 'Roll No.';
            TableRelation = Students;
        }
        field(5; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(6; "Attandance"; Option)
        {
            Caption = 'Attandance';
            OptionMembers = " ",Absent,Present;
        }
        field(7; "Attandance Type"; Option)
        {
            Caption = 'Attandance Type';
            OptionMembers = Student,Subject;
        }
        field(8; "Class Code"; Code[20])
        {
            Caption = 'Class Code';
            TableRelation = Class."Class Code";
            trigger OnValidate()
            var
                Class: Record Class;
            begin
                Class.GET("Class Code", Year);
                Rec.Class := Class.Name;
                Rec.Semester := Class.Semester;
                Rec.Stream := Class.Stream;
            end;
        }

        field(101; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(102; "Middle Name"; Text[30])
        {
            Caption = 'Middle Name';
        }
        field(103; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
        }
        field(104; Class; Text[50])
        {
            Caption = 'Class';
            Editable = false;
        }
        field(105; Semester; Option)
        {
            Caption = 'Semester';
            OptionMembers = "1","2","3","4","5","6","7","8";
            Editable = false;
        }
        field(106; Stream; enum "Btech Stream")
        {
            Editable = false;
        }
        field(107; "Attandance Value"; Integer)
        {
            Editable = false;
        }
        field(108; "Year"; Integer)
        {
            Caption = 'Year';
            TableRelation = Class.Year;
        }


    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(key1; "Attandance Value")
        {
            SumIndexFields = "Attandance Value";
        }
    }
}
