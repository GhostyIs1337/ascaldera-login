#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#InstallKeybdHook
#UseHook On
DetectHiddenText, on

FileCreateDir, C:\Users\*\Desktop\CSV Files

Run, iStor, C:\*


uid := "*"
pw := "*"

Sleep, 2000

DetectHiddenWindows, on
#IfWinActive, Logon
{
	SendInput {Tab 3}
	SendInput %uid%
	SendInput {Tab}
	SendInput %pw%
	SendInput {Enter}

}

sleep 2000

SetTimer process_watcher, 100

process_watcher:
	Process Exist, iStorStorageServerConsole.exe
	If ErrorLevel = 0
		Exitapp
return