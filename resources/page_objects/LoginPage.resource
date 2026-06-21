*** Settings ***
Library     SeleniumLibrary
Resource    ../common_keywords.resource
Variables   ../locators/LoginPageLocators.py

*** Keywords ***
Mở Trang Login
    Go To    ${LOGIN_URL}
    Wait Until Element Is Visible    ${INPUT_EMAIL}

Nhập Email
    [Arguments]    ${email}
    Input Text    ${INPUT_EMAIL}    ${email}

Nhập Mật Khẩu
    [Arguments]    ${password}
    Input Password    ${INPUT_PASSWORD}    ${password}

Nhấn Đăng Nhập
    Click Button    ${BTN_SUBMIT}

Toggle Hiện Mật Khẩu
    Click Element    ${BTN_TOGGLE_PW}

Lấy Thông Báo Lỗi
    Wait Until Element Is Visible    ${MSG_ERROR}    timeout=5s
    ${text}=    Get Text    ${MSG_ERROR}
    RETURN    ${text}

Login Thành Công
    [Arguments]    ${email}    ${password}
    [Documentation]    Điền email + password hợp lệ → nhấn submit → vào được dashboard
    Mở Trang Login
    Nhập Email       ${email}
    Nhập Mật Khẩu    ${password}
    Nhấn Đăng Nhập
    Wait Until Element Is Visible    ${LBL_DASHBOARD}    timeout=10s

Login Thất Bại
    [Arguments]    ${email}    ${password}
    [Documentation]    Điền thông tin sai → nhấn submit → hiện thông báo lỗi
    Mở Trang Login
    Nhập Email       ${email}
    Nhập Mật Khẩu    ${password}
    Nhấn Đăng Nhập
    Wait Until Element Is Visible    ${MSG_ERROR}    timeout=5s

Kiểm Tra Đang Ở Dashboard
    Element Should Be Visible    ${LBL_DASHBOARD}

Logout
    Click Element    ${BTN_LOGOUT}
    Wait Until Element Is Visible    ${INPUT_EMAIL}    timeout=10s

Đến Trang Đăng Ký
    Click Element    ${BTN_REGISTER}
    Wait Until Element Contains    ${REGISTER_URL}    register
