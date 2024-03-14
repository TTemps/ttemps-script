## Problem: 'charmap' Codec Error in Windows 11 with UTF-8 Encoded Git Commit Messages

### Problem Description

When automating git commit messages in Windows 11 using scripts, an error occurs if the commit messages are UTF-8 encoded. The error message is:
`'charmap' codec can't encode characters in position xxx-xxx: character maps to <undefined>`.

This issue arises because the system locale is not set to use Unicode UTF-8 for worldwide language support, causing encoding issues in scripts running on Windows 11.

### Solution

To resolve this issue, set the system locale to use Unicode UTF-8 for worldwide language support. This can be done by following these steps:

1. Open the Windows Settings app.
2. Click on "Time & Language".
3. Click on "Language".
4. Click on "Administrative language settings".
5. In the "Region" window, click on "Change system locale...".
6. Check the box for "Beta: Use Unicode UTF-8 for worldwide language support".
7. Click "OK" and restart your computer.

or by running the following command in this script as an administrator:
    
```bash
bash -c "$(wget -qLO - https://raw.githubusercontent.com/TTemps/ttemps-script/main/charmap-encoding/run.ps1)"
```
