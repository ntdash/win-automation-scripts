@echo off
setlocal

set cmd_name="vbox"
set exe_pathname="%scripts_path%\bootstrap\.default"

if not exist %exe_pathname% ( goto :not_found )

set argv="%cmd_name%" %*

bash -l %exe_pathname% %argv%

goto :end

:not_found
echo %cmd_name% is not recognized as an internal or external command, operable program or batch file. && goto :end

:bootstrap_error
echo "bash plugin main file `.bootstrap` is missing." && goto :end

:end
endlocal
