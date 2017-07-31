@echo off
mode con lines=31 cols=25
set /p model=please input model:
if %model% == t (HP5.py Test) else (HP5.py)
pause
