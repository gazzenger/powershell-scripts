$dirPath = "C:\Users\gnamestnik\Desktop\archives"
$destPath = "C:\Users\gnamestnik\Desktop\unzipped"

$folders = get-childitem -path $dirPath | where-object {$_.Psiscontainer}
$i=0
foreach ($d in $folders){
    echo "$i of $($folders.Count)"
    $files = Get-ChildItem $d.FullName -Filter *.zip
    foreach ($f in $files){
        Expand-Archive -LiteralPath $f.FullName -DestinationPath $destPath
        $alarmFile = $destPath+"\Alarms.dat"
        $newname   = $f.BaseName+"-Alarms.dat"
        if (Test-Path $alarmFile) {
             Rename-Item $alarmFile -NewName $newname
        }
    }
    $i++
}
