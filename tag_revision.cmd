@echo off
echo.
echo create tag %2
echo revision   %1
echo.

:ask
set /P answer=create new tag %2 for revision %1 ? [y/n] 
if /I "%answer%" EQU "y" goto :yes
if /I "%answer%" EQU "n" goto :no
goto :ask


:yes

echo creating new tag %2 for revision %1 ...
git pull
git tag %2 %1
git push origin --tags

pause
goto done

:no
echo You typed n: do not create tag %2 for revision %1
goto done

:done
echo done!