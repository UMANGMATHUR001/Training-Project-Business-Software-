tableextension 50000 UserSetupExt extends "User Setup"
{
    fields
    {
        field(50000; "User Type"; Option)
        {
            Caption = 'User Type';
            DataClassification = ToBeClassified;
            OptionMembers = Teacher,Admin;
        }
    }
}
