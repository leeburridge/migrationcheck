<#
  Simple looped script that updates every 30 seconds to display current status
  of mail migrations in Exchange
  (C)2017 Lee Burridge
#>
cls
do {
Get-MoveRequest | where {$_status -notlike "complete*"} | Get-MoveRequestStatistics | select DisplayName,status,percentcomplete,itemstransferred
$mr = get-moverequest -movestatus inprogress 
start-Sleep -s 30
} until (-not $mr)
