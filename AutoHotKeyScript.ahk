#Requires AutoHotkey v2.0



!^q:: WinClose(ActiveHwnd := WinExist("A"))

^![::å
^!'::ä
^!;::ö
^!+[::Å
^!+'::Ä
^!+;::Ö


CapsLock:: {
   start := A_TickCount                              ; run once
   KeyWait('CapsLock')                               ; wait for Capslock to be released
   if (A_TickCount - start < 200)                    ; in 0.2 seconds
   and KeyWait('CapsLock', 'D T0.2')                 ; and pressed again within 0.2 seconds
   and (A_PriorKey = 'CapsLock')                     ; block other keys
      SetCapsLockState !GetKeyState('CapsLock', 'T')
}
*CapsLock:: return                                   ; This forces capslock into a modifying key.

#HotIf GetKeyState("CapsLock", "P")
[::å
+[::Å
'::ä
+'::Ä
`;::ö
+`;::Ö
#HotIf

/*
WheelUp::WheelDown
WheelDown::WheelUp
*/
/*
WheelUp:: {
    SendInput "{WheelDown}"
    Return
}

WheelDown::{
    SendInput "{WheelUp}"
    Return
}
*/