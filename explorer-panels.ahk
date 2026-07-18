; ============================================
; Función: Verifica si la ventana activa es un Explorador
; ============================================
IsExplorerActive() {
    winClass := WinGetClass("A")
    ; CabinetWClass → Explorador normal
    ; ExplorerWClass → Algunas vistas internas ( por ejemplo, "Guardar como..." )
    return (winClass = "CabinetWClass" || winClass = "ExplorerWClass")
}


; ============================================
; Función: Verificar si el control actual es editable
; (barra de direcciones, búsqueda, etc.)
; ============================================
IsEditableControl() {
    hCtrl := ControlGetFocus("A")
    if !hCtrl
        return false

    classNN := ControlGetClassNN(hCtrl, "A")
    if InStr(classNN, "Edit")
        return true

    return false
}


; ============================================
; Función: Detectar si se está renombrando un archivo
; (cuando F2 abre el cuadro de edición en el panel derecho)
; ============================================
IsRenamingFile() {
    hCtrl := ControlGetFocus("A")
    if !hCtrl
        return false

    classNN := ControlGetClassNN(hCtrl, "A")

    ; Si es un control Edit pero su padre es el control DirectUIHWND del explorador,
    ; entonces es una edición de nombre de archivo.
    if InStr(classNN, "Edit") {
        try {
            parentHwnd := DllCall("GetParent", "Ptr", hCtrl, "Ptr")
            if parentHwnd {
                parentClass := WinGetClass(parentHwnd)
                if InStr(parentClass, "DirectUIHWND") || InStr(parentClass, "CabinetWClass")
                    return true
            }
        }
    }

    return false
}



; ===============================
; Ir al panel de navegación Ctrl+Alt+N
; ===============================
^!n::
{
    if !IsExplorerActive()
        return

    if IsEditableControl() || IsRenamingFile()
        return

    WinActivate("ahk_class CabinetWClass")	

    Send "!d" 
    Sleep 50 
    Send "{Tab 1}" 

    return
}


; ===============================
; Ir al panel de contenido  Ctrl+Alt+C 
; ===============================
^!c::
{
    if !IsExplorerActive()
        return

    if IsEditableControl() || IsRenamingFile()
        return

    WinActivate("ahk_class CabinetWClass")	

    Send "!d" 
    Sleep 50 
    Send "{Tab 2}" 

    return
}
