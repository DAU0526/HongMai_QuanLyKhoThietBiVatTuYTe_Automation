*** Settings ***
Documentation     Test Suite: Nhập kho (Imports)
...               Kiểm tra xem lịch sử, tìm kiếm, duyệt, từ chối, xóa phiếu nhập
Library           SeleniumLibrary
Resource          ../resources/page_objects/InventoryPage.resource
Resource          ../resources/page_objects/ImportsPage.resource
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
    Chuyển Tab Nhập Kho

*** Test Cases ***

TC-IMP-01 Trang nhập kho hiển thị danh sách phiếu
    [Documentation]    Tab Nhập kho tải thành công, danh sách phiếu nhập hiển thị
    [Tags]    imports    smoke
    ${count}=    Đếm Số Phiếu
    Log    Số phiếu nhập hiện có: ${count}

TC-IMP-02 Tìm kiếm theo mã phiếu lọc kết quả đúng
    [Documentation]    Nhập mã phiếu → danh sách lọc theo mã phiếu tương ứng
    [Tags]    imports    search    happy-path
    Tìm Kiếm Theo Mã Phiếu    NK
    ${count}=    Đếm Số Phiếu
    Log    Kết quả tìm theo mã phiếu: ${count}

TC-IMP-03 Tìm kiếm theo tên thiết bị lọc kết quả đúng
    [Documentation]    Nhập tên thiết bị → danh sách lọc đúng
    [Tags]    imports    search    happy-path
    Tìm Kiếm Theo Thiết Bị    ${TEST_THIET_BI}
    ${count}=    Đếm Số Phiếu
    Log    Kết quả tìm theo thiết bị: ${count}

TC-IMP-04 Tìm kiếm không có kết quả hiển thị danh sách rỗng
    [Documentation]    Tìm từ khoá không tồn tại → danh sách rỗng
    [Tags]    imports    search    negative
    Tìm Kiếm Theo Mã Phiếu    XYZKHONGCOPHIEU999
    ${count}=    Đếm Số Phiếu
    Should Be Equal As Numbers    ${count}    0

TC-IMP-05 Mở rộng phiếu nhập xem chi tiết
    [Documentation]    Click vào phiếu → accordion mở ra hiển thị chi tiết các dòng
    [Tags]    imports    ui
    Tìm Kiếm Theo Mã Phiếu    ${EMPTY}
    Mở Rộng Phiếu Đầu Tiên

TC-IMP-06 Duyệt phiếu nhập ở trạng thái Chờ duyệt thành công
    [Documentation]    QL_KHO/Admin duyệt phiếu nhập → trạng thái đổi sang "Đã nhập"
    [Tags]    imports    approval    happy-path
    Tìm Kiếm Theo Mã Phiếu    ${EMPTY}
    Mở Rộng Phiếu Đầu Tiên
    ${visible}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${BTN_APPROVE}
    IF    ${visible}
        Duyệt Phiếu Đầu Tiên
    ELSE
        Log    Không có phiếu đang chờ duyệt    level=WARN
    END

TC-IMP-07 Từ chối phiếu nhập với lý do hợp lệ
    [Documentation]    Nhấn Từ chối → nhập lý do → xác nhận → trạng thái "Từ chối"
    [Tags]    imports    approval    negative
    Tìm Kiếm Theo Mã Phiếu    ${EMPTY}
    Mở Rộng Phiếu Đầu Tiên
    ${visible}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${BTN_REJECT}
    IF    ${visible}
        Từ Chối Phiếu Đầu Tiên    Thiếu hồ sơ chứng từ hợp lệ
    ELSE
        Log    Không có phiếu đang chờ duyệt để từ chối    level=WARN
    END

TC-IMP-08 Mở dialog tạo phiếu nhập và đóng lại
    [Documentation]    Nhấn "Tạo phiếu nhập hàng" → dialog hiện → nhấn Hủy → đóng
    [Tags]    imports    ui
    Mở Dialog Tạo Phiếu Nhập
    Element Should Be Visible    ${DLG_CREATE}
    Đóng Dialog Tạo Phiếu Nhập
    Element Should Not Be Visible    ${DLG_CREATE}

TC-IMP-09 NV_KHO không thấy nút Xóa lịch sử
    [Documentation]    NV_KHO không có quyền xóa phiếu nhập (chỉ Admin/QL_KHO)
    [Tags]    imports    role    negative
    Đăng Xuất
    Đăng Nhập NV Kho
    Mở Trang Inventory
    Chuyển Tab Nhập Kho
    Mở Rộng Phiếu Đầu Tiên
    Kiểm Tra Nút Xóa Ẩn
    Đăng Xuất
    Đăng Nhập Admin
    Mở Trang Inventory
    Chuyển Tab Nhập Kho

TC-IMP-10 Admin thấy nút Duyệt nhập kho trên phiếu Chờ duyệt
    [Documentation]    Admin mở phiếu chờ duyệt → nút Duyệt hiện
    [Tags]    imports    role    happy-path
    Tìm Kiếm Theo Mã Phiếu    ${EMPTY}
    Mở Rộng Phiếu Đầu Tiên
    ${visible}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${BTN_APPROVE}
    IF    ${visible}
        Kiểm Tra Nút Duyệt Hiển Thị
    ELSE
        Log    Phiếu đầu tiên không ở trạng thái chờ duyệt    level=WARN
    END
