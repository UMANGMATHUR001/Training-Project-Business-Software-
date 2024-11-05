table 50004 "Student Attendance Record"
{
    Caption = 'Student Attendance Record';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Student No."; Code[20])
        {
            Caption = 'Student No.';
        }
        field(2; "Class Code"; Code[20])
        {
            Caption = 'Class Code';
            TableRelation = Class."Class Code";
        }
        field(3; "Subject ID"; Code[20])
        {
            Caption = 'Subject ID';
            TableRelation = Subject.ID where("Class Code" = field("Class Code"));

            trigger OnValidate()
            var
                Subject: Record Subject;
            begin
                Subject.Get("Subject ID");
                "Subject Name" := Subject."Subject Name";
            end;
        }
        field(4; "Total Lectures"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Student Attendance"."Attandance Value" WHERE("Subject ID" = field("Subject ID"), "Class Code" = field("Class Code"), "Attandance Type" = const(1), Year = field(Year)));

        }
        field(5; "Total Attendance"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Student Attendance"."Attandance Value" WHERE("Subject ID" = field("Subject ID"), "Class Code" = field("Class Code"), "Attandance Type" = const(0), Attandance = const(2), "Student No." = field("Student No."), Year = field(Year)));

        }
        field(6; "Total Absent"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Student Attendance"."Attandance Value" WHERE("Subject ID" = field("Subject ID"), "Class Code" = field("Class Code"), "Attandance Type" = const(0), Attandance = const(1), "Student No." = field("Student No."), Year = field(Year)));

        }
        field(7; "Subject Name"; Text[50])
        {
            Caption = 'Subject Name';
            Editable = false;
        }
        field(8; "Year"; Integer)
        {
            Caption = 'Year';
            TableRelation = Class.Year;
        }
    }
    keys
    {
        key(PK; "Student No.", "Class Code", Year, "Subject ID")
        {
            Clustered = true;
        }
    }
}
