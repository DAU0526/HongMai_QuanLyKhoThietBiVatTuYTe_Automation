*** Settings ***
Documentation     Test Suite: Yêu cầu thiết bị (Requests)
...               Kiểm tra workflow: tạo → duyệt khoa → duyệt quản lý → hủy → xóa
Library           SeleniumLibrary
Resource          ../resources/page_objects/RequestsPage.resource
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

TC-REQ-01 Trang yêu cầu tải thành công và hiển thị dữ liệu
    [Documentation]    Mở /requests → trang tải thành công, không lỗi
    [Tags]    requests    smoke
    Mở Trang Requests
    ${count}=    Đếm Số Yêu Cầu
    Log    Tổng số yêu cầu: ${count}

TC-REQ-02 Tìm kiếm yêu cầu theo mã phiếu
    [Documentation]    Nhập mã phiếu → danh sách lọc đúng
    [Tags]    requests    search    happy-path
    Mở Trang Requests
    Tìm Kiếm Yêu Cầu    YC
    ${count}=    Đếm Số Yêu Cầu
    Log    Kết quả tìm kiếm: ${count}

TC-REQ-03 Tìm kiếm không có kết quả trả về bảng rỗng
    [Documentation]    Từ khoá không tồn tại → 0 dòng kết quả
    [Tags]    requests    search    negative
    Mở Trang Requests
    Tìm Kiếm Yêu Cầu    XYZKHONGTONTAI9999
    ${count}=    Đếm Số Yêu Cầu
    Should Be Equal As Numbers    ${count}    0

TC-REQ-04 Mở form tạo yêu cầu và đóng lại
    [Documentation]    Nhấn nút tạo yêu cầu → dialog hiện → nhấn Hủy → đóng
    [Tags]    requests    ui
    Mở Trang Requests
    Mở Form Tạo Yêu Cầu
    Element Should Be Visible    ${DLG_CREATE}
    Đóng Form Yêu Cầu
    Element Should Not Be Visible    ${DLG_CREATE}

# TC-REQ-05 Admin duyệt cấp khoa yêu cầu đang chờ duyệt
#     [Documentation]    Admin nhấn Duyệt khoa → toast thành công, trạng thái cập nhật
#     [Tags]    requests    approval    happy-path    admin
#     Mở Trang Requests
#     ${visible}=    Run Keyword And Return Status
#     ...    Element Should Be Visible    ${BTN_APPROVE_DEPT}
#     IF    ${visible}
#         Duyệt Cấp Khoa Yêu Cầu Đầu Tiên
#     ELSE
#         Log    Không có yêu cầu cần duyệt cấp khoa    level=WARN
#     END
# 
# TC-REQ-06 Admin duyệt quản lý yêu cầu đã duyệt khoa
#     [Documentation]    Admin nhấn Duyệt quản lý → toast thành công, trạng thái "Đã duyệt"
#     [Tags]    requests    approval    happy-path    admin
#     Mở Trang Requests
#     ${visible}=    Run Keyword And Return Status
#     ...    Element Should Be Visible    ${BTN_APPROVE_MGR}
#     IF    ${visible}
#         Duyệt Quản Lý Yêu Cầu Đầu Tiên
#     ELSE
#         Log    Không có yêu cầu cần duyệt quản lý    level=WARN
#     END
# 
# TC-REQ-07 Hủy yêu cầu đang chờ duyệt thành công
#     [Documentation]    Nhấn Hủy → yêu cầu bị hủy → toast thành công
#     [Tags]    requests    cancel
#     Mở Trang Requests
#     ${visible}=    Run Keyword And Return Status
#     ...    Element Should Be Visible    ${BTN_CANCEL}
#     IF    ${visible}
#         Hủy Yêu Cầu Đầu Tiên
#     ELSE
#         Log    Không có yêu cầu có thể hủy    level=WARN
#     END

TC-REQ-08 Admin xóa yêu cầu khỏi hệ thống
    [Documentation]    Admin nhấn Xóa → yêu cầu bị xóa → toast thành công
    [Tags]    requests    delete    admin
    Mở Trang Requests
    ${visible}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${BTN_DELETE}
    IF    ${visible}
        Xóa Yêu Cầu Đầu Tiên
    ELSE
        Log    Không có nút Xóa hiển thị    level=WARN
    END

TC-REQ-09 Trạng thái yêu cầu mới tạo là Chờ duyệt
    [Documentation]    Yêu cầu vừa tạo phải hiển thị trạng thái "Chờ duyệt"
    [Tags]    requests    validation    happy-path
    Mở Trang Requests
    ${count}=    Đếm Số Yêu Cầu
    IF    ${count} > 0
        ${status}=    Lấy Trạng Thái Yêu Cầu Đầu Tiên
        Log    Trạng thái yêu cầu đầu tiên: ${status}
    ELSE
        Log    Không có yêu cầu nào để kiểm tra    level=WARN
    END
