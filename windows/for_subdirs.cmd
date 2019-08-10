@echo off
REM for_subdirs traverses subdirectories and executes a command
REM usage:
REM    for_subdirs "do something"
REM 
REM example: for_subdirs "git pull origin"
REM 
REM get number of arguments
set argC=0
for %%x in (%*) do Set /A argC+=1
IF %argC%==0 (
   echo Error: no arguments supplied
   echo     Usage: for_subdirs "do something"
   goto :error_stop
)

REM the syntax with ~ removes quotes around the parameters
set COMMAND=%~1

:run_it
for /D %%d in (*) do (
   pushd %%d
   echo %%d
   %COMMAND%
   popd
)

:error_stop
