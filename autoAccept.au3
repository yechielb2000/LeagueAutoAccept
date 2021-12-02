#include <ImageSearch2015.au3>

HotKeySet("{f1}", "exitapp")
$x=0
$y=0
repeat()
MouseMove($x, $y, 3)
Func repeat()
While(1)
    $accept = _ImageSearch("pix.png", 0, $x, $y, 0)
    If $accept = 1  Then
        ConsoleWrite("It's passed the if")
        startapp()      
    EndIf 
WEnd
EndFunc       

Func startapp()
    ConsoleWrite("It's recognize the image") 
    MouseMove($x, $y, 1)
    MouseClick("primary")
    repeat()
EndFunc     

Func exitapp()
    Exit
EndFunc    