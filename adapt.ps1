
## Variable to hold path of Files that need to be renamed ##
$filePath = Get-Location

$files = Get-ChildItem -File -Recurse "$filePath"

            foreach($file in $files)  {     
            if($file.FullName -like "*English*") {
				if($file.FullName -NotLike "*English.eng*") {
                Rename-Item $file.FullName -NewName "$($file.BaseName+".eng"+($file.extension))"
				Write-Host "Renaming English subs in: " $file.DirectoryName
				}
            }
			elseif($file.FullName -like "*Polish*") {
				if($file.FullName -NotLike "*Polish.pol*") {
                Rename-Item $file.FullName -NewName "$($file.BaseName+".pol"+($file.extension))" 
				Write-Host "Renaming Polish subs in: " $file.DirectoryName
				}
            }
			elseif($file.FullName -like "*German*") {
				if($file.FullName -NotLike "*German.ger*") {
                Rename-Item $file.FullName -NewName "$($file.BaseName+".ger"+($file.extension))"
				Write-Host "Renaming German subs in: " $file.DirectoryName				
				}
            }
			else {
				if($file.Extension -like "*.srt") {
					Remove-Item -Recurse -Path $file.FullName -Force
					Write-Host "Deleting non eng/ger/pol subs in: " $file.DirectoryName
				}
				if($file.Extension -like "*.exe") {
					Remove-Item -Recurse -Path $file.FullName -Force
					Write-Host "Deleting exe in: " $file.DirectoryName
				}
				if($file.Extension -like "*.txt") {
					Remove-Item -Recurse -Path $file.FullName -Force
					Write-Host "Deleting txt in: " $file.DirectoryName
				}
			}
        }