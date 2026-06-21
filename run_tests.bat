@echo off
setlocal enabledelayedexpansion
title MedEquip Robot Framework Test Suite Runner

:: Di chuyen den thu muc chua file bat nay
cd /d "%~dp0"

:MENU
cls
echo ============================================================
echo          HE THONG KIEM THU TU DONG - MEDEQUIP POM
echo ============================================================
echo.
echo  [1] Chay TOAN BO test cases (Tat ca cac trang - 79 TCs)
echo  [2] Chay rieng trang Dang Nhap (Login - 13 TCs)
echo  [3] Chay rieng trang Dang Ky (Register - 12 TCs)
echo  [4] Chay rieng trang Ton Kho (Inventory - 12 TCs)
echo  [5] Chay rieng trang Nhap Kho (Imports - 10 TCs)
echo  [6] Chay rieng trang Xuat Kho (Exports - 8 TCs)
echo  [7] Chay rieng trang Cap Phat (Allocations - 9 TCs)
echo  [8] Chay rieng trang Yeu Cau (Requests - 6 TCs)
echo  [9] Chay rieng trang Tra Thiet Bi (Returns - 9 TCs)
echo  [10] Chay cac kich ban quan trong (Smoke Tests)
echo  [11] Cai dat/Cap nhat thu vien (requirements.txt)
echo  [12] Thoat chuong trinh
echo.
echo ============================================================
set /p choice="Nhap lua chon cua ban (1-12): "

if "%choice%"=="1" goto RUN_ALL
if "%choice%"=="2" goto RUN_LOGIN
if "%choice%"=="3" goto RUN_REGISTER
if "%choice%"=="4" goto RUN_INVENTORY
if "%choice%"=="5" goto RUN_IMPORTS
if "%choice%"=="6" goto RUN_EXPORTS
if "%choice%"=="7" goto RUN_ALLOCATIONS
if "%choice%"=="8" goto RUN_REQUESTS
if "%choice%"=="9" goto RUN_RETURNS
if "%choice%"=="10" goto RUN_SMOKE
if "%choice%"=="11" goto INSTALL_REQ
if "%choice%"=="12" goto EXIT
goto MENU

:RUN_ALL
echo.
echo [*] Dang chay toan bo cac test suite...
robot --outputdir results tests/
goto VIEW_REPORT

:RUN_LOGIN
echo.
echo [*] Dang chay Login Tests...
robot --outputdir results tests/LoginTests.robot
goto VIEW_REPORT

:RUN_REGISTER
echo.
echo [*] Dang chay Register Tests...
robot --outputdir results tests/RegisterTests.robot
goto VIEW_REPORT

:RUN_INVENTORY
echo.
echo [*] Dang chay Inventory Tests...
robot --outputdir results tests/InventoryTests.robot
goto VIEW_REPORT

:RUN_IMPORTS
echo.
echo [*] Dang chay Imports Tests...
robot --outputdir results tests/ImportsTests.robot
goto VIEW_REPORT

:RUN_EXPORTS
echo.
echo [*] Dang chay Exports Tests...
robot --outputdir results tests/ExportsTests.robot
goto VIEW_REPORT

:RUN_ALLOCATIONS
echo.
echo [*] Dang chay Allocations Tests...
robot --outputdir results tests/AllocationsTests.robot
goto VIEW_REPORT

:RUN_REQUESTS
echo.
echo [*] Dang chay Requests Tests...
robot --outputdir results tests/RequestsTests.robot
goto VIEW_REPORT

:RUN_RETURNS
echo.
echo [*] Dang chay Returns Tests...
robot --outputdir results tests/ReturnsTests.robot
goto VIEW_REPORT

:RUN_SMOKE
echo.
echo [*] Dang chay cac kich ban Smoke Tests...
robot --outputdir results --include smoke tests/
goto VIEW_REPORT

:INSTALL_REQ
echo.
echo [*] Dang cai dat/cap nhat cac thu vien...
pip install -r requirements.txt
echo.
echo [!] Hoan thanh cai dat thu vien.
pause
goto MENU

:VIEW_REPORT
echo.
echo [!] Test hoan thanh!
echo [*] Dang tu dong mo bao cao kiem thu (report.html) tren trinh duyet...
if exist "results\report.html" (
    start results\report.html
) else (
    echo [Loi] Khong tim thay file report.html tai thu muc results.
)
pause
goto MENU

:EXIT
echo.
echo Cam on ban da su dung chuong trinh!
timeout /t 2 >nul
exit
