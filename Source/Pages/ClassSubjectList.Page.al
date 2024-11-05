page 50005 "Class Subject List"
{
    ApplicationArea = All;
    Caption = 'Class Subject List';
    PageType = List;
    SourceTable = Subject;
    UsageCategory = None;
    Editable = false;
    DelayedInsert = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Subject Name"; Rec."Subject Name")
                {
                    ToolTip = 'Specifies the value of the Subject Name field.', Comment = '%';
                }
                field("Class Code"; Rec."Class Code")
                {
                    ToolTip = 'Specifies the value of the Class Code field.', Comment = '%';
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }
                field("Class Name"; Rec."Class Name")
                {
                    ToolTip = 'Specifies the value of the Class Name field.', Comment = '%';
                }
                field(Semester; Rec.Semester)
                {
                    ToolTip = 'Specifies the value of the Semester field.', Comment = '%';
                }
                field(Stream; Rec.Stream)
                {
                    ToolTip = 'Specifies the value of the Stream field.', Comment = '%';
                }
                field("Total Lectures"; Rec."Total Lectures")
                {
                    ToolTip = 'Specifies the value of the Total Lectures field.', Comment = '%';
                }

            }
        }
    }
    actions
    {
        area(processing)
        {

            action("Attendance")
            {
                ApplicationArea = All;
                Caption = 'Attandance';
                Image = Employee;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    StudentAttendance: Record "Student Attendance";
                    StudentAttendanceList: Page "Student Attendance List";
                    EventManager: Codeunit "Event Manager";
                begin
                    EventManager.InitStudentAttandance(Rec.ID, Rec."Class Code", Rec.Year);
                    Commit();

                    StudentAttendance.Reset();
                    StudentAttendance.SetCurrentKey("Roll No.");
                    StudentAttendance.SETRANGE("Class Code", Rec."Class Code");
                    StudentAttendance.SETRANGE("Subject ID", Rec.ID);
                    StudentAttendance.SETRANGE(Date, Today);
                    StudentAttendance.SETRANGE("Attandance Type", StudentAttendance."Attandance Type"::Student);
                    StudentAttendanceList.SETTABLEVIEW(StudentAttendance);
                    StudentAttendanceList.RunModal();
                end;
            }
        }
    }
}
