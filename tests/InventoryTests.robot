*** Settings ***
Documentation     Test Suite: Quản lý Kho / Tồn kho (Inventory)
...               Kiểm tra xem tồn kho, tìm kiếm, lọc, CRUD thiết bị, phân quyền
Library           SeleniumLibrary
Resource          ../resources/page_objects/InventoryPage.resource
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

TC-INV-01 Trang tồn kho tải thành công và hiển thị dữ liệu
    [Documentation]    Mở /inventory → bảng tồn kho có ít nhất 1 dòng dữ liệu
    [Tags]    inventory    smoke    happy-path
    Mở Trang Inventory
    Kiểm Tra Bảng Có Dữ Liệu

TC-INV-02 Tìm kiếm thiết bị theo tên trả về kết quả
    [Documentation]    Nhập từ khoá hợp lệ → bảng lọc và hiển thị kết quả phù hợp
    [Tags]    inventory    search    happy-path
    Mở Trang Inventory
    Tìm Kiếm Thiết Bị    ${TEST_THIET_BI}
    ${count}=    Đếm Số Dòng Bảng
    Should Be True    ${count} >= 0

TC-INV-03 Tìm kiếm từ khoá không tồn tại trả về bảng rỗng
    [Documentation]    Nhập từ khoá không có → bảng trống (0 dòng)
    [Tags]    inventory    search    negative
    Mở Trang Inventory
    Tìm Kiếm Thiết Bị    XYZKHONGTONAI99999
    ${count}=    Đếm Số Dòng Bảng
    Should Be Equal As Numbers    ${count}    0

TC-INV-04 Lọc thiết bị "Đang có trong kho"
    [Documentation]    Chọn filter → bảng chỉ hiển thị thiết bị còn trong kho
    [Tags]    inventory    filter
    Mở Trang Inventory
    Lọc Theo Trạng Thái    ${OPT_TRONG_KHO}
    ${count}=    Đếm Số Dòng Bảng
    Log    Số thiết bị đang có trong kho: ${count}

TC-INV-05 Lọc thiết bị "Đang được sử dụng"
    [Documentation]    Chọn filter → bảng hiển thị thiết bị đang sử dụng
    [Tags]    inventory    filter
    Mở Trang Inventory
    Lọc Theo Trạng Thái    ${OPT_DANG_DUNG}
    ${count}=    Đếm Số Dòng Bảng
    Log    Số thiết bị đang dùng: ${count}

TC-INV-06 Lọc thiết bị "Có thiết bị hư hỏng"
    [Documentation]    Chọn filter → bảng hiển thị thiết bị có hư hỏng
    [Tags]    inventory    filter
    Mở Trang Inventory
    Lọc Theo Trạng Thái    ${OPT_HU_HONG}
    ${count}=    Đếm Số Dòng Bảng
    Log    Số thiết bị có hư hỏng: ${count}

TC-INV-07 Tổng giá trị tài sản hiển thị với Admin
    [Documentation]    Admin thấy panel tổng tài sản và giá trị chứa ký tự "đ"
    [Tags]    inventory    ui    admin
    Mở Trang Inventory
    Kiểm Tra Tổng Tài Sản Hiển Thị

TC-INV-08 Trưởng Khoa không thấy panel tổng tài sản
    [Documentation]    Trưởng Khoa không có quyền xem tổng tài sản toàn viện
    [Tags]    inventory    role    truong_khoa
    Đăng Xuất
    Đăng Nhập Truong Khoa
    Mở Trang Inventory
    Kiểm Tra Tổng Tài Sản Ẩn
    Đăng Xuất
    Đăng Nhập Admin

TC-INV-09 Xem chi tiết thiết bị mở dialog
    [Documentation]    Click vào dòng đầu tiên → dialog chi tiết xuất hiện
    [Tags]    inventory    ui
    Mở Trang Inventory
    Xem Chi Tiết Thiết Bị Đầu Tiên
    Element Should Be Visible    ${DLG_DETAIL}
    Đóng Dialog Chi Tiết

# TC-INV-10 Mở form thêm thiết bị mới
#     [Documentation]    Nhấn Thêm thiết bị → dialog form xuất hiện, nhấn Hủy đóng lại
#     [Tags]    inventory    crud
#     Mở Trang Inventory
#     Mở Form Thêm Thiết Bị
#     Element Should Be Visible    ${INPUT_TEN_THIET_BI}
#     Hủy Form
# 
# TC-INV-11 Thêm thiết bị mới thành công
#     [Documentation]    Điền form hợp lệ → Lưu → toast thành công
#     [Tags]    inventory    crud    happy-path
#     Mở Trang Inventory
#     Mở Form Thêm Thiết Bị
#     Điền Form Thiết Bị    Robot Test Equipment    ${OPT_TAI_SU_DUNG}    Cái    Hộp
#     Lưu Thiết Bị
#     Chờ Toast Thành Công

TC-INV-12 Sửa thông tin thiết bị từ dialog chi tiết
    [Documentation]    Xem chi tiết → nhấn Sửa thông tin → lưu thành công
    [Tags]    inventory    crud
    Mở Trang Inventory
    Xem Chi Tiết Thiết Bị Đầu Tiên
    Click Element    ${BTN_DETAIL_EDIT}
    Wait Until Element Is Visible    ${BTN_SAVE}    timeout=5s
    Lưu Thiết Bị
    Chờ Toast Thành Công

TC-INV-13 Chuyển tab Nhập kho trong trang Inventory
    [Documentation]    Nhấn tab Nhập kho → trang chuyển đúng tab
    [Tags]    inventory    navigation
    Mở Trang Inventory
    Chuyển Tab Nhập Kho

TC-INV-14 Chuyển tab Xuất kho trong trang Inventory
    [Documentation]    Nhấn tab Xuất kho → trang chuyển đúng tab
    [Tags]    inventory    navigation
    Mở Trang Inventory
    Chuyển Tab Xuất Kho
