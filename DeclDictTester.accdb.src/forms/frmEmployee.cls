Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub cmdOutput_Click()
    Dim strOutput As String

    strOutput = "Employee data:" & vbNewLine _
        & "Last name " & Me.LastName & vbNewLine _
        & "First name " & Me!FirstName _
        & IIf(Not Me.NewRecord, vbNewLine & "ID " & CStr(Me.[ID]), "")
    VBA.MsgBox strOutput, , "Output"
End Sub
