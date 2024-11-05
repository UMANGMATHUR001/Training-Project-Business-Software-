page 50011 "Total Lectures"
{
    ApplicationArea = All;
    Caption = 'Total Lectures';
    PageType = List;
    SourceTable = "Student Attendance";
    UsageCategory = History;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    SourceTableView = where("Attandance Type" = const(Subject));
    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
                field(Stream; Rec.Stream)
                {
                    ToolTip = 'Specifies the value of the Stream field.', Comment = '%';
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
