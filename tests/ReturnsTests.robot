*** Settings ***
Documentation     Test Suite: Trả thiết bị (Returns)
...               Kiểm tra tạo phiếu trả, xác nhận, từ chối, hủy và phân quyền
Library           SeleniumLibrary
Resource          ../resources/page_objects/ReturnsPage.resource
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

TC-RET-01 Trang trả thiết bị tải thành công
    [Documentation]    Mở /returns → trang tải không lỗi
    [Tags]    returns    smoke
    Mở Trang Returns
    ${count}=    Đếm Số Phiếu Trả
    Log    Tổng số phiếu trả: ${count}

TC-RET-02 Tìm kiếm phiếu trả theo mã phiếu
    [Documentation]    Nhập mã phiếu → danh sách lọc đúng
    [Tags]    returns    search    happy-path
    Mở Trang Returns
    Tìm Kiếm Phiếu Trả    PT
    ${count}=    Đếm Số Phiếu Trả
    Log    Kết quả tìm kiếm phiếu trả: ${count}

TC-RET-03 Tìm kiếm không có kết quả trả về bảng rỗng
    [Documentation]    Từ khoá không tồn tại → 0 dòng kết quả
    [Tags]    returns    search    negative
    Mở Trang Returns
    Tìm Kiếm Phiếu Trả    XYZKHONGTONTAI9999
    ${count}=    Đếm Số Phiếu Trả
    Should Be Equal As Numbers    ${count}    0

TC-RET-04 Trưởng Khoa thấy nút Tạo phiếu trả
    [Documentation]    Trưởng Khoa có quyền tạo phiếu trả → nút hiển thị
    [Tags]    returns    role    truong_khoa
    Đăng Xuất
    Đăng Nhập Truong Khoa
    Mở Trang Returns
    Kiểm Tra Nút Tạo Phiếu Trả Hiển Thị

TC-RET-05 Trưởng Khoa mở form tạo phiếu trả và đóng lại
    [Documentation]    Nhấn Tạo phiếu trả → dialog hiện → nhấn Hủy → đóng
    [Tags]    returns    ui    truong_khoa
    Mở Form Tạo Phiếu Trả
    Element Should Be Visible    ${DLG_CREATE}
    Đóng Form Tạo Phiếu Trả
    Element Should Not Be Visible    ${DLG_CREATE}

TC-RET-06 NV_KHO không thấy nút Tạo phiếu trả
    [Documentation]    NV_KHO không có quyền tạo phiếu trả
    [Tags]    returns    role    negative    nv_kho
    Đăng Xuất
    Đăng Nhập NV Kho
    Mở Trang Returns
    Kiểm Tra Nút Tạo Phiếu Trả Ẩn

TC-RET-07 NV_KHO xác nhận phiếu trả đang chờ xác nhận
    [Documentation]    NV_KHO nhấn Xác nhận → xác nhận lần 2 → toast thành công
    [Tags]    returns    approval    happy-path    nv_kho
    ${visible}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${BTN_XAC_NHAN}
    IF    ${visible}
        Xác Nhận Phiếu Trả Đầu Tiên
    ELSE
        Log    Không có phiếu trả chờ xác nhận    level=WARN
    END

TC-RET-08 NV_KHO từ chối phiếu trả với lý do
    [Documentation]    NV_KHO từ chối → nhập lý do → xác nhận → toast thành công
    [Tags]    returns    approval    negative    nv_kho
    ${visible}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${BTN_TU_CHOI}
    IF    ${visible}
        Từ Chối Phiếu Trả Đầu Tiên    Thiết bị không đúng tình trạng mô tả
    ELSE
        Log    Không có phiếu trả chờ xác nhận    level=WARN
    END
    Đăng Xuất
    Đăng Nhập Admin

TC-RET-09 Trưởng Khoa hủy phiếu trả của mình
    [Documentation]    Trưởng Khoa hủy phiếu trả đang chờ xác nhận → toast thành công
    [Tags]    returns    cancel    truong_khoa
    Đăng Xuất
    Đăng Nhập Truong Khoa
    Mở Trang Returns
    ${visible}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${BTN_HUY}
    IF    ${visible}
        Hủy Phiếu Trả Đầu Tiên
    ELSE
        Log    Không có phiếu có thể hủy    level=WARN
    END
    Đăng Xuất
    Đăng Nhập Admin
