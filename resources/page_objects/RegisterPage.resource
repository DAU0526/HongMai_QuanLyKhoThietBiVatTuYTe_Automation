*** Settings ***
Library     SeleniumLibrary
Resource    ../common_keywords.resource
Variables   ../locators/RegisterPageLocators.py

*** Keywords ***
Mở Trang Register
    Go To    ${REGISTER_URL}
    Wait Until Element Is Visible    ${INPUT_HO_TEN}

Nhập Họ Tên
    [Arguments]    ${hoTen}
    Input Text    ${INPUT_HO_TEN}    ${hoTen}

Nhập Email
    [Arguments]    ${email}
    Input Text    ${INPUT_EMAIL}    ${email}

Nhập Số Điện Thoại
    [Arguments]    ${phone}
    Input Text    ${INPUT_PHONE}    ${phone}

Nhập Mật Khẩu
    [Arguments]    ${password}
    Input Password    ${INPUT_PASSWORD}    ${password}

Nhập Xác Nhận Mật Khẩu
    [Arguments]    ${confirmPw}
    Input Password    ${INPUT_CONFIRM_PW}    ${confirmPw}

Chọn Vai Trò
    [Arguments]    ${vaiTroOption}
    [Documentation]    Mở dropdown vai trò và chọn option tương ứng
    Click Element    ${DDL_VAI_TRO}
    Wait Until Element Is Visible    ${vaiTroOption}    timeout=5s
    Click Element    ${vaiTroOption}

Chọn Khoa
    [Arguments]    ${tenKhoa}
    Click Element    ${DDL_KHOA}
    ${opt}=    Set Variable    xpath://div[@role='option'][normalize-space()='${tenKhoa}']
    Wait Until Element Is Visible    ${opt}    timeout=5s
    Click Element    ${opt}

Nhấn Đăng Ký
    Click Button    ${BTN_SUBMIT}

Lấy Thông Báo Lỗi
    Wait Until Element Is Visible    ${MSG_ERROR}    timeout=5s
    ${text}=    Get Text    ${MSG_ERROR}
    RETURN    ${text}

Lấy Thông Báo Thành Công
    Wait Until Element Is Visible    ${MSG_SUCCESS}    timeout=10s
    ${text}=    Get Text    ${MSG_SUCCESS}
    RETURN    ${text}

Register Thành Công
    [Arguments]    ${hoTen}    ${email}    ${phone}    ${password}    ${confirmPw}    ${vaiTroOption}
    [Documentation]    Điền đủ thông tin hợp lệ → nhấn Đăng ký → hiện màn hình thành công
    Mở Trang Register
    Nhập Họ Tên             ${hoTen}
    Nhập Email              ${email}
    Nhập Số Điện Thoại      ${phone}
    Chọn Vai Trò            ${vaiTroOption}
    Nhập Mật Khẩu           ${password}
    Nhập Xác Nhận Mật Khẩu  ${confirmPw}
    Nhấn Đăng Ký
    Wait Until Element Is Visible    ${ICO_SUCCESS}    timeout=10s

Register Thất Bại
    [Arguments]    ${hoTen}    ${email}    ${phone}    ${password}    ${confirmPw}
    [Documentation]    Điền thông tin sai → nhấn Đăng ký → hiện thông báo lỗi
    Mở Trang Register
    Nhập Họ Tên             ${hoTen}
    Nhập Email              ${email}
    Nhập Số Điện Thoại      ${phone}
    Nhập Mật Khẩu           ${password}
    Nhập Xác Nhận Mật Khẩu  ${confirmPw}
    Nhấn Đăng Ký
    Wait Until Element Is Visible    ${MSG_ERROR}    timeout=5s

Kiểm Tra Màn Hình Thành Công
    Element Should Be Visible    ${ICO_SUCCESS}
    Element Should Be Visible    ${BTN_BACK_LOGIN}

Quay Lại Login
    Click Element    ${BTN_BACK_LOGIN}
    Wait Until Element Is Visible    ${REGISTER_URL}

Kiểm Tra Dropdown Khoa Hiển Thị
    Element Should Be Visible    ${DDL_KHOA}

Kiểm Tra Dropdown Khoa Ẩn
    Element Should Not Be Visible    ${DDL_KHOA}
