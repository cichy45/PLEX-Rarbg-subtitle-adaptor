## Variable to hold path of Files that need to be renamed ##
$filePath = Get-Location

$files = Get-ChildItem -File -Recurse "$filePath"

## Array of extensions to delete
$extensionsToDelete = @(".exe", ".txt")

foreach($file in $files)  {     
    switch ($file.Name) {
        { $_ -like "*English.srt" -and $_ -NotLike "*English.eng*" } {
            Rename-Item $file.FullName -NewName "$($file.BaseName+".eng"+($file.extension))"
            Write-Host "Renaming English subs in: " $file.DirectoryName
            break
        }
        { $_ -like "*Polish.srt" -and $_ -NotLike "*Polish.pol*" } {
            Rename-Item $file.FullName -NewName "$($file.BaseName+".pol"+($file.extension))" 
            Write-Host "Renaming Polish subs in: " $file.DirectoryName
            break
        }
        { $_ -like "*German.srt" -and $_ -NotLike "*German.ger*" } {
            Rename-Item $file.FullName -NewName "$($file.BaseName+".ger"+($file.extension))"
            Write-Host "Renaming German subs in: " $file.DirectoryName
            break
        }
        { $_ -like "*.srt" -and $_ -NotLike "*eng.srt" -and $_ -NotLike "*pol.srt" -and $_ -NotLike "*ger.srt" -or $extensionsToDelete -contains $file.Extension } {
            Remove-Item -Recurse -Path $file.FullName -Force
            Write-Host "Deleting non eng/ger/pol subs or exe/txt files in: " $file.DirectoryName
            break
        }
    }
}

$folders = Get-ChildItem -Recurse -Directory $filePath

foreach($folder in $folders)  {
    if($folder.FullName -like "*Subs*") {
        $subs = Get-ChildItem -Recurse -File $folder.FullName
        Move-Item -Filter *.srt -Path $subs.FullName -Destination $folder.Parent.FullName
    } 
}

$dirs = gci "$filePath" -directory -recurse | Where { (gci $_.fullName).count -eq 0 } | select -expandproperty FullName
$dirs | Foreach-Object {Remove-Item $_ }