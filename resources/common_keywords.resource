*** Settings ***
Library     SeleniumLibrary
Variables   environment_variables.yml

*** Keywords ***
# ============================================================
# MỞ / ĐÓNG TRÌNH DUYỆT
# ============================================================

Mở Trình Duyệt
    [Documentation]    Mở Chrome, vào trang chủ, set timeout mặc định
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    2s
    Set Selenium Timeout    10s

Đóng Trình Duyệt
    Close All Browsers

# ============================================================
# ĐĂNG NHẬP THEO VAI TRÒ – dùng chung ở nhiều test suite
# ============================================================

Đăng Nhập Admin
    [Documentation]    Đăng nhập bằng tài khoản Admin
    Go To    ${LOGIN_URL}
    Wait Until Element Is Visible    id:email
    Input Text       id:email       ${ADMIN_EMAIL}
    Input Password   id:password    ${ADMIN_PASSWORD}
    Click Button    xpath://button[@type='submit']
    Wait Until Element Is Visible
    ...    xpath://button[.//span[text()='Tổng quan']]    timeout=10s

Đăng Nhập NV Kho
    [Documentation]    Đăng nhập bằng tài khoản Nhân viên Kho
    Go To    ${LOGIN_URL}
    Wait Until Element Is Visible    id:email
    Input Text       id:email       ${NV_KHO_EMAIL}
    Input Password   id:password    ${NV_KHO_PASSWORD}
    Click Button    xpath://button[@type='submit']
    Wait Until Element Is Visible
    ...    xpath://button[.//span[text()='Tổng quan']]    timeout=10s

Đăng Nhập QL Kho
    [Documentation]    Đăng nhập bằng tài khoản Quản lý Kho
    Go To    ${LOGIN_URL}
    Wait Until Element Is Visible    id:email
    Input Text       id:email       ${QL_KHO_EMAIL}
    Input Password   id:password    ${QL_KHO_PASSWORD}
    Click Button    xpath://button[@type='submit']
    Wait Until Element Is Visible
    ...    xpath://button[.//span[text()='Tổng quan']]    timeout=10s

Đăng Nhập Truong Khoa
    [Documentation]    Đăng nhập bằng tài khoản Trưởng Khoa
    Go To    ${LOGIN_URL}
    Wait Until Element Is Visible    id:email
    Input Text       id:email       ${TRUONG_KHOA_EMAIL}
    Input Password   id:password    ${TRUONG_KHOA_PASSWORD}
    Click Button    xpath://button[@type='submit']
    Wait Until Element Is Visible
    ...    xpath://button[.//span[text()='Tổng quan']]    timeout=10s

Đăng Xuất
    [Documentation]    Nhấn nút Đăng xuất, chờ về trang login
    Click Element    xpath://button[.//span[text()='Đăng xuất']]
    Wait Until Element Is Visible    id:email    timeout=10s

# ============================================================
# ĐIỀU HƯỚNG SIDEBAR
# ============================================================

Vào Trang Qua Sidebar
    [Arguments]    ${ten_menu}
    Click Element    xpath://button[.//span[text()='${ten_menu}']]
    Sleep    1s

# ============================================================
# HELPERS
# ============================================================

Chờ Toast Thành Công
    Wait Until Element Is Visible
    ...    xpath://div[@role='status' or contains(@class,'toast')][contains(.,'Thành công')]
    ...    timeout=10s

Chờ Toast Lỗi
    Wait Until Element Is Visible
    ...    xpath://div[@role='status' or contains(@class,'toast')][contains(.,'Lỗi')]
    ...    timeout=5s

Chụp Ảnh Khi Lỗi
    Capture Page Screenshot

Cuộn Xuống Cuối
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)

Element Hiển Thị
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s

Element Ẩn
    [Arguments]    ${locator}
    Wait Until Element Is Not Visible    ${locator}    timeout=10s
