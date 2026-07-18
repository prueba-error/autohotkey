#Requires AutoHotkey v2.0

#-:: {
    ; Wait for the first '-' key to be released
    KeyWait "-" 
    
    ; Wait up to 300 milliseconds for '-' to be pressed down again
    if KeyWait("-", "D T0.3") {
        ; Double tap detected: Open Add/Remove Programs applet
        Run "appwiz.cpl"
        
        ; Wait for release so holding it doesn't spam the command
        KeyWait "-" 
    } else {
        ; Single tap detected: Open main Control Panel
        Run "control"
    }
}