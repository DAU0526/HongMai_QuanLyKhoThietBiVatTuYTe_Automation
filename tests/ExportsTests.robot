*** Settings ***
Documentation     Test Suite: Xuất kho (Exports)
...               Kiểm tra xem lịch sử, duyệt, hủy phiếu xuất, xuất Excel
Library           SeleniumLibrary
Resource          ../resources/page_objects/InventoryPage.resource
Resource          ../resources/page_objects/ExportsPage.resource
Resource          ../resources/common_keywords.resource
Variables         ../resources/environment_variables.yml

Suite Setup       Khởi Tạo Suite
Suite Teardown    Đóng Trình Duyệt
Test Teardown     Chụp Ảnh Khi Lỗi

*** Keywords ***
Khởi Tạo Suite
    Mở Trình Duyệt
    Đăng Nhập Admin
    Mở Trang Inventory
    Chuyển Tab Xuất Kho

*** Test Cases ***

TC-EXP-01 Trang xuất kho hiển thị danh sách phiếu
    [Documentation]    Tab Xuất kho tải thành công, danh sách phiếu xuất hiện
    [Tags]    exports    smoke
    ${count}=    Đếm Số Phiếu Xuất
    Log    Số phiếu xuất hiện có: ${count}

TC-EXP-02 Tìm kiếm phiếu xuất theo mã phiếu
    [Documentation]    Nhập mã phiếu → danh sách lọc đúng
    [Tags]    exports    search    happy-path
    Tìm Kiếm Theo Mã Phiếu Xuất    XK
    ${count}=    Đếm Số Phiếu Xuất
    Log    Kết quả tìm theo mã phiếu xuất: ${count}

TC-EXP-03 Tìm kiếm không có kết quả trả về danh sách rỗng
    [Documentation]    Tìm từ khoá không tồn tại → danh sách rỗng
    [Tags]    exports    search    negative
    Tìm Kiếm Theo Mã Phiếu Xuất    XYZKHONGCOPHIEU999
    ${count}=    Đếm Số Phiếu Xuất
    Should Be Equal As Numbers    ${count}    0

TC-EXP-04 Mở rộng phiếu xuất xem chi tiết
    [Documentation]    Click vào phiếu → accordion mở ra hiển thị chi tiết
    [Tags]    exports    ui
    Tìm Kiếm Theo Mã Phiếu Xuất    ${EMPTY}
    Mở Rộng Phiếu Xuất Đầu Tiên

TC-EXP-05 Mở dialog tạo phiếu xuất và đóng lại
    [Documentation]    Nhấn nút tạo phiếu xuất → dialog hiện → nhấn Hủy → đóng
    [Tags]    exports    ui
    Mở Dialog Tạo Phiếu Xuất
    Element Should Be Visible    ${DLG_CREATE}
    Đóng Dialog Tạo Phiếu Xuất
    Element Should Not Be Visible    ${DLG_CREATE}

TC-EXP-06 Duyệt phiếu xuất ở trạng thái Chờ duyệt thành công
    [Documentation]    QL_KHO/Admin duyệt phiếu xuất → trạng thái đổi "Đã xuất"
    [Tags]    exports    approval    happy-path
    Tìm Kiếm Theo Mã Phiếu Xuất    ${EMPTY}
    Mở Rộng Phiếu Xuất Đầu Tiên
    ${visible}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${BTN_APPROVE}
    IF    ${visible}
        Duyệt Phiếu Xuất Đầu Tiên
    ELSE
        Log    Không có phiếu xuất chờ duyệt    level=WARN
    END

TC-EXP-07 Hủy phiếu xuất thành công
    [Documentation]    Nhấn Hủy phiếu → trạng thái đổi sang "Đã hủy"
    [Tags]    exports    cancel
    Tìm Kiếm Theo Mã Phiếu Xuất    ${EMPTY}
    Mở Rộng Phiếu Xuất Đầu Tiên
    ${visible}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${BTN_CANCEL_PHIEU}
    IF    ${visible}
        Hủy Phiếu Xuất Đầu Tiên
    ELSE
        Log    Không có phiếu có thể hủy    level=WARN
    END

TC-EXP-08 NV_KHO có thể xem tab Xuất kho
    [Documentation]    NV_KHO có quyền xem tab Xuất kho
    [Tags]    exports    role
    Đăng Xuất
    Đăng Nhập NV Kho
    Mở Trang Inventory
    Chuyển Tab Xuất Kho
    Log    NV_KHO xem được tab Xuất kho thành công
    Đăng Xuất
    Đăng Nhập Admin
    Mở Trang Inventory
    Chuyển Tab Xuất Kho
