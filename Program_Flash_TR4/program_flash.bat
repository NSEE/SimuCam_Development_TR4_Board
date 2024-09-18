@echo off
echo FPGA Configure...


set project_sof=tr4_default_flash_loader.sof
set project_sh=program_flash.sh

REM ########################################################################
REM # Download sof file
REM ########################################################################
@ set QUARTUS_BIN=%QUARTUS_ROOTDIR%\bin
@ if not exist "%QUARTUS_BIN%" set QUARTUS_BIN=%QUARTUS_ROOTDIR%\bin64

if not exist "%QUARTUS_BIN%\\quartus.exe" (
	echo Your default Quartus specified by system variable QUARTUS_ROOT must be Quartus Standard. Edition for programming Stratix IV FPGA device.
	goto :Exit
)

rem %QUARTUS_BIN%\\quartus_pgm.exe -m jtag -c 1 -o "p;%project_sof%"

REM ########################################################################
REM # Download elf file
REM ########################################################################
if not exist "%QUARTUS_BIN%\\cygwin\bin\bash.exe" goto :WLS_Mode

:::::::::::::::::::::::
:: none WSL Mode. quartus 19.1 or  earlier
@ set SHELLOPTS=igncr
@ set CYGWIN=nodosfilewarning
@ set SOPC_BUILDER_PATH=%SOPC_KIT_NIOS2%+%SOPC_BUILDER_PATH%
"%QUARTUS_BIN%\\cygwin\bin\bash.exe" --rcfile ".\%project_sh%"
goto Exit

:::::::::::::::::::::::
:: WSL Mode
:WLS_Mode

@ set WSLENV=SOPC_KIT_NIOS2/up:project_sh/u
@ wsl ./%project_sh%



:Exit

pause