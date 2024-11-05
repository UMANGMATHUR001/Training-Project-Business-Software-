page 50010 "Total Student Attendance"
{
    ApplicationArea = All;
    Caption = 'Total Student Attendance';
    PageType = List;
    SourceTable = "Student Attendance";
    UsageCategory = History;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    SourceTableView = where("Attandance Type" = const(Student));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Student No."; Rec."Student No.")
                {
                    ToolTip = 'Specifies the value of the Student No. field.', Comment = '%';
                }
                field("Roll No."; Rec."Roll No.")
                {
                    ToolTip = 'Specifies the value of the Roll No. field.', Comment = '%';
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
                field(Stream; Rec.Stream)
                {
                    ToolTip = 'Specifies the value of the Stream field.', Comment = '%';
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }
                field("Class Code"; Rec."Class Code")
                {
                    ToolTip = 'Specifies the value of the Class Code field.', Comment = '%';
                }
                field(Class; Rec.Class)
                {
                    ToolTip = 'Specifies the value of the Class field.', Comment = '%';
                }
                field(Semester; Rec.Semester)
                {
                    ToolTip = 'Specifies the value of the Semester field.', Comment = '%';
                }
                field("Subject ID"; Rec."Subject ID")
                {
                    ToolTip = 'Specifies the value of the Subject ID field.', Comment = '%';
                }

                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                }
                field("Attandance Type"; Rec."Attandance Type")
                {
                    ToolTip = 'Specifies the value of the Attandance Type field.', Comment = '%';
                }
                field(Attandance; Rec.Attandance)
                {
                    ToolTip = 'Specifies the value of the Attandance field.', Comment = '%';
                }
            }
        }
    }
}
