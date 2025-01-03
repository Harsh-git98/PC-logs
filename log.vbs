Dim objWMIService, colProcesses, objProcess, objFSO, objFile
Dim logFile, strDate

logFile = "logg.txt"
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.OpenTextFile(logFile, 8, True)

Do
    Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
    Set colProcesses = objWMIService.ExecQuery("Select * from Win32_Process")

    ' Log the date and time
    objFile.WriteLine "========================================="
    objFile.WriteLine Now
    objFile.WriteLine "========================================="

    ' Log each process
    For Each objProcess In colProcesses
        objFile.WriteLine objProcess.Name
    Next

    objFile.WriteLine vbCrLf
    objFile.Flush

    ' Wait for 60 seconds
    WScript.Sleep 60000
Loop
