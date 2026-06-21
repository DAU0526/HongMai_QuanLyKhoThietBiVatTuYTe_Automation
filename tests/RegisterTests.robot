*** Settings ***
Documentation     Test Suite: Đăng ký tài khoản (Register)
...               Kiểm tra đăng ký hợp lệ, validation lỗi, chọn vai trò, chọn khoa
Library           SeleniumLibrary
Resource          ../resources/page_objects/RegisterPage.resource
Resource          ../resources/common_keywords.resource
Variables         ../resources/environment_variables.yml

Suite Setup       Mở Trình Duyệt
Suite Teardown    Đóng Trình Duyệt
Test Teardown     Chụp Ảnh Khi Lỗi

*** Test Cases ***

TC-REG-01 Đăng ký thành công với vai trò Trưởng Khoa
    [Documentation]    Điền đủ thông tin hợp lệ, chọn Trưởng Khoa → màn hình thành công
    [Tags]    register    smoke    happy-path
    Register Thành Công
    ...    Robot TruongKhoa
    ...    robot.tk01@test.vn
    ...    0901234501
    ...    Test@123456
    ...    Test@123456
    ...    ${OPT_TRUONG_KHOA}
    Kiểm Tra Màn Hình Thành Công

TC-REG-02 Đăng ký thành công với vai trò NV Kho
    [Documentation]    Điền đủ thông tin hợp lệ, chọn NV Kho → màn hình thành công
    [Tags]    register    smoke    happy-path
    Register Thành Công
    ...    Robot NVKho
    ...    robot.nvk01@test.vn
    ...    0901234502
    ...    Test@123456
    ...    Test@123456
    ...    ${OPT_NV_KHO}
    Kiểm Tra Màn Hình Thành Công

TC-REG-03 Đăng ký thành công với vai trò QL Kho
    [Documentation]    Điền đủ thông tin hợp lệ, chọn QL Kho → màn hình thành công
    [Tags]    register    smoke    happy-path
    Register Thành Công
    ...    Robot QLKho
    ...    robot.qlk01@test.vn
    ...    0901234503
    ...    Test@123456
    ...    Test@123456
    ...    ${OPT_QL_KHO}
    Kiểm Tra Màn Hình Thành Công

TC-REG-04 Đăng ký thất bại khi mật khẩu không khớp xác nhận
    [Documentation]    Nhập mật khẩu ≠ xác nhận → hiện thông báo "không khớp"
    [Tags]    register    negative
    Register Thất Bại
    ...    Robot MisMatch
    ...    robot.mm01@test.vn
    ...    0901234504
    ...    Test@123456
    ...    SaiXacNhan999
    ${msg}=    Lấy Thông Báo Lỗi
    Should Contain    ${msg}    không khớp

TC-REG-05 Đăng ký thất bại khi email đã tồn tại trong hệ thống
    [Documentation]    Nhập email đã có → server trả lỗi, hiện thông báo lỗi
    [Tags]    register    negative
    Register Thất Bại
    ...    Admin Trùng
    ...    ${ADMIN_EMAIL}
    ...    0901234505
    ...    Test@123456
    ...    Test@123456
    ${msg}=    Lấy Thông Báo Lỗi
    Should Not Be Empty    ${msg}

TC-REG-06 Đăng ký thất bại khi để trống họ tên
    [Documentation]    Bỏ trống Họ tên → HTML5 validation chặn submit
    [Tags]    register    negative    validation
    Mở Trang Register
    Nhập Email              robot.empty01@test.vn
    Nhập Mật Khẩu           Test@123456
    Nhập Xác Nhận Mật Khẩu  Test@123456
    Nhấn Đăng Ký
    Location Should Contain    /register

TC-REG-07 Đăng ký thất bại khi để trống email
    [Documentation]    Bỏ trống Email → HTML5 validation chặn submit
    [Tags]    register    negative    validation
    Mở Trang Register
    Nhập Họ Tên             Robot EmptyEmail
    Nhập Mật Khẩu           Test@123456
    Nhập Xác Nhận Mật Khẩu  Test@123456
    Nhấn Đăng Ký
    Location Should Contain    /register

TC-REG-08 Chọn Trưởng Khoa thì hiện dropdown Khoa phụ trách
    [Documentation]    Khi chọn vai trò Trưởng Khoa → dropdown Khoa xuất hiện
    [Tags]    register    ui
    Mở Trang Register
    Chọn Vai Trò    ${OPT_TRUONG_KHOA}
    Kiểm Tra Dropdown Khoa Hiển Thị

TC-REG-09 Chọn NV Kho thì ẩn dropdown Khoa phụ trách
    [Documentation]    Khi chọn vai trò NV Kho → dropdown Khoa ẩn đi
    [Tags]    register    ui
    Mở Trang Register
    Chọn Vai Trò    ${OPT_NV_KHO}
    Kiểm Tra Dropdown Khoa Ẩn

TC-REG-10 Toggle hiện mật khẩu hoạt động đúng
    [Documentation]    Nhấn icon mắt → type input đổi password → text
    [Tags]    register    ui
    Mở Trang Register
    Nhập Mật Khẩu    Test@123456
    ${before}=    Get Element Attribute    id:password    type
    Should Be Equal    ${before}    password
    Click Element    ${BTN_TOGGLE_PW}
    ${after}=    Get Element Attribute    id:password    type
    Should Be Equal    ${after}    text

TC-REG-11 Link "Đăng nhập ngay" dẫn về trang login
    [Documentation]    Nhấn link → chuyển đến /login
    [Tags]    register    navigation
    Mở Trang Register
    Click Element    ${BTN_GO_LOGIN}
    Sleep    1s
    Location Should Contain    /login

TC-REG-12 Sau đăng ký thành công nhấn "Quay lại Đăng nhập" về trang login
    [Documentation]    Màn hình thành công → nhấn Quay lại → về /login
    [Tags]    register    smoke    navigation
    Register Thành Công
    ...    Robot BackTest
    ...    robot.back01@test.vn
    ...    0901234512
    ...    Test@123456
    ...    Test@123456
    ...    ${OPT_QL_KHOA}
    Kiểm Tra Màn Hình Thành Công
    Click Element    ${BTN_BACK_LOGIN}
    Sleep    1s
    Location Should Contain    /login
