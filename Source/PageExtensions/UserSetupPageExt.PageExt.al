pageextension 50000 UserSetupPageExt extends "User Setup"
{
    layout
    {
        addafter(PhoneNo)
        {
            field("User Type"; Rec."User Type")
            {
                ApplicationArea = All;
            }
        }
    }
}
