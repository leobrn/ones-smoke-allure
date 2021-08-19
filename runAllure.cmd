@chcp 65001

rem "Если нужна история"
robocopy .\allure\report\history\ .\allure\history

call allure generate allure/syntax-check allure/smoke  -c -o .\allure\report && allure open .\allure\report

rem call docker-compose up && docker-compose rm -fs

rem "Для PowerShell: allure generate --clean .\out\allure -o .\out\allure\allure-report; allure open .\out\allure\allure-report"