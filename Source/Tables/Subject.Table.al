table 50003 Subject
{
    Caption = 'Subject';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Code[20])
        {
            Caption = 'ID';
        }
        field(2; "Subject Name"; Text[50])
        {
            Caption = 'Subject Name';
        }
        field(3; "Class Code"; Code[20])
        {
            Caption = 'Class Code';
            TableRelation = Class."Class Code";

            trigger OnValidate()
            var
                Class: Record Class;
            begin
                Class.GET("Class Code", Year);
                "Class Name" := Class.Name;
                Semester := Class.Semester;
                Stream := Class.Stream;
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
        field(6; Stream; enum "Btech Stream")
        {
            Editable = false;
        }
        field(7; "Total Lectures"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Student Attendance" WHERE("Subject ID" = field(ID), "Class Code" = field("Class Code"), "Attandance Type" = const(1)));
        }
        field(8; "Year"; Integer)
        {
            Caption = 'Year';
            TableRelation = Class.Year;
        }
    }
    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }
}
