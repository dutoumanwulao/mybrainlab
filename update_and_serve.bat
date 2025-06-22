@echo off
rem —— 自动切到当前脚本所在的目录
cd /d %~dp0

rem —— 从远程拉取 main 分支最新代码
git pull origin main

rem —— 启动 MkDocs 本地预览
mkdocs serve

rem —— 如果 mkdocs serve 停掉了，按任意键窗口才会关闭
pause
