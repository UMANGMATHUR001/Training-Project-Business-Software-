page 50007 "Student Attendance Record"
{
    ApplicationArea = All;
    Caption = 'Student Attendance Record';
    PageType = List;
    SourceTable = "Student Attendance Record";
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Subject ID"; Rec."Subject ID")
                {
                    ToolTip = 'Specifies the value of the Subject ID field.', Comment = '%';
                }
                field("Subject Name"; Rec."Subject Name")
                {
                    ToolTip = 'Specifies the value of the Subject Name field.', Comment = '%';
                }
                field("Total Lectures"; Rec."Total Lectures")
                {
                    ToolTip = 'Specifies the value of the Total Lectures field.', Comment = '%';
                }
                field("Total Attendance"; Rec."Total Attendance")
                {
                    ToolTip = 'Specifies the value of the Total Attendance field.', Comment = '%';
                }
                field("Total Absent"; Rec."Total Absent")
                {
                    ToolTip = 'Specifies the value of the Total Absent field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(TotalLectures)
            {
                ApplicationArea = All;
                Caption = 'Total Lectures';
                Image = BankAccountLedger;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    TotalLectures: page "Total Lectures";
                    StudentAttandance: Record "Student Attendance";
                begin
                    StudentAttandance.Reset;
                    StudentAttandance.SetRange("Subject ID", Rec."Subject ID");
                    StudentAttandance.SetRange("Class Code", Rec."Class Code");
                    StudentAttandance.SetRange("Attandance Type", StudentAttandance."Attandance Type"::Subject);
                    StudentAttandance.SetRange(Year, Rec.Year);
                    TotalLectures.SETTABLEVIEW(StudentAttandance);
                    TotalLectures.RunModal();
                end;
            }
            action(TotalAttendance)
            {
                ApplicationArea = All;
                Caption = 'Total Attendance';
                Image = Capacities;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    StudentAttendancePage: page "Total Student Attendance";
                    StudentAttandance: Record "Student Attendance";
                begin
                    StudentAttandance.Reset;
                    StudentAttandance.SetRange("Student No.", Rec."Student No.");
                    StudentAttandance.SetRange("Subject ID", Rec."Subject ID");
                    StudentAttandance.SetRange("Class Code", Rec."Class Code");
                    StudentAttandance.SetRange(Year, Rec.Year);
                    StudentAttandance.SetRange("Attandance Type", StudentAttandance."Attandance Type"::Student);
                    StudentAttendancePage.SETTABLEVIEW(StudentAttandance);
                    StudentAttendancePage.RunModal();
                end;
            }
        }
    }
}
