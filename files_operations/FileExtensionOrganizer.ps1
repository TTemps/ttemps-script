function FileExtensionOrganizer {
    param (
    [Parameter(Mandatory=$true)] # Parameter is mandatory
    [string]$Directory
)
#Verify if the directory exists
if (Test-Path $Directory) {
    $files = Get-ChildItem $Directory -Recurse -File
    foreach ($file in $files) {
        # Check if the file has an extension
        if ($file.Extension) {
            # Get the extension of the file, handle every extension
            $extension = $file.Extension -replace '\.','' # Remove the dot from the extension
            $destinationFolder = Join-Path $Directory $extension # Destination folder is the extension of the file
            # Create the destination folder if it does not exist
            if (-not (Test-Path $destinationFolder)) {
                New-Item -Path $destinationFolder -ItemType Directory
            }
            # then move the file to the destination folder
            try {
                Move-Item -Path $file.FullName -Destination $destinationFolder -ErrorAction Stop 
            }
            catch {
                Write-Host "Error moving file $file to $destinationFolder"
                # Rename the file with a random number and move it to the destination folder
                $random = Get-Random -Minimum 100000000000 -Maximum 9999999999999999
                $newFile = Join-Path $destinationFolder "$($file.BaseName)$random$($file.Extension)"
                Move-Item -Path $file.FullName -Destination $newFile
            }
            
        } else {
            # Handle files without extensions
        
            $destinationFolder = Join-Path $Directory "NoExtension" # Destination folder for files without extensions
            # Create the destination folder if it does not exist
            if (-not (Test-Path $destinationFolder)) {
                New-Item -Path $destinationFolder -ItemType Directory
            }
            # then move the file to the destination folder
            Move-Item -Path $file.FullName -Destination $destinationFolder
        }
    }
} else {
    Write-Host "Directory does not exist"
    exit 1
}
    
}