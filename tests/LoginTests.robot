*** Settings ***
Documentation     Test Suite: Đăng nhập (Login)
...               Kiểm tra đăng nhập hợp lệ, không hợp lệ, toggle mật khẩu và đăng xuất
Library           SeleniumLibrary
Resource          ../resources/page_objects/LoginPage.resource
Resource          ../resources/common_keywords.resource
Variables         ../resources/environment_variables.yml

Suite Setup       Mở Trình Duyệt
Suite Teardown    Đóng Trình Duyệt
Test Teardown     Chụp Ảnh Khi Lỗi

*** Test Cases ***

TC-LOGIN-01 Đăng nhập thành công với tài khoản Admin
    [Documentation]    Nhập email + password hợp lệ (Admin) → vào được dashboard
    [Tags]    login    smoke    happy-path
    Login Thành Công    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    Kiểm Tra Đang Ở Dashboard
    Logout

TC-LOGIN-02 Đăng nhập thành công với tài khoản NV Kho
    [Documentation]    Nhập email + password hợp lệ (NV_KHO) → vào được dashboard
    [Tags]    login    smoke    happy-path
    Login Thành Công    ${NV_KHO_EMAIL}    ${NV_KHO_PASSWORD}
    Kiểm Tra Đang Ở Dashboard
    Logout

TC-LOGIN-03 Đăng nhập thành công với tài khoản QL Kho
    [Documentation]    Nhập email + password hợp lệ (QL_KHO) → vào được dashboard
    [Tags]    login    smoke    happy-path
    Login Thành Công    ${QL_KHO_EMAIL}    ${QL_KHO_PASSWORD}
    Kiểm Tra Đang Ở Dashboard
    Logout

TC-LOGIN-04 Đăng nhập thành công với tài khoản Trưởng Khoa
    [Documentation]    Nhập email + password hợp lệ (TRUONG_KHOA) → vào được dashboard
    [Tags]    login    smoke    happy-path
    Login Thành Công    ${TRUONG_KHOA_EMAIL}    ${TRUONG_KHOA_PASSWORD}
    Kiểm Tra Đang Ở Dashboard
    Logout

TC-LOGIN-05 Đăng nhập thất bại khi sai mật khẩu
    [Documentation]    Nhập đúng email nhưng sai password → hiện thông báo lỗi
    [Tags]    login    negative
    Login Thất Bại    ${ADMIN_EMAIL}    sai_mat_khau_123
    ${msg}=    Lấy Thông Báo Lỗi
    Should Not Be Empty    ${msg}
    Should Contain    ${msg}    không đúng

TC-LOGIN-06 Đăng nhập thất bại khi email không tồn tại
    [Documentation]    Nhập email không có trong hệ thống → hiện thông báo lỗi
    [Tags]    login    negative
    Login Thất Bại    khongcotontai@test.vn    123456
    ${msg}=    Lấy Thông Báo Lỗi
    Should Not Be Empty    ${msg}

TC-LOGIN-07 Đăng nhập thất bại khi để trống mật khẩu
    [Documentation]    Bỏ trống password → HTML5 validation chặn, không submit được
    [Tags]    login    negative    validation
    Mở Trang Login
    Nhập Email    ${ADMIN_EMAIL}
    Nhấn Đăng Nhập
    Location Should Contain    /login

TC-LOGIN-08 Đăng nhập thất bại khi để trống email
    [Documentation]    Bỏ trống email → HTML5 validation chặn, không submit được
    [Tags]    login    negative    validation
    Mở Trang Login
    Nhập Mật Khẩu    ${ADMIN_PASSWORD}
    Nhấn Đăng Nhập
    Location Should Contain    /login

TC-LOGIN-09 Toggle hiện mật khẩu chuyển type từ password sang text
    [Documentation]    Nhấn icon con mắt → type của input đổi từ password → text
    [Tags]    login    ui
    Mở Trang Login
    Nhập Mật Khẩu    ${ADMIN_PASSWORD}
    ${before}=    Get Element Attribute    id:password    type
    Should Be Equal    ${before}    password
    Toggle Hiện Mật Khẩu
    ${after}=    Get Element Attribute    id:password    type
    Should Be Equal    ${after}    text

TC-LOGIN-10 Toggle ẩn mật khẩu chuyển type về password
    [Documentation]    Nhấn icon con mắt lần 2 → type trở về password
    [Tags]    login    ui
    Mở Trang Login
    Nhập Mật Khẩu    ${ADMIN_PASSWORD}
    Toggle Hiện Mật Khẩu
    Toggle Hiện Mật Khẩu
    ${type}=    Get Element Attribute    id:password    type
    Should Be Equal    ${type}    password

TC-LOGIN-11 Đã đăng nhập truy cập /login sẽ redirect về trang chủ
    [Documentation]    Khi đã login, vào lại /login phải redirect về /
    [Tags]    login    redirect
    Login Thành Công    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    Go To    ${LOGIN_URL}
    Sleep    1s
    ${url}=    Get Location
    Should Not Contain    ${url}    /login
    Logout

TC-LOGIN-12 Đăng xuất thành công và quay về trang login
    [Documentation]    Nhấn Đăng xuất → về trang /login
    [Tags]    login    logout    smoke
    Login Thành Công    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    Logout
    Location Should Contain    /login

TC-LOGIN-13 Có link chuyển sang trang đăng ký
    [Documentation]    Nhấn "Đăng ký ngay" → chuyển đến /register
    [Tags]    login    navigation
    Mở Trang Login
    Click Element    ${BTN_REGISTER}
    Sleep    1s
    Location Should Contain    /register
