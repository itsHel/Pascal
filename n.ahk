#SingleInstance force								; ALT+s - Instant Google
#Persistent
;#InstallKeybdHook
;#UseHook 
#HotkeyModifierTimeout -1
#NoEnv
setkeydelay -1
SendMode EVENT

SetScrollLockState, off								; ALT+w - Search
setnumlockstate, on
coordmode, mouse									; ALT+d - Copy + Search Google
setmousedelay ,-1									; CTRL+Wheel - Sound
setcontroldelay -1									; ALT+f - url open  (mouse)
SetTitleMatchMode 2									; ALT+e - Save + Reaload (Notepad++)
mouseblockon := true

GroupAdd, non_sound, ahk_class CEFCLIENT
GroupAdd, non_sound, ahk_class Notepad++

GroupAdd, turn_off, ahk_class grcWindow

GroupAdd, browsers, ahk_exe Chrome.exe
GroupAdd, browsers, ahk_exe Opera.exe

a:=0

; --------------------------------------------						 --------------------------------------------

~!tab::
	sleep 200
	SetCapsLockState, off
	return

F6:: 
	Winset, Alwaysontop, , A ; ctrl + space
	msgbox, Window set to always on top (F6)
	return

XButton1::del
XButton2::Home
NumpadEnter::tab

$!c::send,console.log()`;{left}{left}

^b::
	oldc := clipboard
	sendinput ^c
	sleep 40
	newc := clipboard
	clipboard := oldc
	sendinput ^v
	sleep 40
	clipboard := newc
	return

scrolllock::
	suspend
	if(getkeystate("scrolllock", "T"))
		SetScrollLockState off
	else
		SetScrollLockState on
	return
	
^esc::reload
#esc::pause

:*:for__::for(let i = 0`; i < `; i{+}{+}){Left 6}
					
#IfWinActive ahk_class Photo_Lightweight_Viewer
{
	XButton2::F11
	MButton::sendinput,{Space}
}#IfWinActive
	
NumpadDot::.
	
^!o::sendinput,{insert}

#IfWinActive ahk_class Notepad++
{
	!e::											;Save reload
		sendinput,^s
		reload
		return
	!v::sendinput,border:1px solid red;

	!g::sendinput,/`*{end}`*/
	^q::sendinput,^+t  
	
}#IfWinActive

$!^WheelUp::^WheelUp
$!^WheelDown::^Wheeldown

$!WheelUp::sendinput,{Blind}{WheelUp 6}
$!WheelDown::sendinput,{Blind}{WheelDown 6}

#IfWinactive ahk_group browsers
{
	!sc003::sendinput,^+i
	!sc004::sendinput,^+o
	;xbutton2::sendinput,!{left}
	xbutton1::sendinput,!{left}
	!r::send,^l											;go to bar
	^q::send,^+t
	;^a::send,^+i
	F10::send,^w
	#If A_IsPaused
	RButton::Pause, Off
	#If
	
	^space::send, !{left}
	
	!q::send,^{F5}
}#IfWinactive
						
#ifWinNotActive ahk_group turn_off
{
	SC00B::=
	+SC00B::0
	SC003::\
	+SC003::2
	;+SC004::3
	;SC004::\
	SC005::$
	+SC005::4
	SC006::[
	+SC006::5
	SC007::^
	+SC007::6
	SC008::#
	+SC008::7
	SC009::sendinput,``
	+SC009::8
	SC00A::]
	+SC00A::9
	!SC002::
	
	$wheelup::
		sendinput,{wheelup}
		sleep 1
		sendinput,{wheelup}
		return
	$wheeldown::
		sendinput,{wheeldown}
		sleep 1
		sendinput,{wheeldown}
		return
}#ifWinNotActive

!i::
	inputbox,vstup,slovnik,,,160,122,			
	If ((ErrorLevel == 1) || (vstup=="")) 	
		return	
	WinActivateBottom , ahk_exe opera.exe
	sendinput,^t
	clipboard=https://slovnik.seznam.cz/en/?q=%vstup%  			;https://slovnik.seznam.cz/cz-en/?q=%vstup%
	sleep 100
	sendinput,^v{Enter}
	return

$!Space::sendinput,{backspace}

#IfWinactive ahk_exe chrome.exe
{
	RButton::
		keywait, RButton
		if (A_PriorKey=="RButton")
			click right
		return
}#IfWinactive

#IfWinactive ahk_class vguiPopupWindow
{
	!d::
		sendinput,username76545
		sendinput,{tab}
		sleep 20
		sendinput,7654576545
		sleep 20
		sendinput,{enter}
		return
}

#ifWinNotActive ahk_class Special
{
;-------caps--------
;CapsLock::Enter
CapsLock::
	KeyWait, CapsLock
	If (A_PriorKey=="CapsLock")
		;sendinput,{Enter}
		;send,{Enter up}{Enter down}
		;sendPLAY,{Enter up}{Enter down}
		send,{Enter}
		
		
		
		
Return

#If, GetKeyState("CapsLock", "P")
	q::sendinput,!{Left}
	e::Backspace
	w::Up
	a::Left
	s::Down
	d::Right
#If

}#ifWinNotActive
