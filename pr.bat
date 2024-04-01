@echo off

:: 提取.env文件中的GITHUB_USERNAME变量值
for /f "tokens=*" %%a in ('type .env ^| findstr GITHUB_USERNAME') do set %%a

:: 检查GITHUB_USERNAME环境变量是否被设置
if "%GITHUB_USERNAME%"=="" (
    echo GITHUB_USERNAME is not set. Please check the .env file.
    goto end
)

:: 设置仓库名称
set REPO=%GITHUB_USERNAME%/CTFNotes

push.bat

:: 创建PR到StingerTeam的%GITHUB_USERNAME%分支
gh pr create --base %GITHUB_USERNAME% --repo StingerTeam/CTFNotes --title "Update %GITHUB_USERNAME% branch" --body "This PR updates the %GITHUB_USERNAME% branch."

:end
