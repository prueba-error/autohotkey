#Requires AutoHotkey v2.0

; Override Win + E using the $ hook
$#e:: {
    userProfile := EnvGet("USERPROFILE")

    ; Create an InputHook: 
    ; L1 = Limit to 1 character
    ; T2 = Timeout after 2 seconds
    ih := InputHook("L1 T2")
    
    ; Start listening for the next key
    ih.Start()
    ih.Wait()

    ; Convert the input to lowercase to guarantee case-insensitivity
    switch StrLower(ih.Input) {
        
        case "d":
            ; Desktop
            Run('shell:Desktop') 
        
        case "e":
            ; User Profile / Home directory
            Run(userProfile) 
            
        case "c":
            ; Code directory
            Run(userProfile "\Code") 

        case "s":
            ; "This PC" / My Computer
            Run('shell:MyComputerFolder')
            
        case "l":
            ; Labubu folder on Desktop
            Run(userProfile "\Desktop\labubu") 

        default:
            ; Fallback: If you press Win+E and let it time out, 
            ; or press an unmapped key, just open standard Explorer.
            Run('explorer.exe')
    }
}