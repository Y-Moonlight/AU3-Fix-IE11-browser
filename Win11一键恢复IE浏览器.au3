#NoTrayIcon  
#RequireAdmin

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=D:\Users\Desktop\AU3脚本开发\恢复ie浏览器\Form1.kxf
DirCreate("C:\Windows\Temp\ietemp")
DirCreate("C:\Windows\Temp\ietemp\System32")
DirCreate("C:\Windows\Temp\ietemp\SysWOW64")
FileInstall("D:\Users\Desktop\AU3脚本开发\恢复ie浏览器\ietemp\ico.ico","C:\Windows\Temp\ietemp\")


$Form1 = GUICreate("Win11一键恢复IE浏览器 By飘白", 451, 231, -1, -1,$WS_CAPTION)
GUISetBkColor(0xA6CAF0)
$Icon1 = GUICtrlCreateIcon("C:\Windows\Temp\ietemp\ico.ico", -1, 32, 24, 48, 48)
$Label1 = GUICtrlCreateLabel("Win11一键恢复IE浏览器 By飘白", 144, 20, 239, 26)
GUICtrlSetFont(-1, 12, 800, 0, "微软雅黑")
$Label2 = GUICtrlCreateLabel("Win11一键恢复IE浏览器工具可以用来轻松恢复Win11", 112, 52, 297, 21)
GUICtrlSetFont(-1, 9, 800, 0, "微软雅黑")
$Label3 = GUICtrlCreateLabel("内置IE11浏览器。", 112, 67, 101, 21)
GUICtrlSetFont(-1, 9, 800, 0, "微软雅黑")
$Label4 = GUICtrlCreateLabel("Win11虽然还保留了IE11内核，但是打开IE11会跳转到", 112, 82, 297, 21)
GUICtrlSetFont(-1, 9, 800, 0, "微软雅黑")
$Label5 = GUICtrlCreateLabel("Edge浏览器。卸载或精简了Edge浏览器会导致报错！", 112, 97, 292, 21)
GUICtrlSetFont(-1, 9, 800, 0, "微软雅黑")
$Label6 = GUICtrlCreateLabel("此工具可以修复Windows11自带的IE11浏览器，并且", 112, 112, 292, 21)
GUICtrlSetFont(-1, 9, 800, 0, "微软雅黑")
$Label7 = GUICtrlCreateLabel("可以创建IE11桌面图标。", 112, 127, 137, 21)
GUICtrlSetFont(-1, 9, 800, 0, "微软雅黑")
$Button1 = GUICtrlCreateButton("恢复当前系统", 68, 160, 80, 35)
GUICtrlSetFont(-1, 9, 800, 0, "微软雅黑")
$Button2 = GUICtrlCreateButton("创建快捷方式", 188, 160, 80, 35)
GUICtrlSetFont(-1, 9, 800, 0, "微软雅黑")
$Button3 = GUICtrlCreateButton("退出", 308, 160, 80, 35)
GUICtrlSetFont(-1, 9, 800, 0, "微软雅黑")
$Label8 = GUICtrlCreateLabel("作者:@飘白     QQ:3391680446", 16, 205, 199, 23)
GUICtrlSetFont(-1, 10, 800, 0, "微软雅黑")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			DirRemove("C:\Windows\Temp\ietemp",1)
			Exit
		Case $Button3
			DirRemove("C:\Windows\Temp\ietemp",1)
			Exit
		Case $Label8
			MsgBox(0+64,"关于","软件作者:@飘白     QQ:3391680446")
		Case $Button2
			Sleep(500)
			FileInstall("D:\Users\Desktop\AU3脚本开发\恢复ie浏览器\ietemp\desktop.reg","C:\Windows\Temp\ietemp\")
			Sleep(500)
			Local $sRegFilePath = "C:\Windows\Temp\ietemp\desktop.reg"
            Local $sRegEditCmd = 'regedit.exe /s "' & $sRegFilePath & '"'
			Local $iExitCode = Run($sRegEditCmd, "", @SW_HIDE)
			Sleep(500)
			MsgBox(0+64,"提示","已创建IE浏览器桌面快捷方式，若未及时生效请尝试刷新桌面！")
		Case $Button1	
			GUISetState(@SW_HIDE)
			Sleep(500)
			FileInstall("D:\Users\Desktop\AU3脚本开发\恢复ie浏览器\Wait.exe","C:\Windows\Temp\ietemp\")
			Sleep(500)
			Run ("C:\Windows\Temp\ietemp\Wait.exe")
			Sleep(1000)
			$PID=WinGetProcess ("执行进度")
			Sleep(1000)
			FileInstall("D:\Users\Desktop\AU3脚本开发\恢复ie浏览器\ietemp\NSudo.exe","C:\Windows\Temp\ietemp\")
			FileInstall("D:\Users\Desktop\AU3脚本开发\恢复ie浏览器\ietemp\Install.cmd","C:\Windows\Temp\ietemp\")
			FileInstall("D:\Users\Desktop\AU3脚本开发\恢复ie浏览器\ietemp\SysWOW64\ieframe.dll","C:\Windows\Temp\ietemp\SysWOW64\")
			FileInstall("D:\Users\Desktop\AU3脚本开发\恢复ie浏览器\ietemp\System32\ieframe.dll","C:\Windows\Temp\ietemp\System32\")
			Sleep(500)
			Run ("C:\Windows\Temp\ietemp\NSudo.exe -U:T -P:E Install.cmd")
			Sleep(500)
			FileInstall("D:\Users\Desktop\AU3脚本开发\恢复ie浏览器\ietemp\desktop.reg","C:\Windows\Temp\ietemp\")
			Sleep(500)
			
			Local $sRegFilePath = "C:\Windows\Temp\ietemp\desktop.reg"
            Local $sRegEditCmd = 'regedit.exe /s "' & $sRegFilePath & '"'
			Local $iExitCode = Run($sRegEditCmd, "", @SW_HIDE)
			
			Sleep(500)
			ProcessClose ($PID)
			Sleep(500)
			MsgBox(0+64,"提示","已修复Win11内置IE浏览器")
			GUISetState(@SW_SHOW)

	EndSwitch
WEnd
