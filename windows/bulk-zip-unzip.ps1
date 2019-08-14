$dirPath = "E:\zip"
$destPath = "E:\unzip"
$filter = "*.zip"
$zipFileTemplate = "-Backup"
$unzippedFileExt = ".iha"
$oldRename = "CCMPCSHIS01"
$newRename = "CCH-MSPTHS01"

$folders = get-childitem -path $dirPath | where-object {$_.Psiscontainer}
$i=0
foreach ($d in $folders){
    echo "$i of $($folders.Count)"
    $files = Get-ChildItem $d.FullName -Filter $filter
    foreach ($f in $files){
        #expanding archive
        Expand-Archive -LiteralPath $f.FullName -DestinationPath $destPath
        
        #rename alarms.dat file
        $alarmFile = $destPath+"\Alarms.dat"
        $newname   = $f.BaseName+"-Alarms.dat"
        if (Test-Path $alarmFile) {
             Rename-Item $alarmFile -NewName $newname
        }

        #replace old name with new name
        $unzippedFile = $destPath + "\" + $f.BaseName.Substring(0,$f.BaseName.IndexOf($zipFileTemplate)) + $unzippedFileExt
        $newName = $unzippedFile -replace $oldRename, $newRename
        Rename-Item $unzippedFile -NewName $newName
    }
    $i++
}
echo "Done"
