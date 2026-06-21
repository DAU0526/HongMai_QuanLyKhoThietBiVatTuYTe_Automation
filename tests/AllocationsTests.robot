*** Settings ***
Documentation     Test Suite: Cấp phát thiết bị (Allocations)
...               Kiểm tra xem lịch sử, gửi yêu cầu, xử lý cấp phát, phân quyền tab
Library           SeleniumLibrary
Resource          ../resources/page_objects/AllocationsPage.resource
Resource          ../resources/common_keywords.resource
Variables         ../resources/environment_variables.yml

Suite Setup       Khởi Tạo Suite
Suite Teardown    Đóng Trình Duyệt
Test Teardown     Chụp Ảnh Khi Lỗi

*** Keywords ***
Khởi Tạo Suite
    Mở Trình Duyệt
    Đăng Nhập Admin

*** Test Cases ***

TC-ALLOC-01 Trang cấp phát tải thành công
    [Documentation]    Mở trang /requests → trang hiển thị không lỗi
    [Tags]    allocations    smoke
    Mở Trang Allocations

TC-ALLOC-02 Admin thấy tab Lịch sử cấp phát
    [Documentation]    Admin có tab "Lịch sử cấp phát" hiển thị
    [Tags]    allocations    role    admin
    Mở Trang Allocations
    Kiểm Tra Tab Lịch Sử Hiển Thị

TC-ALLOC-03 Admin thấy tab Chờ xử lý với số lượng phiếu
    [Documentation]    Tab "Chờ xử lý" hiển thị, đếm số phiếu đang chờ
    [Tags]    allocations    role    admin
    Mở Trang Allocations
    Chuyển Tab Chờ Xử Lý
    ${count}=    Đếm Phiếu Chờ Xử Lý
    Log    Số phiếu đang chờ xử lý: ${count}

TC-ALLOC-04 Admin thấy nút Quét mã phiếu
    [Documentation]    Admin có nút Quét QR để xử lý phiếu
    [Tags]    allocations    role    admin
    Mở Trang Allocations
    Kiểm Tra Nút Quét QR Hiển Thị

TC-ALLOC-05 Trưởng Khoa thấy tab Yêu cầu của tôi thay vì Lịch sử
    [Documentation]    Trưởng Khoa chỉ thấy tab "Yêu cầu của tôi", không thấy tab Lịch sử
    [Tags]    allocations    role    truong_khoa
    Đăng Xuất
    Đăng Nhập Truong Khoa
    Mở Trang Allocations
    Kiểm Tra Tab Yêu Cầu Của Tôi Hiển Thị
    Kiểm Tra Tab Lịch Sử Ẩn

TC-ALLOC-06 Trưởng Khoa thấy nút Gửi yêu cầu cấp phát
    [Documentation]    Trưởng Khoa có nút "Gửi yêu cầu cấp phát"
    [Tags]    allocations    role    truong_khoa
    Kiểm Tra Nút Gửi Yêu Cầu Hiển Thị

TC-ALLOC-07 Trưởng Khoa không thấy nút Quét mã phiếu
    [Documentation]    Nút Quét QR chỉ dành cho NV_KHO, ẩn với Trưởng Khoa
    [Tags]    allocations    role    negative    truong_khoa
    Kiểm Tra Nút Quét QR Ẩn

TC-ALLOC-08 Trưởng Khoa mở form gửi yêu cầu cấp phát
    [Documentation]    Nhấn nút gửi yêu cầu → dialog form xuất hiện, nhấn Hủy đóng lại
    [Tags]    allocations    ui    truong_khoa
    Mở Form Gửi Yêu Cầu Cấp Phát
    Element Should Be Visible    ${DLG_CREATE}
    Đóng Form Yêu Cầu
    Element Should Not Be Visible    ${DLG_CREATE}

TC-ALLOC-09 NV_KHO thấy nút Quét mã phiếu
    [Documentation]    NV_KHO có nút quét QR để xử lý phiếu
    [Tags]    allocations    role    nv_kho
    Đăng Xuất
    Đăng Nhập NV Kho
    Mở Trang Allocations
    Kiểm Tra Nút Quét QR Hiển Thị

# TC-ALLOC-10 NV_KHO xử lý phiếu chờ xuất kho
#     [Documentation]    NV_KHO nhấn "Xử lý xuất kho" → dialog xử lý mở ra
#     [Tags]    allocations    approval    nv_kho
#     Chuyển Tab Chờ Xử Lý
#     ${count}=    Đếm Phiếu Chờ Xử Lý
#     IF    ${count} > 0
#         Xử Lý Phiếu Chờ Đầu Tiên
#         Element Should Be Visible    ${DLG_PROCESS_TITLE}
#     ELSE
#         Log    Không có phiếu chờ xử lý để test    level=WARN
#     END
    Đăng Xuất
    Đăng Nhập Admin
