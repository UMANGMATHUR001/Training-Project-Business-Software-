page 50006 "Student Attendance List"
{
    ApplicationArea = All;
    Caption = 'Student Attendance List';
    PageType = List;
    SourceTable = "Student Attendance";
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
                field(Class; Rec.Class)
                {
                    ToolTip = 'Specifies the value of the Class field.', Comment = '%';
                }
                field(Semester; Rec.Semester)
                {
                    ToolTip = 'Specifies the value of the Semester field.', Comment = '%';
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }
                field(Stream; Rec.Stream)
                {
                    ToolTip = 'Specifies the value of the Stream field.', Comment = '%';
                }
                field(Attandance; Rec.Attandance)
                {
                    ToolTip = 'Specifies the value of the Attandance field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(processing)
        {

            action("Present")
            {
                ApplicationArea = All;
                Caption = 'Present';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    EventManager.StudentAttandance(Rec."Entry No.", AttandanceType::Present, Rec.Year);
                    CurrPage.Update();
                end;
            }
            action("Absent")
            {
                ApplicationArea = All;
                Caption = 'Absent';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    EventManager.StudentAttandance(Rec."Entry No.", AttandanceType::Absent, Rec.Year);
                    CurrPage.Update();
                end;
            }
        }
    }
    var
        EventManager: Codeunit "Event Manager";
        AttandanceType: Option " ",Absent,Present;
}
