@chcp 65001
rem "Запускать под Администратором и изменить пути на свои"

del tests\smoke\*.epf && del tools\epf\utils\*.epf
call compileEpf
xcopy /y /o /e "tools\epf\utils\*.*" "C:\Program Files\OneScript\lib\add\tools\epf\utils\*.*" && xcopy /y /o /e "xddTestRunner.epf" "C:\Program Files\OneScript\lib\add\"  && xcopy /y /o /e "plugins\*.*" "C:\Program Files\OneScript\lib\add\plugins\*.*"