$dirPath = "C:\Users\gnamestnik\Desktop\archives"
$destPath = "C:\Users\gnamestnik\Desktop\unzipped"
$filter = "*.zip"

$folders = get-childitem -path $dirPath | where-object {$_.Psiscontainer}
$i=0
foreach ($d in $folders){
    echo "$i of $($folders.Count)"
    $files = Get-ChildItem $d.FullName -Filter $filter
    foreach ($f in $files){
        #expanding archive
        Expand-Archive -LiteralPath $f.FullName -DestinationPath $destPath
        #comptressing archive
        #Compress-Archive -LiteralPath 'C:\Reference\Draft Doc.docx', 'C:\Reference\Images\Diagram [2].vsd'  -CompressionLevel Optimal -DestinationPath C:\Archives\Draft.Zip
        $alarmFile = $destPath+"\Alarms.dat"
        $newname   = $f.BaseName+"-Alarms.dat"
        if (Test-Path $alarmFile) {
             Rename-Item $alarmFile -NewName $newname
        }
    }
    $i++
}
