#Requires AutoHotkey v2.0

; Atajo de teclado: Control + Alt + D
^!d:: {
    ; Intenta encontrar el manejador (HWND) de los iconos del escritorio
    if !hw_Icons := ControlGetHwnd("SysListView321", "ahk_class Progman")
        hw_Icons := ControlGetHwnd("SysListView321", "ahk_class WorkerW")

    ; Verifica si son visibles y alterna el estado
    if DllCall("IsWindowVisible", "Ptr", hw_Icons)
        WinHide(hw_Icons)
    else
        WinShow(hw_Icons)
}