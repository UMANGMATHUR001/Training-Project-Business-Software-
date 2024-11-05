page 50009 "Class Attendance"
{
    ApplicationArea = All;
    Caption = 'Class Attendance';
    PageType = List;
    SourceTable = Class;
    SourceTableView = where(Status = const(Active));
    UsageCategory = Lists;
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Class Code"; Rec."Class Code")
                {
                    ToolTip = 'Specifies the value of the Class Code field.', Comment = '%';
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Semester; Rec.Semester)
                {
                    ToolTip = 'Specifies the value of the Semester field.', Comment = '%';
                }
                field(Session; Rec.Session)
                {
                    ToolTip = 'Specifies the value of the Session field.', Comment = '%';
                }
                field(Stream; Rec.Stream)
                {
                    ToolTip = 'Specifies the value of the Stream field.', Comment = '%';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.', Comment = '%';
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Subject")
            {
                ApplicationArea = All;
                Caption = 'Subjects';
                Image = CoupledOrderList;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    Subject: Record Subject;
                    Subjects: Page "Class Subject List";
                begin
                    Subject.SETRANGE("Class Code", Rec."Class Code");
                    Subjects.SETTABLEVIEW(Subject);
                    Subjects.RunModal();
                end;
            }


        }

    }
}
