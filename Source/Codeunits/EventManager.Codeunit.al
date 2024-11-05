codeunit 50000 "Event Manager"
{
    trigger OnRun()
    var
        SO: Page "Customer Ledger Entries";
    begin

    end;

    procedure StudentAttandance(pEntryNo: Integer; pAttandanceType: Option " ",Absent,Present; pYear: Integer)
    var
        StudentAttendance: Record "Student Attendance";
        StudentAttendance1: Record "Student Attendance";
        StudentAttendance2: Record "Student Attendance";
        EntryNo: Integer;
    begin
        StudentAttendance.GET(pEntryNo);

        StudentAttendance1.RESET;
        StudentAttendance1.SetRange("Subject ID", StudentAttendance."Subject ID");
        StudentAttendance1.SetRange("Class Code", StudentAttendance."Class Code");
        StudentAttendance1.SetRange(Date, Today);
        StudentAttendance1.SetRange(Year, pYear);
        StudentAttendance1.SetRange("Attandance Type", StudentAttendance1."Attandance Type"::Subject);
        if NOT StudentAttendance1.FindFirst() then begin
            Clear(EntryNo);
            StudentAttendance1.Reset();
            if StudentAttendance1.FindLast() then
                EntryNo := StudentAttendance1."Entry No.";

            StudentAttendance2.Init();
            StudentAttendance2."Entry No." := EntryNo + 1;
            StudentAttendance2."Subject ID" := StudentAttendance."Subject ID";
            StudentAttendance2.Date := Today;
            StudentAttendance2.Attandance := StudentAttendance2.Attandance::Present;
            StudentAttendance2."Attandance Type" := StudentAttendance2."Attandance Type"::Subject;
            StudentAttendance2.Year := pYear;
            StudentAttendance2.Validate("Class Code", StudentAttendance."Class Code");
            StudentAttendance2."Attandance Value" := 1;

            StudentAttendance2.Insert();
        end;

        StudentAttendance.Attandance := pAttandanceType;
        StudentAttendance.Modify();
    end;


    procedure InitStudentAttandance(pSubj: Code[20]; pClass: Code[20]; pYear: Integer)
    var
        StudentAttendance: Record "Student Attendance";
        StudentAttendance1: Record "Student Attendance";
        StudentAttendance2: Record "Student Attendance";
        Student: Record Students;
        StudentClass: Record "Student Classes";
        EntryNo: Integer;
    begin
        StudentClass.RESET;
        StudentClass.SetRange(Year, pYear);
        StudentClass.SetRange("Class Code", pClass);
        StudentClass.SetRange(Status, StudentClass.Status::Active);
        if StudentClass.FindSet() then
            repeat
                StudentAttendance1.RESET;
                StudentAttendance1.SetRange("Class Code", pClass);
                StudentAttendance1.SetRange("Subject ID", pSubj);
                StudentAttendance1.SetRange(Date, Today);
                StudentAttendance1.SetRange("Attandance Type", StudentAttendance1."Attandance Type"::Student);
                StudentAttendance1.SetRange(Year, pYear);
                StudentAttendance1.SetRange("Student No.", StudentClass."Student No.");
                if NOT StudentAttendance1.FindFirst() then begin

                    Clear(EntryNo);
                    StudentAttendance2.Reset();
                    if StudentAttendance2.FindLast() then
                        EntryNo := StudentAttendance2."Entry No.";

                    Student.GET(StudentClass."Student No.");
                    StudentAttendance.Reset();
                    StudentAttendance.Init();
                    StudentAttendance."Entry No." := EntryNo + 1;
                    StudentAttendance."Student No." := StudentClass."Student No.";
                    StudentAttendance."First Name" := Student."First Name";
                    StudentAttendance."Middle Name" := Student."Middle Name";
                    StudentAttendance."Last Name" := Student."Last Name";
                    StudentAttendance.Year := pYear;
                    StudentAttendance.Validate("Class Code", pClass);
                    StudentAttendance."Subject ID" := pSubj;
                    StudentAttendance."Roll No." := Student."Roll No.";
                    StudentAttendance.Date := Today;
                    StudentAttendance."Attandance Value" := 1;
                    StudentAttendance."Attandance Type" := StudentAttendance."Attandance Type"::Student;
                    StudentAttendance.Insert();
                end;
            until StudentClass.Next() = 0;
    end;


}
