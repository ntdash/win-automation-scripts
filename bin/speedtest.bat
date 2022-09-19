@echo off

setlocal

set cmd_name="speedtest"
set exe_pathname="C:\Program Files\Ookla\Speedtest\%cmd_name%.exe"

if not exist %exe_pathname% ( goto :not_found )

%exe_pathname%	%*

goto :end

:not_found

echo %cmd_name% is not recognized as an internal or external command, operable program or batch file.

:end

endlocal
