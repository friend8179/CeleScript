
REGX HKCU\Software\CeleScript\#EnableSTK
EVAL 7=[%x]开启 STK 服务

REGX HKCU\Software\CeleScript\#InstallNewHW
EVAL 8={1}安装汉王老三样,<%x>安装新版汉王输入法

REGX HKCU\Software\CeleScript\#InstallA4
EVAL 9={1}安装梅花输入法,<%x>安装中天 A4 输入法

REGX HKCU\Software\CeleScript\StrTest
DLGX $请选择要执行的操作,%8,$,%9,$,%7,$,$设置字符串:,%0
EVAL 1=%X
IFEX %1==-1,GOTO _End
REGX HKCU\Software\CeleScript\StrTest=%0

EVAL 0=
IFEX %1&0x100,EVAL 0=1
REGX HKCU\Software\CeleScript\#EnableSTK=%0


IFEX %1&0x100,MSGX 你选择了 开启 STK 服务%N您设置的字符串是：%0
IFEX %1&0x20,CALL 安装梅花
IFEX %1&0x40,CALL _A4

PROC _A4
	MSGX 你选择了要安装 A4
ENDP _A4

PROC 安装梅花
	MSGX 这里安装梅化输入法%N%N注意，这里修改了 %%x 的值，返回后 %%x 将被改变。
	BEEP
ENDP 安装梅花

PROC _End
