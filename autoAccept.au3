#include <ImageSearch2015.au3>

HotKeySet("{Esc}", "exitapp")
Global $x=0
Global $y=0
repeat()

Func repeat()
While True 
    $accept = _ImageSearch("accept.png", 0, $x, $y, 10)
    If $accept = True  Then
        startapp()      
    EndIf 
WEnd
EndFunc         

Func startapp()
    MouseClick($MOUSE_CLICK_LEFT, $x-100, $y-110, 1)
    MouseMove (0, 0 ,0)
    repeat()
EndFunc     

Func exitapp()
    Exit
EndFunc    