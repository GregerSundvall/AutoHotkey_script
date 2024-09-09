#Requires AutoHotkey v2.0


SwitchToOrStartApp(query, command) {
	if WinExist(query) { 
		WinActivate
    	} else {
		Run command
		WinWait query
		Winactivate
	}
}

#e::SwitchToOrStartApp("ahk_class CabinetWClass", "explorer")
#f::SwitchToOrStartApp("firefox.exe", "firefox")
#t::SwitchToOrStartApp("ahk_class CASCADIA_HOSTING_WINDOW_CLASS", "wt")

/*
Explorer(){
	if WinExist("ahk_class CabinetWClass") { 
		WinActivate
    	} else {
		Run "explorer"
		WinWait "ahk_class CabinetWClass"
		Winactivate
	}
}

Firefox(){
	if WinExist("ahk_exe firefox.exe") { 
		WinActivate
    	} else {
		Run "firefox"
		WinWait "ahk_exe firefox.exe"
		Winactivate
	}
}


#f::Firefox
#e::Explorer
*/




/* Close tab/window with Alt-w */
!w::^w


/* Move some keys on Lofree keeb */
Numpad8::Up
NumpadUp::Up
Numpad5::Down
NumpadClear::Down
Numpad6::Right
NumpadRight::Right
Numpad4::Left
NumpadLeft::Left

Numpad7::Home
NumpadHome::Home
Numpad9::End
NumpadPgUp::End
NumpadMult::PgDn
NumLock::Del



/* Alt-Esc closes active window */
!Esc:: WinClose(ActiveHwnd := WinExist("A"))

^![::å
^!'::ä
^!;::ö
^!+[::Å
^!+'::Ä
^!+;::Ö

/* Make capslock not sticky, unless double-tapped */
CapsLock:: {
   start := A_TickCount                              ; run once
   KeyWait('CapsLock')                               ; wait for Capslock to be released
   if (A_TickCount - start < 200)                    ; in 0.2 seconds
   and KeyWait('CapsLock', 'D T0.2')                 ; and pressed again within 0.2 seconds
   and (A_PriorKey = 'CapsLock')                     ; block other keys
      SetCapsLockState !GetKeyState('CapsLock', 'T')
}
*CapsLock:: return                                   ; This forces capslock into a modifying key.

/* Get åäö with capslock as modifier, on ['; keys */
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