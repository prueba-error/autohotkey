#Requires AutoHotkey v2.0
#HotIf WinActive("ahk_class CabinetWClass") ; Only triggers inside Windows Explorer

; --- SHORTCUT 1: Ctrl + Alt + T (Standard User) ---
^!t:: { 
    launchTerminal(false)
}

; --- SHORTCUT 2: Ctrl + Alt + Shift + T (Administrator) ---
^!+t:: { 
    launchTerminal(true)
}

; Helper function to avoid repeating the path-finding logic
launchTerminal(asAdmin) {
    explorerWindow := WinExist("A")
    if !explorerWindow
        return

    targetPath := ""
    
    ; Use COM to safely grab the path from the active Explorer window/tab
    for window in ComObject("Shell.Application").Windows {
        if (window.HWND == explorerWindow) {
            try {
                targetPath := window.Document.Folder.Self.Path
                break
            }
        }
    }

    ; Fallback if COM fails (e.g., if it's a system virtual folder)
    if (targetPath == "" || InStr(targetPath, "::")) {
        return
    }

    ; Generate a unique ID for this specific terminal launch
    uniqueTitle := "LaunchWT_" A_TickCount

    ; Launch Windows Terminal with the unique title tag
    try {
        if (asAdmin) {
            Run('*RunAs wt.exe -p "Windows PowerShell" -d "' targetPath '" --title "' uniqueTitle '"')
        } else {
            Run('wt.exe -p "Windows PowerShell" -d "' targetPath '" --title "' uniqueTitle '"')
        }
        
        ; Wait specifically for the new terminal matching our unique title, up to 3 seconds
        if WinWait(uniqueTitle " ahk_exe WindowsTerminal.exe", , 3) {
            WinActivate(uniqueTitle " ahk_exe WindowsTerminal.exe")
        }
        
    } catch {
        MsgBox("Could not launch Windows Terminal at: " targetPath, "Error", 48)
    }
}
#HotIf