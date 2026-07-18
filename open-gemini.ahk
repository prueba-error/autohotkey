#Requires AutoHotkey v2.0
#SingleInstance Force

; Atajo: Ctrl + Alt + G
^!g:: {
    RutaBrave := '"C:\Program Files\BraveSoftware\Brave-Browser\Application\chrome_proxy.exe"'
    Argumentos := '--profile-directory=Default --app-id=gdfaincndogidkdcdkhapmbffkckdkhn'
    
    ; Ejecuta la aplicación pasando los argumentos correctamente delimitados
    Run(RutaBrave ' ' Argumentos)
}