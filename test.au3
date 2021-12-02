#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <StructureConstants.au3>

Global $iLVFlag = -1

$hGUI = GUICreate("Test", 500, 500)

$cLV = GUICtrlCreateListView("Items to click", 10, 10, 400, 300)
$hLV = GUICtrlGetHandle($cLV)
For $i = 0 To 9
    GUICtrlCreateListViewItem("Item " & $i, $cLV)
Next

GUISetState()

GUIRegisterMsg($WM_NOTIFY, "_WM_NOTIFY")

While 1

    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            Exit
    EndSwitch

    ; Look for flag
    If $iLVFlag <> -1 Then
        ; Run the associated function
        _LVClicked()
        ; Reset the flag
        $iLVFlag = -1
    EndIf

WEnd

Func _LVClicked()
    MsgBox($MB_SYSTEMMODAL, "Hi", "You clicked item " & $iLVFlag)
EndFunc   ;==>_LVClicked

Func _WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)

    $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
    $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
    $iCode = DllStructGetData($tNMHDR, "Code")
    Switch $hWndFrom
        Case $hLV
            Switch $iCode
                Case $NM_CLICK
                    Local $tInfo = DllStructCreate($tagNMLISTVIEW, $lParam)
                    Local $iItem = DllStructGetData($tInfo, "Item")
                    If $iItem <> -1 Then
                        ; Set the flag
                        $iLVFlag = $iItem
                    EndIf
            EndSwitch
    EndSwitch
    Return $GUI_RUNDEFMSG
EndFunc   ;==>_WM_NOTIFY