#Requires AutoHotkey v2.0

; Make this hotkey ONLY work when Windows Explorer is active
#HotIf WinActive("ahk_class CabinetWClass")

; Press Ctrl + Shift + V to toggle between Details and Medium Icons
^+v:: {
    ; Create a static variable to remember the current state
    static toggle := false
    
    ; Flip the toggle state (true becomes false, false becomes true)
    toggle := !toggle 
    
    if (toggle) {
        Send("^+3") ; Sends Ctrl+Shift+3 (Medium Icons)
    } else {
        Send("^+6") ; Sends Ctrl+Shift+6 (Details View)
    }
}

; Reset context sensitivity so any hotkeys below this work globally
#HotIf