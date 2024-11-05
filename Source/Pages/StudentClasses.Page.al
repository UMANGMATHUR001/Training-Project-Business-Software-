page 50008 "Student Classes Subform"
{
    ApplicationArea = All;
    Caption = 'Student Classes';
    PageType = ListPart;
    SourceTable = "Student Classes";

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
                field("Class Name"; Rec."Class Name")
                {
                    ToolTip = 'Specifies the value of the Class Name field.', Comment = '%';
                }
                field(Semester; Rec.Semester)
                {
                    ToolTip = 'Specifies the value of the Semester field.', Comment = '%';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.', Comment = '%';
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {

            action("Attandance")
            {
                ApplicationArea = All;
                Caption = 'Attandance';
                Image = Balance;

                trigger OnAction()
                var
                    AttandanceRecord: page "Student Attendance Record";
                    StudentAttandance: Record "Student Attendance Record";
                begin
                    StudentAttandance.Reset;
                    StudentAttandance.SetRange("Student No.", Rec."Student No.");
                    StudentAttandance.SetRange(Year, Rec.Year);
                    StudentAttandance.SetRange("Class Code", Rec."Class Code");
                    AttandanceRecord.SETTABLEVIEW(StudentAttandance);
                    AttandanceRecord.RunModal();
                end;
            }
        }
    }
}
