Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Private Sub cmdSummary_Click()
    Dim db As DAO.Database
    Dim rs As DAO.Recordset
    Dim qu As String
    Dim strCompanies As String
    Dim strStreets As String

    Set db = CurrentDb
    qu = "SELECT * FROM Company ORDER BY ID"
    Set rs = db.OpenRecordset(qu, dbOpenForwardOnly, dbReadOnly)

    Do While Not rs.EOF
        If strCompanies <> "" Then
            strCompanies = strCompanies & ", "
            strStreets = strStreets & ", "
        End If
        Debug.Print rs![Name of Company]
        strCompanies = strCompanies & rs![Name of Company]
        strStreets = strStreets & rs![Street address (main)]
        rs.MoveNext
    Loop

    rs.Close
    Set rs = Nothing

    MsgBox strCompanies, , "Companies"
    MsgBox strStreets, , "Streets"
End Sub

Private Sub Form_Dirty(Cancel As Integer)
    Debug.Print Me.Name_of_Company
    Debug.Print Me.Street_address__main_
End Sub
