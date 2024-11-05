page 50002 Classes
{
    ApplicationArea = All;
    Caption = 'Classes';
    PageType = List;
    SourceTable = Class;
    UsageCategory = Lists;
    CardPageID = "Class Card";
    Editable = false;

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
                field(Stream; Rec.Stream)
                {
                    ToolTip = 'Specifies the value of the Stream field.', Comment = '%';
                }
                field(Session; Rec.Session)
                {
                    ToolTip = 'Specifies the value of the Session field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
            }
        }
    }
}
