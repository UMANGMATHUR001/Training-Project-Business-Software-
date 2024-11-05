page 50003 Subjects
{
    ApplicationArea = All;
    Caption = 'Subjects';
    PageType = List;
    SourceTable = Subject;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field.', Comment = '%';
                }
                field("Subject Name"; Rec."Subject Name")
                {
                    ToolTip = 'Specifies the value of the Subject Name field.', Comment = '%';
                }
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
                field(Stream; Rec.Stream)
                {
                    ToolTip = 'Specifies the value of the Stream field.', Comment = '%';
                }
                field(Semester; Rec.Semester)
                {
                    ToolTip = 'Specifies the value of the Semester field.', Comment = '%';
                }

            }
        }
    }
}
