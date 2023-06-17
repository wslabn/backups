#copy files from nas drive to server for azure backups
##
$logFolder = "c:\scripts\logs"
$logCount = (Get-ChildItem | Measure-Object).count
$logDate = (Get-Date).ToString("MM_dd_yyyy")
$logFile = "$logFolder\NasCopy_$logDate.log"

function logCleanup{
    if($logCount -gt 14){
        Get-ChildItem $logFolder | Sort CreationTime | Select -First 1 | Remove-Item
    }
}

function writeLog{
    Param ([string]$LogString)
    $Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
    $LogMessage = "$Stamp $LogString"
    Add-content $LogFile -value $LogMessage
}

logcleanUp
robocopy "z:\" "D:\shared" /mir /log:$logFile

if($LASTEEXITCODE -gt 1){
    cd C:\scripts
    node sendError.js
    exit
}else{
    exit
}


