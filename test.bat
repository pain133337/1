@echo off
setlocal

:: --- Настройки ---
:: Токен вашего бота (получить у @BotFather)
set "BOT_TOKEN=7928429949:AAEZBAx3YapP_ut8NmBFltzgI5DREqhfv6k"

:: ID чата (куда отправить сообщение)
set "CHAT_ID=6438561343"

:: Текст сообщения
set "MESSAGE=test"

:: --- Отправка через curl (если установлен) ---
where curl >nul 2>&1
if %errorlevel% equ 0 (
    curl -s -X POST "https://api.telegram.org/bot%BOT_TOKEN%/sendMessage" ^
    -d "chat_id=%CHAT_ID%" ^
    -d "text=%MESSAGE%"
    goto :end
)

:: --- Отправка через PowerShell (если curl не найден) ---
powershell -command "$token='%BOT_TOKEN%'; $chatId='%CHAT_ID%'; $text='%MESSAGE%'; $url=\"https://api.telegram.org/bot$token/sendMessage?chat_id=$chatId&text=$text\"; Invoke-RestMethod -Uri $url -Method Get"

:end
echo Сообщение отправлено!
pause