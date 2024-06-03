Measure-Command {
    $list = @{} # Create a hash table to store the file hashes
    $list2 = @{} # Create a hash table to store the file hashes
    $list = Get-ChildItem -Path "C:\ps\" -Recurse -File -ErrorAction Ignore | Get-FileHash -ErrorAction Ignore  # Get the file hashes
    $list | ForEach-Object { # Loop through the file hashes
        if ($list2.ContainsKey($_.Hash)) { # Check if the hash already exists in the list
            $_ # Output the file name and path
        } else {
            # Add the hash to the list, path and file name
            $list2[$_.Hash] = $_ 
        }
    }
} 
